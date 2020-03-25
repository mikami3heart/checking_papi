#!/bin/bash
hostname
PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.5.1-haswell
export PATH=+:${PAPI_DIR}/bin
#	export PATH=${PATH}:${PAPI_DIR}/bin
#	papi_avail -a
#	papi_avail -d
#	papi_event_chooser NATIVE PAPI_L1_TCM
papi_native_avail
