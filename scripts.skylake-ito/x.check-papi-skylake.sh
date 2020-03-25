#!/bin/bash
#PJM -N PAPI-NATIVE-SKYLAKE
#PJM -L "elapse=0:30:00"
#PJM -L rscunit=ito-a
#PJM -L "rscgrp=ito-ss"
# To reserve exclusive nodes:
#PJM -L "vnode=1"
#PJM -L "vnode-core=36"
#       #PJM -L "node=4"
#       #PJM --mpi "proc=4"
#       #PJM -L "vnode=4"
#PJM --mpi "proc=2"
#PJM -j
#PJM -S

module load intel/2017
module list
#	PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.5.1
PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.6.0-intel
PAPI_LDFLAGS="${PAPI_DIR}/lib/libpapi.a ${PAPI_DIR}/lib/libpfm.a "
PAPI_INCLUDES="-I${PAPI_DIR}/include "
export PATH=${PAPI_DIR}/bin:${PATH}

set -x

cd ${HOME}/papi/scripts/logs_skylake
if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

which papi_avail
papi_avail -a | tee stdout.papi_avail-a.skylake-papi-5.6.0
papi_avail -d | tee stdout.papi_avail-d.skylake-papi-5.6.0
papi_native_avail | tee stdout.papi_native_avail.skylake-papi-5.6.0

#	papi_event_chooser NATIVE CYCLES
#	ldd ~/papi/usr_local_papi/papi-5.6.0/bin/papi_avail
