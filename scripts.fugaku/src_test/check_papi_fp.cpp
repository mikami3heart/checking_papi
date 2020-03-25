#include <mpi.h>
#include <iostream>
#include <string>
#include <cstdio>
#include <cstdlib>
//	#include <stdio.h>
#include <math.h>
#ifdef _OPENMP
#include <omp.h>
#endif
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


// Fugaku A64FX

	//	//	"PAPI_FP_OPS",	// == "FP_SCALE_OPS_SPEC" * 512/128 + "FP_FIXED_OPS_SPEC"
	//	"FP_SCALE_OPS_SPEC",	// unknown CSIZE in papi_native_avail output should be 512 ...
	//	"FP_FIXED_OPS_SPEC",	// appears to be # of scalar operations

	//	// floating point operations measured in some strange unit "512/128"
	//	"FP_DP_SCALE_OPS_SPEC",
	//	"FP_SP_SCALE_OPS_SPEC",

	"FP_DP_SCALE_OPS_SPEC",
	"FP_DP_FIXED_OPS_SPEC",
	"FP_SP_SCALE_OPS_SPEC",
	"FP_SP_FIXED_OPS_SPEC",

	// predicate ???
	"FLA_VAL_PRD_CNT",
	"FLB_VAL_PRD_CNT",

	//	"PAPI_DP_OPS",
	//	"PAPI_SP_OPS",
	//	"VFP_SPEC",	// floating-point data-processing instructions.
	//	"FP_SPEC",	// == "PAPI_FP_INS",

	"FP_FMA_SPEC",
	//	"SVE_FP_FMA_SPEC", // not supported...

	// instructions
	"PAPI_FP_INS",	// scalar, Advanced SIMD, and SVE instructions. See F.P. instr of SVE Ref. Manual.
	"PAPI_VEC_INS",	// Vector/SIMD instr (could include integer) //	"PAPI_VEC_INS" == "SIMD_INST_RETIRED" == "SVE_INST_RETIRED",
	"PAPI_FMA_INS",	// == "FP_FMA_SPEC",	// can be mostly scalar FMA
	//	as a result, we will use ...

/*

*/
	};

	//	papi.num_events = 2;
	//	papi.num_events = 3;
	//	papi.num_events = 4;
	//	papi.num_events = 5;
	papi.num_events = 6;
	//	papi.num_events = 7;

	const PAPI_hw_info_t *hwinfo = NULL;

	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &my_id);
	MPI_Comm_size(MPI_COMM_WORLD, &npes);

#ifdef _OPENMP
	num_threads  = omp_get_max_threads();
#else
	num_threads  = 1;
#endif
	if(my_id == 0) {
		printf("<main> npes=%d max_threads=%d\n", npes, num_threads);
		}
	retval = PAPI_library_init( PAPI_VER_CURRENT );
	if(retval != PAPI_VER_CURRENT ) {
		printf("*** <main> <PAPI_library_init> failed for rank=%d\n", my_id);
		}
#ifdef _OPENMP
	retval = PAPI_thread_init( (unsigned long (*)(void)) (omp_get_thread_num) );
	if(retval != PAPI_OK) {
		printf("*** <main> <PAPI_thread_init> failed for rank=%d\n", my_id);
		}
#endif
	hwinfo = PAPI_get_hardware_info();
	if (hwinfo == NULL) {
		printf ( "*** <main> <PAPI_get_hardware_info> failed.\n" );
		}
	//	printf("\t%d\n", hwinfo->vendor);
	//	printf("\t%s\n", hwinfo->vendor_string);
	//	printf("\t%d\n", hwinfo->model);
	//	printf("\t%s\n", hwinfo->model_string);
	//	printf("\trevision : %f\n", hwinfo->revision);
	//	printf("\tcpuid_family : %d\n", hwinfo->cpuid_family);
	//	printf("\tcpuid_model  : %d\n", hwinfo->cpuid_model );
	//	printf("\tcpuid_stepping %d\n", hwinfo->cpuid_stepping );

	// loop through all the events
	for (int i=0; i<papi.num_events; i++) {
	my_papi_name_to_code(s_name[i].c_str(), &papi.events[i]);
	//	printf( " i=%2d: %s: events:%x\n", i, s_name[i].c_str(), papi.events[i]);
	papi.values[i] = 0;
    retval = my_papi_add_events (&papi.events[i], 1);
	if(retval != 0) { printf("*** Error for event [%d]\n", i); }
	}

	t1=MPI_Wtime();
    //	retval = my_papi_add_events (papi.events, papi.num_events);
	retval = my_papi_bind_start (papi.values, papi.num_events);


	subkernel();


	retval = my_papi_bind_stop ( papi.values, papi.num_events);
	t2=MPI_Wtime();
	MPI_Barrier(MPI_COMM_WORLD);
	if(my_id == 0) { printf("step %d finished in %f seconds\n", i,(t2-t1));}

	cout << "The counted events are:" << endl;
	for (int i=0; i<papi.num_events; i++) {
		printf ( "#%d, %x %40s  %lld\n", i, papi.events[i], s_name[i].c_str(), papi.values[i]);
	}


MPI_Finalize();
return 0;
}

