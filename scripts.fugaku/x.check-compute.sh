#!/bin/bash
#PJM -N CHECK-PAPI-5.6
#	#PJM -N CHECK-COMPUTE-NODE
#	#PJM --rsc-list "rscunit=rscunit_ft02"
#	#PJM --rsc-list "rscgrp=dv1-10"
#PJM --rsc-list "rscunit=rscunit_ft01"
#PJM --rsc-list "rscgrp=dv27k"
#PJM --rsc-list "node=1"
#PJM --rsc-list "elapse=0:1:0"
#PJM --mpi "proc=1"
#PJM -j
#PJM -S

module avail
module display lang
#	module load lang
module list
set -x

#	which armclang
#	armclang main.c
#	which cc
#	cc -v main.c
#	cc main.c
#	file a.out
#	./a.out
#	ldd a.out
hostname
uname -a
#	cat /proc/cpuinfo
#	cat /proc/meminfo
xospastop


export LANG=C
#	PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.7.0-arm64
#	PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.6.0-arm64

# on Login node
#	PAPI_DIR=/opt/FJSVxos/devkit/aarch64/rfs/usr

# on Compute node
PAPI_DIR=/usr

ls -l ${PAPI_DIR}/bin/*papi*

which papi_avail
locate papi_avail

which libpapi.so
locate libpapi.so

cd /opt; find . -name "*libpapi.*" 2>/dev/null
cd /usr; find . -name "*libpapi.*" 2>/dev/null
cd / ; ls -l; ls -l /lib64/libpapi.so.5* /usr/lib64/libpapi.so.5*

exit

${PAPI_DIR}/bin/papi_avail
${PAPI_DIR}/bin/papi_avail -a
${PAPI_DIR}/bin/papi_component_avail

echo 
echo Checking with additional LD_LIBRARY_PATH
echo 
export LD_LIBRARY_PATH=${PAPI_DIR}/lib
${PAPI_DIR}/bin/papi_avail
${PAPI_DIR}/bin/papi_avail -a
${PAPI_DIR}/bin/papi_component_avail

