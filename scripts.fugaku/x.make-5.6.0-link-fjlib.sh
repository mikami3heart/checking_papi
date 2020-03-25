#!/bin/bash
#PJM -N MAKE-BIN-5.6
#PJM --rsc-list "rscunit=rscunit_ft02"
#PJM --rsc-list "rscgrp=dv1-30"
#PJM --rsc-list "node=1"
#PJM --mpi "proc=4"
#PJM -j
#PJM -S

module load lang
module list
set -x
xospastop

SRCDIR=${HOME}/papi/papi-5.6.0/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
make clean  >/dev/null 2>&1

PREFIX=${HOME}/papi/usr_local_papi/papi-5.6.0-arm64
PAPI_FJ=/opt/FJSVxos/devkit/aarch64/rfs/usr

export LANG=C
export LD_LIBRARY_PATH=${PAPI_FJ}/lib64

make

make test

# The last step must be done by root
make install-all
