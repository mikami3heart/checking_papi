#include <iostream>
#include <string>
#include <cstdio>
#include <cstdlib>
//	#include <stdio.h>
#include <math.h>
#include <omp.h>
#include "papi.h"
#define MATSIZE 1000

extern "C" void set_array(), sub_kernel();
//	extern "C" void subkernel();
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

extern "C" struct matrix;

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
//
// important remark for Broadwell
// Broadwell can count only 4 events at a time!!!
//
	//	"FP_ARITH:PACKED",
	//	PACKED == 128B_PACKED_SINGLE + 256B_PACKED_SINGLE
	//	"FP_ARITH:SINGLE",
	//	SINGLE == SCALAR_SINGLE + 128B_PACKED_SINGLE + 256B_PACKED_SINGLE
	//	"FP_ARITH:DOUBLE",
	//	DOUBLE == SCALAR_DOUBLE + 128B_PACKED_DOUBLE + 256B_PACKED_DOUBLE

	//	"FP_ARITH:SCALAR_SINGLE",
	//	"FP_ARITH:128B_PACKED_SINGLE",
	//	"FP_ARITH:256B_PACKED_SINGLE",
	//	"FP_ARITH:SCALAR_DOUBLE",
	//	"FP_ARITH:128B_PACKED_DOUBLE",
	//	"FP_ARITH:256B_PACKED_DOUBLE",


	//
// Xeon E5
	"PAPI_SP_OPS",	// |DERIVED_POSTFIX|
					//	|N0|N1|4|*|+|N2|8|*|+||
					//	Native Code[0]: 0x4000002b |FP_ARITH:SCALAR_SINGLE|
					//	Native Code[1]: 0x4000002c |FP_ARITH:128B_PACKED_SINGLE|
					//	Native Code[2]: 0x4000002d |FP_ARITH:256B_PACKED_SINGLE|
	"PAPI_DP_OPS",
	//	"PAPI_FP_OPS",	// ivybridge (=PAPI_FP_INS) is not useful. 

// ivybridge
// ivybridge DP: 1 + 4*SSE_PACKED_SINGLE + 8*PACKED_SINGLE
	//	"FP_COMP_OPS_EXE:SSE_FP_SCALAR_SINGLE",
	//	"FP_COMP_OPS_EXE:SSE_PACKED_SINGLE",
	//	"SIMD_FP_256:PACKED_SINGLE",
// ivybridge SP: 1 + 2*SSE_FP_PACKED_DOUBLE" + 4*PACKED_DOUBLE
	//	"FP_COMP_OPS_EXE:SSE_SCALAR_DOUBLE",
	//	"FP_COMP_OPS_EXE:SSE_FP_PACKED_DOUBLE",
	//	"SIMD_FP_256:PACKED_DOUBLE",
	};

// Broadwell can count only 4 events at a time!!!
	//	papi.num_events = 1;
	//	papi.num_events = 4;
	papi.num_events = 2;

	const PAPI_hw_info_t *hwinfo = NULL;

	my_id=0;
	npes=1;

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
	//	fprintf(stderr,"\t%d\n", hwinfo->vendor);
	//	fprintf(stderr,"\t%s\n", hwinfo->vendor_string);
	//	fprintf(stderr,"\t%d\n", hwinfo->model);
	fprintf(stderr,"\t%s\n", hwinfo->model_string);

	// loop through all the events
	for (int i=0; i<papi.num_events; i++) {
	my_papi_name_to_code(s_name[i].c_str(), &papi.events[i]);
	//	fprintf(stderr, " i=%2d: %s: events:%x\n", i, s_name[i].c_str(), papi.events[i]);
	papi.values[i] = 0;
	}

	set_array();
	retval = my_papi_add_events (papi.events, papi.num_events);
	retval = my_papi_bind_start (papi.values, papi.num_events);
	sub_kernel();
	retval = my_papi_bind_stop ( papi.values, papi.num_events);
	//	retval = my_papi_bind_start (papi.values, papi.num_events);
	//	subkernel();
	//	retval = my_papi_bind_stop ( papi.values, papi.num_events);
	//	retval = my_papi_bind_start (papi.values, papi.num_events);
	//	subkernel();
	//	retval = my_papi_bind_stop ( papi.values, papi.num_events);

	cout << "The counted events are:" << endl;
	for (int i=0; i<papi.num_events; i++) {
		fprintf(stderr,"#%d, %x %40s  %lld\n", i, papi.events[i], s_name[i].c_str(), papi.values[i]);
	}


return 0;
}

