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

	//	"PAPI_FP_OPS",
	//	"PAPI_DP_OPS",
	//	"PAPI_SP_OPS",

	//	"PAPI_DP_OPS",	// not available error  on FX100
	//	"PAPI_SP_OPS",	// not available error  on FX100

	// FX100
	//	"PAPI_FP_OPS",	// good
	//	"16FLOPS_INSTRUCTIONS",	// good
	//	"8FLOPS_INSTRUCTIONS",	// good
	//	"4FLOPS_INSTRUCTIONS",	// good
	//	"2FLOPS_INSTRUCTIONS",	// good
	//	"1FLOPS_INSTRUCTIONS",	// good
	//	"PAPI_FP_INS",	// good
	//	"PAPI_VEC_INS",	// good
	//	"PAPI_FMA_INS",	// good

	"FLOATING_INSTRUCTIONS",	// good
	"FMA_INSTRUCTIONS",	// good
	//	"SIMD_FLOATING_INSTRUCTIONS",	// returns 0
	//	"SIMD_FMA_INSTRUCTIONS",	// returns 0
	//	"4SIMD_FLOATING_INSTRUCTIONS",	// good
	//	"4SIMD_FMA_INSTRUCTIONS",	// good
	"XSIMD_FLOATING_INSTRUCTIONS",	// good
	"XSIMD_FMA_INSTRUCTIONS",	// good
	//	#0, 40000010                    FLOATING_INSTRUCTIONS  2000
	//	#1, 40000011                         FMA_INSTRUCTIONS  0
	//	#2, 40000008               SIMD_FLOATING_INSTRUCTIONS  0
	//	#3, 40000009                    SIMD_FMA_INSTRUCTIONS  0
	//	#0, 4000007d              4SIMD_FLOATING_INSTRUCTIONS  250000
	//	#1, 4000007e                   4SIMD_FMA_INSTRUCTIONS  250000000
	//	#2, 400000d1              XSIMD_FLOATING_INSTRUCTIONS  250000
	//	#3, 400000d2                   XSIMD_FMA_INSTRUCTIONS  250000000

	//	#0, 4000007b                     16FLOPS_INSTRUCTIONS  0
	//	#1, 4000007a                      8FLOPS_INSTRUCTIONS  250000000
	//	#2, 40000079                      4FLOPS_INSTRUCTIONS  0
	//	#3, 40000078                      2FLOPS_INSTRUCTIONS  0
	//	#4, 40000077                      1FLOPS_INSTRUCTIONS  1000

	//	#0, 80000034                              PAPI_FP_INS  252000
	//	#1, 80000038                             PAPI_VEC_INS  250250000
	//	#2, 80000030                             PAPI_FMA_INS  250000000

/*
	"SIMD_FLOATING_INSTRUCTIONS",	// returns 0
	"SIMD_FMA_INSTRUCTIONS",	// returns 0

	"FLOATING_INSTRUCTIONS",	// good
	"FMA_INSTRUCTIONS",	// good
	"XSIMD_FLOATING_INSTRUCTIONS",	// good
	"XSIMD_FMA_INSTRUCTIONS",	// good
*/

	};
	//	papi.num_events = 2;
	//	papi.num_events = 3;
	//	papi.num_events = 4;
	//	papi.num_events = 5;
	//	papi.num_events = 6;
	papi.num_events = 7;

	const PAPI_hw_info_t *hwinfo = NULL;

	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &my_id);
	MPI_Comm_size(MPI_COMM_WORLD, &npes);

	num_threads  = omp_get_max_threads();
	if(my_id == 0) {
		printf("<main> npes=%d max_threads=%d\n", npes, num_threads);
		}
	retval = PAPI_library_init( PAPI_VER_CURRENT );
	if(retval != PAPI_VER_CURRENT ) {
		printf("*** <main> <PAPI_library_init> failed for rank=%d\n", my_id);
		}
	retval = PAPI_thread_init( (unsigned long (*)(void)) (omp_get_thread_num) );
	if(retval != PAPI_OK) {
		printf("*** <main> <PAPI_thread_init> failed for rank=%d\n", my_id);
		}
	hwinfo = PAPI_get_hardware_info();
	if (hwinfo == NULL) {
		printf ( "*** <main> <PAPI_get_hardware_info> failed.\n" );
		}
	printf("\t%d\n", hwinfo->vendor);
	printf("\t%s\n", hwinfo->vendor_string);
	printf("\t%d\n", hwinfo->model);
	printf("\t%s\n", hwinfo->model_string);

	// loop through all the events
	for (int i=0; i<papi.num_events; i++) {
	my_papi_name_to_code(s_name[i].c_str(), &papi.events[i]);
	printf( " i=%2d: %s: events:%x\n", i, s_name[i].c_str(), papi.events[i]);
	papi.values[i] = 0;
	}

	t1=MPI_Wtime();
    retval = my_papi_add_events (papi.events, papi.num_events);
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

