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

	"LOAD_STORE_INSTRUCTIONS",
	"SIMD_LOAD_STORE_INSTRUCTIONS",
	"4SIMD_LOAD_STORE_INSTRUCTIONS",
	// "XSIMD_LOAD_STORE_INSTRUCTIONS",

	"PAPI_L1_TCM", // PAPI_L1_TCM = L1D_MISS + L1I_MISS
		//	"L1D_MISS",
		//	"L1I_MISS",
		//	"L1D_MISS",	// L1D_MISS = L1D_MISS_DM + L1D_MISS_PF + L1D_MISS_QPF
		//	"L1D_MISS_DM",
		//	"L1D_MISS_PF",
		//	"L1D_MISS_QPF",

	"PAPI_L2_TCM",	// PAPI_L2_TCM = L2_MISS_DM + L2_MISS_PF
	//	"L2_MISS_DM",
	//	"L2_MISS_PF",
	//	"L2_WB_DM",
	//	"L2_WB_PF",

	// FX100
	//	"PAPI_VEC_INS",	// good
	//	"PAPI_FMA_INS",	// good

	//	"EX_LOAD_INSTRUCTIONS",
	//	"EX_STORE_INSTRUCTIONS",
	//	"FL_LOAD_INSTRUCTIONS",
	//	"FL_STORE_INSTRUCTIONS",
	//	"SIMD_FL_LOAD_INSTRUCTIONS",
	//	"SIMD_FL_STORE_INSTRUCTIONS",
	//	"4SIMD_FL_LOAD_INSTRUCTIONS",
	//	"4SIMD_FL_STORE_INSTRUCTIONS",

	//	"LOAD_STORE_INSTRUCTIONS",
	//	"SIMD_LOAD_STORE_INSTRUCTIONS",
	//	"4SIMD_LOAD_STORE_INSTRUCTIONS",

	//	"XSIMD_LOAD_STORE_INSTRUCTIONS",

	// -O2
	//	#0, 80000006                              PAPI_L1_TCM  93895711
	//	#1, 80000007                              PAPI_L2_TCM  62680791
	//	#2, 4000000e                  LOAD_STORE_INSTRUCTIONS  4005002491
	//	#3, 400000d0            XSIMD_LOAD_STORE_INSTRUCTIONS  0


	// -Kfast
	//	#0, 80000006                              PAPI_L1_TCM  31516880
	//	#1, 80000007                              PAPI_L2_TCM  179640
	//	#2, 4000000e                  LOAD_STORE_INSTRUCTIONS  300492
	//	#3, 400000d0            XSIMD_LOAD_STORE_INSTRUCTIONS  1000950001

	};
	//	papi.num_events = 1;
	//	papi.num_events = 2;
	//	papi.num_events = 3;
	//	papi.num_events = 4;
	papi.num_events = 5;
	//	papi.num_events = 6;
	//	papi.num_events = 7;
	//	papi.num_events = 8;

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

