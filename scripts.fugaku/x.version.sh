#!/bin/bash
#PJM -N PAPI-VERSION
#PJM --rsc-list "rscunit=rscunit_ft02"
#PJM --rsc-list "rscgrp=dv1-10"
#PJM --rsc-list "node=1"
#	#PJM --rsc-list "node=2:noncont"
#PJM --rsc-list "elapse=00:2:00"
#PJM --mpi "proc=2"
#PJM -j
#PJM -S

module load lang
module list
set -x

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*

SRCDIR=${HOME}/papi/scripts.fugaku
cp $SRCDIR/check_papi_version.c ./

CXXFLAGS="-O2 "
CFLAGS="-O2 "
FCFLAGS="-O2 "

#	PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.7.0-intel
#	PAPI_DIR=/opt/FJSVxos/devkit/aarch64/rfs/usr/lib64/libpapi.so
PAPI_DIR=/opt/FJSVxos/devkit/aarch64/rfs/usr

# on Login node
PAPI_LDFLAGS="-L${PAPI_DIR}/lib64 -lpapi -lpfm "
PAPI_INCLUDES="-I${PAPI_DIR}/include "

#	PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/aarch64
#	PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPMmpi -lpapi_ext "
#	MPI_LDFLAGS="-lmpi "
#	PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPM -lpapi_ext "
#	icc ${CFLAGS} check_papi_version.c ${PAPI_INCLUDES} ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}

fcc ${CFLAGS} check_papi_version.c ${PAPI_INCLUDES} ${PAPI_LDFLAGS}
export OMP_NUM_THREADS=1
./a.out
#	mpirun -np 1 ./a.out
