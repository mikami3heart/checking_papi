#include <mpi.h>
#include <iostream>
#include <string>
#include <cstdio>
#include <cstdlib>
//	#include <stdio.h>
#include <math.h>
#include <omp.h>
#include "papi.h"
#define MATSIZE 1000

extern "C" void subkernel();
//	extern "C" void stream();
extern "C" int my_papi_add_events( int *, int );
extern "C" int my_papi_bind_start( long long *, int );
extern "C" int my_papi_bind_stop( long long *, int );
extern "C" void my_papi_name_to_code ( const char *, int *);

struct pmlib_papi {
	int num_events;         // number of PAPI events
	int events[20];         // PAPI events array
	long long values[20];   // PAPI values
};


using namespace std;

int main (int argc, char *argv[])
{
	double tt, t1, t2, t3, t4;
	int i, j, loop;
	int num_threads;
	int retval;
	int my_id, npes;

	pmlib_papi papi;

	std::string s_name[80] = {
		"PAPI_SP_OPS",	// for Xeon
		"PAPI_DP_OPS",	// for Xeon
		"PAPI_VEC_SP",	// Xeon
		"PAPI_VEC_DP",	// Xeon ==  |N0|2|*|N1|4|*|+||
 		//	Native Code[0]: 0x4000001b |FP_COMP_OPS_EXE:SSE_FP_PACKED_DOUBLE|
 		//	Native Code[1]: 0x4000001c |SIMD_FP_256:PACKED_DOUBLE|
		//	"PAPI_FP_INS",
		//	"PAPI_VEC_INS",	// NG on Xeon
		//	"PAPI_FMA_INS",
		//	"PAPI_FP_OPS",

	//	-O1
	//	#0, 80000067                              PAPI_SP_OPS  0
	//	#1, 80000068                              PAPI_DP_OPS  2537754537
	//	#2, 80000069                              PAPI_VEC_SP  0
	//	#3, 8000006a                              PAPI_VEC_DP  0
	//	-Ofast
	//	#0, 80000067                              PAPI_SP_OPS  0
	//	#1, 80000068                              PAPI_DP_OPS  2130905765
	//	#2, 80000069                              PAPI_VEC_SP  0
	//	#3, 8000006a                              PAPI_VEC_DP  2057554356



// Xeon E5
	//	"PAPI_FP_OPS",	// ivybridge (=PAPI_FP_INS) is not useful. 
	//	"PAPI_SP_OPS",	// ivybridge
	//	"PAPI_DP_OPS",	// ivybridge

// ivybridge
// ivybridge DP: 1 + 4*SSE_PACKED_SINGLE + 8*PACKED_SINGLE
	"FP_COMP_OPS_EXE:SSE_FP_SCALAR_SINGLE",
	"FP_COMP_OPS_EXE:SSE_PACKED_SINGLE",
	"SIMD_FP_256:PACKED_SINGLE",
// ivybridge SP: 1 + 2*SSE_FP_PACKED_DOUBLE" + 4*PACKED_DOUBLE
	//	"FP_COMP_OPS_EXE:SSE_SCALAR_DOUBLE",
	//	"FP_COMP_OPS_EXE:SSE_FP_PACKED_DOUBLE",
	//	"SIMD_FP_256:PACKED_DOUBLE",
	};
	papi.num_events = 1;
	papi.num_events = 2;
	papi.num_events += 2;
	papi.num_events += 2;
	//	papi.num_events += 2;
	//	papi.num_events += 1;

	const PAPI_hw_info_t *hwinfo = NULL;

	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &my_id);
	MPI_Comm_size(MPI_COMM_WORLD, &npes);

	num_threads  = omp_get_max_threads();
	if(my_id == 0) {
		fprintf(stderr,"<main> npes=%d max_threads=%d\n", npes, num_threads);
		}
	retval = PAPI_library_init( PAPI_VER_CURRENT );
	if(retval != PAPI_VER_CURRENT ) {
		fprintf(stderr,"*** <main> <PAPI_library_init> failed for rank=%d\n", my_id);
		}
	retval = PAPI_thread_init( (unsigned long (*)(void)) (omp_get_thread_num) );
	if(retval != PAPI_OK) {
		fprintf(stderr,"*** <main> <PAPI_thread_init> failed for rank=%d\n", my_id);
		}
	hwinfo = PAPI_get_hardware_info();
	if (hwinfo == NULL) {
		fprintf(stderr,"*** <main> <PAPI_get_hardware_info> failed.\n" );
		}
	fprintf(stderr,"\t%d\n", hwinfo->vendor);
	fprintf(stderr,"\t%s\n", hwinfo->vendor_string);
	fprintf(stderr,"\t%d\n", hwinfo->model);
	fprintf(stderr,"\t%s\n", hwinfo->model_string);

	// loop through all the events
	for (int i=0; i<papi.num_events; i++) {
	my_papi_name_to_code(s_name[i].c_str(), &papi.events[i]);
	fprintf(stderr, " i=%2d: %s: events:%x\n", i, s_name[i].c_str(), papi.events[i]);
	papi.values[i] = 0;
	}

	t1=MPI_Wtime();
    retval = my_papi_add_events (papi.events, papi.num_events);
	retval = my_papi_bind_start (papi.values, papi.num_events);


	subkernel();


	retval = my_papi_bind_stop ( papi.values, papi.num_events);
	t2=MPI_Wtime();
	MPI_Barrier(MPI_COMM_WORLD);
	if(my_id == 0) { fprintf(stderr,"step %d finished in %f seconds\n", i,(t2-t1));}

	cout << "The counted events are:" << endl;
	for (int i=0; i<papi.num_events; i++) {
		fprintf(stderr,"#%d, %x %40s  %lld\n", i, papi.events[i], s_name[i].c_str(), papi.values[i]);
	}


MPI_Finalize();
return 0;
}

