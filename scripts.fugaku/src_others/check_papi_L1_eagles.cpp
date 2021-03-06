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
    "MEM_LOAD_UOPS_RETIRED:HIT_LFB",
    "MEM_LOAD_UOPS_RETIRED:L1_HIT",

		//	"PAPI_LD_INS",	// for Xeon
		//	"PAPI_SR_INS",	// for Xeon
		//	"PAPI_L1_TCM",
		//	"PAPI_SP_OPS",	// for Xeon
		//	"PAPI_DP_OPS",	// for Xeon
		//	"PAPI_VEC_SP",	// Xeon
		//	"PAPI_VEC_DP",	// Xeon ==  |N0|2|*|N1|4|*|+||
 		//	Native Code[0]: 0x4000001b |FP_COMP_OPS_EXE:SSE_FP_PACKED_DOUBLE|
 		//	Native Code[1]: 0x4000001c |SIMD_FP_256:PACKED_DOUBLE|
		//	"PAPI_FP_INS",
		//	"PAPI_VEC_INS",	// NG on Xeon

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
	"FP_COMP_OPS_EXE:SSE_SCALAR_DOUBLE",
	"FP_COMP_OPS_EXE:SSE_FP_PACKED_DOUBLE",
	"SIMD_FP_256:PACKED_DOUBLE",
	};
	papi.num_events = 2;
	papi.num_events += 2;
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

/*
 i= 0: MEM_LOAD_UOPS_RETIRED:HIT_LFB: events:40000023
 i= 1: MEM_LOAD_UOPS_RETIRED:L1_HIT: events:40000024
 i= 2: FP_COMP_OPS_EXE:SSE_FP_SCALAR_SINGLE: events:40000017
 i= 3: FP_COMP_OPS_EXE:SSE_PACKED_SINGLE: events:40000019
 i= 4: SIMD_FP_256:PACKED_SINGLE: events:4000001a
 i= 5: FP_COMP_OPS_EXE:SSE_SCALAR_DOUBLE: events:40000016
 i= 6: FP_COMP_OPS_EXE:SSE_FP_PACKED_DOUBLE: events:4000001b
 i= 7: SIMD_FP_256:PACKED_DOUBLE: events:4000001c
step 0 finished in 0.202921 seconds
The counted events are:
#0, 40000023            MEM_LOAD_UOPS_RETIRED:HIT_LFB  14292683
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L1_HIT  329373782
#2, 40000017     FP_COMP_OPS_EXE:SSE_FP_SCALAR_SINGLE  0
#3, 40000019        FP_COMP_OPS_EXE:SSE_PACKED_SINGLE  0
#4, 4000001a                SIMD_FP_256:PACKED_SINGLE  0
#5, 40000016        FP_COMP_OPS_EXE:SSE_SCALAR_DOUBLE  73466894
#6, 4000001b     FP_COMP_OPS_EXE:SSE_FP_PACKED_DOUBLE  0
#7, 4000001c                SIMD_FP_256:PACKED_DOUBLE  514427166
*/
