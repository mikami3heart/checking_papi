// Test code for serial run
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
extern "C" void stream();
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

//
// important remark for Broadwell
// Broadwell can count only 4 events at a time!!!
//

	//	"PAPI_L1_TCM",	// derived "L1D:REPLACEMENT"+"L2_RQSTS:ALL_CODE_RD"
	//	"PAPI_L2_TCM",	// native  "LLC_REFERENCES"
	//	"PAPI_LD_INS",	// == "MEM_UOP_RETIRED:ANY_LOADS"
			// == "MEM_UOPS_RETIRED:ALL_LOADS",	// PAPI 5.5.1
	//	"PAPI_SR_INS",	// == "MEM_UOP_RETIRED:ANY_STORES"
			// == "MEM_UOPS_RETIRED:ALL_STORES",	// PAPI 5.5.1

	"MEM_LOAD_UOPS_RETIRED:HIT_LFB",
	"MEM_LOAD_UOPS_RETIRED:L1_HIT",
	"MEM_LOAD_UOPS_RETIRED:L2_HIT",
	"MEM_LOAD_UOPS_RETIRED:L3_HIT",

	"MEM_LOAD_UOPS_RETIRED:L1_MISS",
	"MEM_LOAD_UOPS_RETIRED:L2_MISS",
	"MEM_LOAD_UOPS_RETIRED:L3_MISS",
	//	"OFFCORE_REQUESTS:ALL_DATA_RD",
	//NG	"PAPI_L1_TCM",	// ICACHE:MISSES + L1D:REPLACEMENT
	//NG	"PAPI_L2_TCM",	// counts demand requests missed L2
	//	"PAPI_L3_TCM",	// counts demand requests missed L3
	//	"PAPI_L1_TCA",	// Not available.
	//	"PAPI_L1_TCH",	// Not available
	//	"LLC_REFERENCES",	// == PAPI_L2_TCM
	//	"LLC_MISSES",		// == PAPI_L3_TCM
	//	"L2_RQSTS:ALL_CODE_RD",
	//	"L2_RQSTS:ALL_DEMAND_DATA_RD",
	//	"L2_RQSTS:ALL_PF",
	//	"L2_RQSTS:ALL_RFO",	// request for ownership
	//	"L2_RQSTS:ALL_DEMAND_RD_HIT",
	//	"L2_RQSTS:PF_HIT",	// L2 hardware prefetchers that hit L2 $
	//	"L2_RQSTS:PF_MISS",	// L1/L2/L3 hardware prefetchers that miss L2 $
	//	"L2_RQSTS:RFO_MISS",	// request for ownership for write 
	//	"L2_RQSTS:RFO_HIT",

	//	"L2_TRANS:ALL",

	//	"L2_TRANS:ALL_PF",
	//	"L2_TRANS:RFO",
	//	"L2_TRANS:L2_WB",
	//	"L2_TRANS:L1D_WB",
	//	"L2_TRANS:DMND_DATA_RD",
	//	"L2_TRANS:CODE_RD",
	//	"L2_TRANS:L2_FILL",

	//	"OFFCORE_RESPONSE_0:ANY_RESPONSE",
	//	"OFFCORE_RESPONSE_0:ANY_DATA",
	//	"OFFCORE_RESPONSE_0:ANY_RFO",
	//	"OFFCORE_RESPONSE_0:PF_DATA_RD",
	//	"OFFCORE_RESPONSE_0:PF_RFO",
	//	"OFFCORE_RESPONSE_0:DMND_RFO",
	//	"OFFCORE_RESPONSE_0:DMND_DATA_RD",
	//	"OFFCORE_RESPONSE_0:WB",
	//	"OFFCORE_RESPONSE_0:L3_MISS",
	//	"OFFCORE_RESPONSE_1:L3_MISS",
	//	"OFFCORE_RESPONSE_0:LLC_DATA_RD",
	//	"PAPI_PRF_DM",	// Not available
	//	"OFFCORE_RESPONSE_0:DMND_DATA_RD",
	//	"OFFCORE_RESPONSE_1:DMND_DATA_RD",
	//	"OFFCORE_REQUESTS:ALL_DATA_RD",
	//	"OFFCORE_REQUESTS:DEMAND_DATA_RD",

/*
	num_ins_load = PAPI_LD_INS	;
	num_ins_store = PAPI_SR_INS	;
	hit_LFB = MEM_LOAD_UOPS_RETIRED:HIT_LFB	;
	hit_L1 = MEM_LOAD_UOPS_RETIRED:L1_HIT	;
	miss_L1 = PAPI_L1_TCM	;
	miss_L2= PAPI_L2_TCM	;
	all_L2 = L2_TRANS:ALL	;
	
	num_load_store = num_ins_load + num_ins_store
	L1_hit_rate = (hit_LFB + hit_L1) /
					(hit_LFB + hit_L1 + miss_L1)
	L2_hit_rate = (hit_LFB + hit_L1 + miss_L1) /
					(hit_LFB + hit_L1 + miss_L1 + miss_L2)
	sustained_L2_BW = 64*all_L2/time
	effective_L2_BW = 64*miss_L1/time
*/


	};
	//	papi.num_events = 1;
	papi.num_events = 2;
	papi.num_events += 2;
	//	papi.num_events += 2;
	//	papi.num_events += 2;
	papi.num_events += 1;

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

	retval = my_papi_add_events (papi.events, papi.num_events);
	retval = my_papi_bind_start (papi.values, papi.num_events);

	subkernel();
	//	stream();

	retval = my_papi_bind_stop ( papi.values, papi.num_events);

	cout << "The counted events are:" << endl;
	for (int i=0; i<papi.num_events; i++) {
		fprintf(stderr,"#%d, %x %40s  %lld\n", i, papi.events[i], s_name[i].c_str(), papi.values[i]);
	}


return 0;
}

// sub_kernel.c results: Measured counter events on Xeon E5

/*
-O0
step 0 finished in 5.448525 seconds

#0, 80000035                              PAPI_LD_INS  14016148663
#1, 80000036                              PAPI_SR_INS  2006004045
#2, 40000023            MEM_LOAD_UOPS_RETIRED:HIT_LFB  304641
#3, 40000024             MEM_LOAD_UOPS_RETIRED:L1_HIT  14012062453
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L1_MISS  3763552
#0, 80000006                              PAPI_L1_TCM  251937057
#1, 80000007                              PAPI_L2_TCM  5262100
#2, 80000008                              PAPI_L3_TCM  1344918
#0, 40000023             MEM_LOAD_UOPS_RETIRED:L2_HIT  3591276
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L3_HIT  137174
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L2_MISS  172658
#3, 40000026            MEM_LOAD_UOPS_RETIRED:L3_MISS  35309
#0, 4000000b                     L2_RQSTS:ALL_CODE_RD  169
#1, 40000004              L2_RQSTS:ALL_DEMAND_DATA_RD  251724623
#2, 40000023                          L2_RQSTS:ALL_PF  251505419
#3, 4000001d                         L2_RQSTS:ALL_RFO  57458
#0, 40000023                             L2_TRANS:ALL  1043640639
#1, 40000024                             L2_TRANS:RFO  59693
#2, 40000025                          L2_TRANS:L1D_WB  125049562
#3, 40000026                    L2_TRANS:DMND_DATA_RD  251938850
#3, 40000023                           L2_TRANS:L2_WB  124952696
#4, 40000024                          L2_TRANS:ALL_PF  251747730
#6, 40000029                         L2_TRANS:L2_FILL  251771623


-O1
step 0 finished in 1.088286 seconds

#0, 80000035                              PAPI_LD_INS  3000046110
#1, 80000036                              PAPI_SR_INS  1003000041
#0, 40000023            MEM_LOAD_UOPS_RETIRED:HIT_LFB  225520031
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L1_HIT  2767007928
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L1_MISS  7501915
#0, 80000006                              PAPI_L1_TCM  251176164
#1, 80000007                              PAPI_L2_TCM  67959270
#2, 80000008                              PAPI_L3_TCM  6751346
#0, 40000023             MEM_LOAD_UOPS_RETIRED:L2_HIT  6343050
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L3_HIT  910938
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L2_MISS  1220353
#3, 40000026            MEM_LOAD_UOPS_RETIRED:L3_MISS  309386
#0, 4000000b                     L2_RQSTS:ALL_CODE_RD  203
#1, 40000004              L2_RQSTS:ALL_DEMAND_DATA_RD  238479757
#2, 40000023                          L2_RQSTS:ALL_PF  316055076
#3, 4000001d                         L2_RQSTS:ALL_RFO  60034
#0, 40000023                             L2_TRANS:ALL  1096902475
#1, 40000024                             L2_TRANS:RFO  60610
#2, 40000025                          L2_TRANS:L1D_WB  125061189
#3, 40000026                    L2_TRANS:DMND_DATA_RD  255402326
#3, 40000023                           L2_TRANS:L2_WB  123443654
#4, 40000024                          L2_TRANS:ALL_PF  318362069

-O2 -xsse4.1
step 0 finished in 0.467037 seconds

#0, 80000035                              PAPI_LD_INS  1512031017
#1, 80000036                              PAPI_SR_INS  505503041
#0, 40000023            MEM_LOAD_UOPS_RETIRED:HIT_LFB  371509439
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L1_HIT  1068334516
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L1_MISS  72172122
#0, 80000006                              PAPI_L1_TCM  125958353
#1, 80000007                              PAPI_L2_TCM  7560098
#2, 80000008                              PAPI_L3_TCM  78953
#0, 40000023             MEM_LOAD_UOPS_RETIRED:L2_HIT  67131851
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L3_HIT  5337411
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L2_MISS  5376506
#3, 40000026            MEM_LOAD_UOPS_RETIRED:L3_MISS  39087
#0, 4000000b                     L2_RQSTS:ALL_CODE_RD  247
#1, 40000004              L2_RQSTS:ALL_DEMAND_DATA_RD  121939334
#2, 40000023                          L2_RQSTS:ALL_PF  124558766
#3, 4000001d                         L2_RQSTS:ALL_RFO  58299
#0, 40000023                             L2_TRANS:ALL  385251315
#1, 40000024                             L2_TRANS:RFO  61632
#2, 40000025                          L2_TRANS:L1D_WB  359669
#3, 40000026                    L2_TRANS:DMND_DATA_RD  127740210
#3, 40000023                           L2_TRANS:L2_WB  132353
#4, 40000024                          L2_TRANS:ALL_PF  130572197

-Ofast -fma -xcore-avx2 -xHost
step 0 finished in 0.202587 seconds

#0, 80000035                              PAPI_LD_INS  346599730
#1, 80000036                              PAPI_SR_INS  90273766
#0, 40000023            MEM_LOAD_UOPS_RETIRED:HIT_LFB  14247372
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L1_HIT  329420645
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L1_MISS  2907897
#0, 80000006                              PAPI_L1_TCM  50733476
#1, 80000007                              PAPI_L2_TCM  4327915
#2, 80000008                              PAPI_L3_TCM  50373
#0, 40000023             MEM_LOAD_UOPS_RETIRED:L2_HIT  2498939
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L3_HIT  404714
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L2_MISS  408539
#3, 40000026            MEM_LOAD_UOPS_RETIRED:L3_MISS  3829
#0, 4000000b                     L2_RQSTS:ALL_CODE_RD  733
#1, 40000004              L2_RQSTS:ALL_DEMAND_DATA_RD  50521562
#2, 40000023                          L2_RQSTS:ALL_PF  19499372
#3, 4000001d                         L2_RQSTS:ALL_RFO  67632
#0, 40000023                             L2_TRANS:ALL  91258158
#1, 40000024                             L2_TRANS:RFO  67233
#2, 40000025                          L2_TRANS:L1D_WB  6244088
#3, 40000026                    L2_TRANS:DMND_DATA_RD  50837574
#3, 40000023                           L2_TRANS:L2_WB  1059869
#4, 40000024                          L2_TRANS:ALL_PF  19491578



#0, 40000023              OFFCORE_RESPONSE_0:ANY_DATA  9620406
#0, 40000023               OFFCORE_RESPONSE_0:L3_MISS  282575
#1, 40000024               OFFCORE_RESPONSE_1:L3_MISS  282575
#0, 40000023                    OFFCORE_RESPONSE_0:WB  1167393
#1, 40000024               OFFCORE_RESPONSE_0:L3_MISS  320550
#0, 40000023            OFFCORE_RESPONSE_0:PF_DATA_RD  6800079
#0, 40000023          OFFCORE_RESPONSE_0:DMND_DATA_RD  2483522
#1, 40000024               OFFCORE_RESPONSE_0:ANY_RFO  89779
#0, 40000023                OFFCORE_RESPONSE_0:PF_RFO  47811
#0, 40000023              OFFCORE_RESPONSE_0:DMND_RFO  37618

*/

// sub_stream results:

/*
-O0
Triad:       6312.3657       0.0038       0.0038       0.0039
step 0 finished in 1.313267 seconds

#0, 80000035                              PAPI_LD_INS  3005285398
#1, 80000036                              PAPI_SR_INS  802119292
#0, 40000023            MEM_LOAD_UOPS_RETIRED:HIT_LFB  1588705
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L1_HIT  3002717666
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L1_MISS  950247
#3, 80000006                              PAPI_L1_TCM  125112554
#5, 80000007                              PAPI_L2_TCM  6003542

#0, 40000023                             L2_TRANS:ALL  517091139
#1, 40000024                          L2_TRANS:ALL_PF  129407871
#2, 40000025                             L2_TRANS:RFO  49819069
#3, 40000026                           L2_TRANS:L2_WB  49747481
#4, 40000027                          L2_TRANS:L1D_WB  49793405
#5, 40000028                    L2_TRANS:DMND_DATA_RD  75336383

#0, 40000023                          L2_TRANS:ALL_PF  128821984
#1, 40000024                             L2_TRANS:RFO  49821945
#2, 40000025                           L2_TRANS:L2_WB  49712109
#3, 40000026                          L2_TRANS:L1D_WB  49794652
#4, 40000027                    L2_TRANS:DMND_DATA_RD  75333172
#5, 40000028                         L2_TRANS:CODE_RD  198202
#6, 40000029                         L2_TRANS:L2_FILL  125241777


-O1
Triad:      16515.7171       0.0015       0.0015       0.0016
step 0 finished in 0.503314 seconds

#0, 80000035                              PAPI_LD_INS  800231637
#1, 80000036                              PAPI_SR_INS  401109778
#0, 40000023            MEM_LOAD_UOPS_RETIRED:HIT_LFB  306296192
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L1_HIT  478749077
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L1_MISS  15171283
#3, 80000006                              PAPI_L1_TCM  125099217
#5, 80000007                              PAPI_L2_TCM  73976966

#0, 40000023                             L2_TRANS:ALL  539489152
#1, 40000024                          L2_TRANS:ALL_PF  160523184
#2, 40000025                             L2_TRANS:RFO  51543743
#3, 40000026                           L2_TRANS:L2_WB  44712835
#4, 40000027                          L2_TRANS:L1D_WB  49801992
#5, 40000028                    L2_TRANS:DMND_DATA_RD  77567766


-O2 -xsse4.1
step 0 finished in 0.485544 seconds

Triad:      15849.9915       0.0015       0.0015       0.0016
#0, 80000035                              PAPI_LD_INS  312731392
#1, 80000036                              PAPI_SR_INS  200606956
#0, 40000023            MEM_LOAD_UOPS_RETIRED:HIT_LFB  187081164
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L1_HIT  74566521
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L1_MISS  51067440
#3, 80000006                              PAPI_L1_TCM  125124453
#5, 80000007                              PAPI_L2_TCM  95526974

#0, 40000023                             L2_TRANS:ALL  504353841
#1, 40000024                          L2_TRANS:ALL_PF  126945632
#2, 40000025                             L2_TRANS:RFO  51354940
#3, 40000026                           L2_TRANS:L2_WB  44787491
#4, 40000027                          L2_TRANS:L1D_WB  49955224
#5, 40000028                    L2_TRANS:DMND_DATA_RD  77856676


-Ofast -core-avx2 -xHost
step 0 finished in 0.485202 seconds

Triad:      16173.4087       0.0015       0.0015       0.0016
#0, 80000035                              PAPI_LD_INS  200375447
#1, 80000036                              PAPI_SR_INS  125423956
#0, 40000023            MEM_LOAD_UOPS_RETIRED:HIT_LFB  136370799
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L1_HIT  63309895
#2, 40000025            MEM_LOAD_UOPS_RETIRED:L1_MISS  535773
#3, 80000006                              PAPI_L1_TCM  125088291
#5, 80000007                              PAPI_L2_TCM  98836313

#0, 40000023                             L2_TRANS:ALL  506915380
#1, 40000024                          L2_TRANS:ALL_PF  126553890
#2, 40000025                             L2_TRANS:RFO  38753909
#3, 40000026                           L2_TRANS:L2_WB  34300225
#4, 40000027                          L2_TRANS:L1D_WB  49864163
#5, 40000028                    L2_TRANS:DMND_DATA_RD  90420741


#0, 40000023                          L2_TRANS:ALL_PF  128804936
#1, 40000024                             L2_TRANS:RFO  38723568
#2, 40000025                           L2_TRANS:L2_WB  34311340
#3, 40000026                          L2_TRANS:L1D_WB  49855665
#4, 40000027                    L2_TRANS:DMND_DATA_RD  90491341
#5, 40000028                         L2_TRANS:CODE_RD  210284
#6, 40000029                         L2_TRANS:L2_FILL  93416146

*/
