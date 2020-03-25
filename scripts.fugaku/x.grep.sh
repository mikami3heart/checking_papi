#!/bin/bash

grep "OPTFLAGS="	stdout.offcore_requests10K.eagles
grep "PAPI_LD_INS "	stdout.offcore_hit10K.eagles
grep "PAPI_SR_INS "	stdout.offcore_hit10K.eagles
grep "OFFCORE_REQUESTS:ALL_DATA_RD "	stdout.offcore_requests10K.eagles
grep "OFFCORE_REQUESTS:DEMAND_RFO "	stdout.offcore_requests10K.eagles
grep "OFFCORE_RESPONSE_0:ANY_DATA:LLC_HITMESF "	stdout.offcore_hit10K.eagles
grep "OFFCORE_RESPONSE_0:ANY_RFO:LLC_HITMESF "	stdout.offcore_hit10K.eagles
grep "OFFCORE_RESPONSE_0:ANY_DATA:L3_MISS "	 	stdout.offcore_miss10K.eagles
grep "OFFCORE_RESPONSE_0:ANY_RFO:L3_MISS "	 	stdout.offcore_miss10K.eagles
grep "OFFCORE_RESPONSE_0:WB:ANY_RESPONSE "	 	stdout.offcore_wb10K.eagles

