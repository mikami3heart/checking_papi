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

extern "C" void set_array();
extern "C" void subkernel();
//	extern "C" void stream();
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

	std::string s_name[80] = {
		//	"PAPI_SP_OPS",	// for Xeon
		//	"PAPI_DP_OPS",	// for Xeon
		//	"PAPI_FP_OPS",	// for Xeon/SPARC64
		//	"PAPI_FP_INS",	// Xeon
		//	"PAPI_VEC_SP",	// Xeon
		//	"PAPI_VEC_DP",	// Xeon

// Xeon E5
	"PAPI_FP_OPS",	// ivybridge
	"FP_COMP_OPS_EXE",	// ivybridge
	"FP_COMP_OPS_EXE:SSE_FP_PACKED_DOUBLE",	// ivybridge
	"FP_COMP_OPS_EXE:SSE_FP_SCALAR_SINGLE",	// ivybridge
	"FP_COMP_OPS_EXE:SSE_PACKED_SINGLE",	// ivybridge
	"FP_COMP_OPS_EXE:SSE_SCALAR_DOUBLE",	// ivybridge
	};
	papi.num_events = 6;


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
	retval = PAPI_query_event( PAPI_FP_OPS );
	if ( retval != PAPI_OK ) {
		printf ( "*** <main> basic support for PAPI_FP_OPS is missing.\n" );
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

	subkernel();


	retval = my_papi_bind_stop ( th_papi.events, th_papi.values, th_papi.num_events);
	if ( retval != PAPI_OK ) { printf ( "*** Error <my_papi_bind_stop>\n" ); }

#pragma omp critical
	{
	for (int i=0; i<th_papi.num_events; i++) {
		printf ("thread %d: event %d, %x %lld\n", i_thread, i, th_papi.events[i], th_papi.values[i]);
		papi.values[i] += th_papi.values[i];
	}
	}
}

	t2=MPI_Wtime();
	MPI_Barrier(MPI_COMM_WORLD);
	if(my_id == 0) { printf("step %d finished in %f seconds\n", i,(t2-t1));}

	cout << "The sum of threads:" << endl;
	for (int i=0; i<papi.num_events; i++) {
		printf ( "#%d, %x %32s  %lld\n", i, papi.events[i], s_name[i].c_str(), papi.values[i]);
	}


MPI_Finalize();
return 0;
}

