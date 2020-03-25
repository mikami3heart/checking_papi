#	#!/bin/bash
#PJM -N USER-PAPI-HL
#	#PJM --rsc-list "rscunit=rscunit_ft02"
#	#PJM --rsc-list "rscgrp=dv1-10"
#PJM --rsc-list "rscunit=rscunit_ft01"
#PJM --rsc-list "rscgrp=dv41k"
#PJM --rsc-list "node=1"
#PJM --rsc-list "elapse=00:3:00"
#PJM -j
#PJM -S

#	module load lang
module list
set -x
date
hostname

SRCDIR=${HOME}/papi/scripts.fugaku/src_others
WKDIR=${HOME}/papi/scripts.fugaku/check_dir
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*

cp $SRCDIR/call_papi_hl_flops.c main.c

CXXFLAGS="-O2 -Kopenmp -Nnofjprof -Nfjomplib -w "
FCFLAGS="-O2 -Kopenmp -Nnofjprof -Nfjomplib -w "
CFLAGS="-O2 -Kopenmp -Nnofjprof -Nfjomplib -w "

PAPI_DIR=/opt/FJSVxos/devkit/aarch64/rfs/usr
PAPI_LDFLAGS="-L${PAPI_DIR}/lib64 -lpapi -lpfm "
PAPI_INCLUDES="-I${PAPI_DIR}/include "
MPI_LDFLAGS="-lmpi "

set -x

mpifcc  -c ${CFLAGS} main.c  ${PAPI_INCLUDES}
mpiFCC ${CXXFLAGS}  main.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}

ls -go
xospastop

export OMP_NUM_THREADS=12
mpirun -np 1 ./a.out

