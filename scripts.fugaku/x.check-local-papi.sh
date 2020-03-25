#!/bin/bash
#PJM -N RUN-COMPUTE-PAPI
#PJM --rsc-list "rscunit=rscunit_ft02"
#PJM --rsc-list "rscgrp=dv1-10"
#PJM --rsc-list "node=1"
#PJM --rsc-list "elapse=0:1:0"
#PJM --mpi "proc=1"
#PJM -j
#PJM -S

module load lang
module list
set -x
xospastop

hostname
uname -a
#	cat /proc/cpuinfo
#	cat /proc/meminfo

PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.6.0-arm64
#	export LD_LIBRARY_PATH=${PAPI_DIR}/lib
PAPI_FJ=/opt/FJSVxos/devkit/aarch64/rfs/usr/lib64
export LD_LIBRARY_PATH=${PAPI_FJ}/lib64
export LANG=C

ldd ${PAPI_DIR}/bin/papi_avail

${PAPI_DIR}/bin/papi_avail

${PAPI_DIR}/bin/papi_avail -a

${PAPI_DIR}/bin/papi_component_avail

${PAPI_DIR}/bin/papi_native_avail
