//	#include <mpi.h>
#include <iostream>
#include <string>
#include <cstdio>
#include <cstdlib>
//	#include <stdio.h>
#include <math.h>
#include <omp.h>
#include "papi.h"
#define MATSIZE 1000

extern "C" void set_array();
//	extern "C" void subkerel();
extern "C" void stream();
extern "C" int my_papi_add_events( int *, int );
extern "C" int my_papi_bind_start( int *, long long *, int );
extern "C" int my_papi_bind_stop( int *, long long *, int );
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

	std::string s_name[20] = {
		//	"PAPI_FMA_INS",	// FX100
		//	//	"PAPI_FMA_INS:FMA_INSTRUCTIONS",	// FX100
		//	//	"PAPI_FMA_INS:XSIMD_FMA_INSTRUCTIONS",	// FX100
		//	"FMA_INSTRUCTIONS",	// FX100
		//	"XSIMD_FMA_INSTRUCTIONS",	// FX100
		"PAPI_FP_INS",	// FX100
		"XSIMD_FLOATING_INSTRUCTIONS",	// FX100
		"FLOATING_INSTRUCTIONS",	// FX100
		//	"PAPI_VEC_INS",	// FX100
		//	"XSIMD_FLOATING_INSTRUCTIONS",	// FX100
		//	"XSIMD_FMA_INSTRUCTIONS",	// FX100
	};

	papi.num_events = 3;

	const PAPI_hw_info_t *hwinfo = NULL;

	my_id = 0;
	npes = 1;

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
	retval = PAPI_query_event( PAPI_FP_OPS );
	if ( retval != PAPI_OK ) {
		printf ( "*** <main> basic support for PAPI_FP_OPS is missing.\n" );
		}
	hwinfo = PAPI_get_hardware_info();
	if (hwinfo == NULL) {
		printf ( "*** <main> <PAPI_get_hardware_info> failed.\n" );
		}

	printf( "Initial state:\n");
	// loop through all the events
	for (int i=0; i<papi.num_events; i++) {
	my_papi_name_to_code(s_name[i].c_str(), &papi.events[i]);
			printf( " i=%2d: %s: events:%x\n", i, s_name[i].c_str(), papi.events[i]);
	papi.values[i] = 0;
	}

#pragma omp parallel private(retval)
{
	int i_thread = omp_get_thread_num();
	pmlib_papi th_papi = papi;

    retval = my_papi_add_events (th_papi.events, th_papi.num_events);
	retval = my_papi_bind_start (th_papi.events, th_papi.values, th_papi.num_events);

	if ( retval != PAPI_OK ) {
		printf ( "*** <my_papi_bind_start> failed for thread=%d, code=%d\n",
											i_thread, retval );
		}
}

	printf( "Start stream():\n");

	loop=1;
	for (i=1; i<=loop; i++){
		//	t1=MPI_Wtime();
		//	subkerel();
		stream();
		//	t2=MPI_Wtime();
		//	MPI_Barrier(MPI_COMM_WORLD);
		//	if(my_id == 0) { printf("step %d finished in %f seconds\n", i,(t2-t1));}
	}
	printf( "Finished stream(): summing the events\n");

long long sum=0;
#pragma omp parallel 
{
	pmlib_papi th_papi = papi;
	int i_thread = omp_get_thread_num();
	retval = my_papi_bind_stop ( th_papi.events, th_papi.values, th_papi.num_events);
	if ( retval != PAPI_OK ) { printf ( "*** Error <my_papi_bind_stop>\n" ); }

#pragma omp critical
	{
	//	printf ( "event # and code for thread %d:\n", i_thread);
	for (int i=0; i<th_papi.num_events; i++) {
		//	printf ( "#%d, %x %lld\n", i, th_papi.events[i], th_papi.values[i]);
		papi.values[i] += th_papi.values[i];
	}
	}
}

	cout << "The sum of threads:" << endl;
	for (int i=0; i<papi.num_events; i++) {
		printf ( "#%d, %x %32s  %lld\n", i, papi.events[i], s_name[i].c_str(), papi.values[i]);
	}

//	MPI_Finalize();
return 0;
}

//		PAPI_LD_INS/PAPI_SR_INS can not be used with PAPI_SP_OPS/PAPI_DP_OPS

/*
CFLAGS="-g -O0 ..."
The sum of threads:
#0, 80000067 PAPI_SP_OPS  0
#1, 80000068 PAPI_DP_OPS  99275330
#2, 80000066 PAPI_FP_OPS  99275875
#3, 80000034 PAPI_FP_INS  99275875
#4, 80000069 PAPI_VEC_SP  0
#5, 8000006a PAPI_VEC_DP  0

CFLAGS="-O2 ..."
The sum of threads:
#0, 80000067 PAPI_SP_OPS  0
#1, 80000068 PAPI_DP_OPS  231613560
#2, 80000066 PAPI_FP_OPS  561
#3, 80000034 PAPI_FP_INS  561
#4, 80000069 PAPI_VEC_SP  0
#5, 8000006a PAPI_VEC_DP  231613494

CFLAGS="-O3 -xHost ..."
The sum of threads:
#0, 80000067 PAPI_SP_OPS  0
#1, 80000068 PAPI_DP_OPS  386875721
#2, 80000066 PAPI_FP_OPS  562
#3, 80000034 PAPI_FP_INS  562
#4, 80000069 PAPI_VEC_SP  0
#5, 8000006a PAPI_VEC_DP  386875652


-O0
The sum of threads:
#0, 80000035 PAPI_LD_INS  661326549
#1, 80000036 PAPI_SR_INS  181680472

-O2
#0, 80000035 PAPI_LD_INS  93137236
#1, 80000036 PAPI_SR_INS  49452560

-xHost
The sum of threads:
#0, 80000035 PAPI_LD_INS  59315580
#1, 80000036 PAPI_SR_INS  30643218

*/
