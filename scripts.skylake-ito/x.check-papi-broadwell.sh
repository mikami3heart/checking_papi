#!/bin/bash
module load intel/2018
module list
set -x
#	PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.5.1-broadwell
PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.6.0-broadwell
PAPI_LDFLAGS="${PAPI_DIR}/lib/libpapi.a ${PAPI_DIR}/lib/libpfm.a "
PAPI_INCLUDES="-I${PAPI_DIR}/include "
export PATH=${PAPI_DIR}/bin:${PATH}

#	which papi_avail
#	papi_avail -a
#	papi_avail -d # --help
papi_native_avail # --help
#	papi_event_chooser NATIVE CYCLES

