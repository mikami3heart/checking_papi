#!/bin/bash
#PJM -N PAPI-AVAIL
#	#PJM --rsc-list "rscunit=rscunit_ft02"
#	#PJM --rsc-list "rscgrp=dv1-10"
#PJM --rsc-list "rscunit=rscunit_ft01"
#PJM --rsc-list "rscgrp=dv27k"
#PJM --rsc-list "node=1"
#PJM --rsc-list "elapse=00:2:00"
#PJM --mpi "proc=2"
#PJM -j
#PJM -S

module load lang
module list
set -x
xospastop

numactl --hardware

papi_avail -a
papi_avail -d
papi_native_avail

#	man cpuid

exit

#	PAPI_DIR=/opt/FJSVxos/devkit/aarch64/rfs/usr

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

export LD_LIBRARY_PATH=\
${HOME}/papi/papi-5.7.0/src:${HOME}/papi/papi-5.7.0/src/libpfm4/lib

file ${HOME}/papi/papi-5.7.0/src/utils/papi_avail
ldd ${HOME}/papi/papi-5.7.0/src/utils/papi_avail
${HOME}/papi/papi-5.7.0/src/utils/papi_avail

yum list installed | grep -i sensors

