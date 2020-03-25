#!/bin/bash
module load intel/2017
module list
PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.5.1-broadwell
PAPI_LDFLAGS="${PAPI_DIR}/lib/libpapi.a ${PAPI_DIR}/lib/libpfm.a "
PAPI_INCLUDES="-I${PAPI_DIR}/include "
export PATH=${PAPI_DIR}/bin:${PATH}

module load intel/2017

set -x
#	which papi_avail
#	papi_avail -a
#	ldd ~/papi/usr_local_papi/papi-5.5.1-broadwell/bin/papi_avail

#	papi_avail -d # --help
papi_native_avail # --help
#	papi_event_chooser NATIVE CYCLES

