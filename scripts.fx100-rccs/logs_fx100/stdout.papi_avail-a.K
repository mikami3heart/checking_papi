Available events and hardware information.
--------------------------------------------------------------------------------
Vendor string and code   : Sun (7)
Model string and code    : Fujitsu SPARC64 VIIIfx (140)
CPU Revision             : 0.000000
CPU Megahertz            : 2000.000000
CPU Clock Megahertz      : 2000
CPU's in this Node       : 8
Nodes in this System     : 1
Total CPU's              : 8
Number Hardware Counters : 8
Max Multiplex Counters   : 512
--------------------------------------------------------------------------------
The following correspond to fields in the PAPI_event_info_t structure.

    Name        Code    Deriv Description (Note)
PAPI_L1_DCM  0x80000000  No   Level 1 data cache misses
PAPI_L1_ICM  0x80000001  No   Level 1 instruction cache misses
PAPI_L1_TCM  0x80000006  Yes  Level 1 cache misses
PAPI_L2_TCM  0x80000007  Yes  Level 2 cache misses
PAPI_CA_INV  0x8000000c  No   Requests for cache line invalidation
PAPI_CA_ITV  0x8000000d  No   Requests for cache line intervention
PAPI_TLB_DM  0x80000014  No   Data translation lookaside buffer misses
PAPI_TLB_IM  0x80000015  No   Instruction translation lookaside buffer misses
PAPI_TLB_TL  0x80000016  Yes  Total translation lookaside buffer misses
PAPI_MEM_SCY 0x80000022  No   Cycles Stalled Waiting for memory accesses
PAPI_STL_ICY 0x80000025  No   Cycles with no instruction issue
PAPI_FUL_ICY 0x80000026  No   Cycles with maximum instruction issue
PAPI_STL_CCY 0x80000027  Yes  Cycles with no instructions completed
PAPI_FUL_CCY 0x80000028  Yes  Cycles with maximum instructions completed
PAPI_HW_INT  0x80000029  No   Hardware interrupts
PAPI_BR_MSP  0x8000002e  No   Conditional branch instructions mispredicted
PAPI_BR_PRC  0x8000002f  Yes  Conditional branch instructions correctly predicted
PAPI_FMA_INS 0x80000030  Yes  FMA instructions completed
PAPI_TOT_IIS 0x80000031  Yes  Instructions issued
PAPI_TOT_INS 0x80000032  No   Instructions completed
PAPI_FP_INS  0x80000034  Yes  Floating point instructions
PAPI_LD_INS  0x80000035  Yes  Load instructions
PAPI_SR_INS  0x80000036  Yes  Store instructions
PAPI_BR_INS  0x80000037  No   Branch instructions
PAPI_VEC_INS 0x80000038  Yes  Vector/SIMD instructions
PAPI_TOT_CYC 0x8000003b  No   Total cycles
PAPI_LST_INS 0x8000003c  No   Load/store instructions completed
PAPI_L2_TCH  0x80000056  Yes  Level 2 total cache hits
PAPI_L2_TCA  0x80000059  Yes  Level 2 total cache accesses
PAPI_FP_OPS  0x80000066  Yes  Floating point operations
-------------------------------------------------------------------------
Of 30 available events, 15 are derived.

avail.c                                  PASSED
