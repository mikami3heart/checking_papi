#!/bin/bash
#PJM -N VERSION
#PJM --rsc-list "rscunit=rscunit_ft02"
#PJM --rsc-list "rscgrp=dv1-10"
#PJM --rsc-list "node=1"
#PJM --rsc-list "elapse=00:1:00"
#PJM -j
#PJM -S

module load lang
module list
set -x
date
hostname

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*

SRCDIR=${HOME}/papi/scripts.fugaku
cp $SRCDIR/check_papi_version.c main.c

CXXFLAGS="-O2 -Kopenmp "
FCFLAGS="-O2 -Kopenmp "
CFLAGS="-O2 -Kopenmp "

PAPI_DIR=/opt/FJSVxos/devkit/aarch64/rfs/usr

# on Login node
PAPI_LDFLAGS="-L${PAPI_DIR}/lib64 -lpapi -lpfm "
#	PAPI_LDFLAGS="-L${PAPI_DIR}/lib64 -lpapi -lpfm "
#	PAPI_LDFLAGS="${PAPI_DIR}/lib64/libpapi.a ${PAPI_DIR}/lib64/libpfm.a "
PAPI_INCLUDES="-I${PAPI_DIR}/include "

#	PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/aarch64
#	PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPMmpi -lpapi_ext "

fcc ${CXXFLAGS}  main.c ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS} 
./a.out

exit
MPI_LDFLAGS="-lmpi "
# mpifccpx ${CXXFLAGS}  main.c ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}
mpifcc   ${CXXFLAGS}  main.c ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}
mpiexec -np 1 ./a.out

export PATH=${PATH}:${PAPI_DIR}/bin
papi_avail -a

