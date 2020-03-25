#	#!/bin/bash
#PJM -N LINK-PMLIB
#PJM --rsc-list "rscunit=rscunit_ft01"
#PJM --rsc-list "rscgrp=dv41k"
#PJM --rsc-list "node=1"
#PJM --rsc-list "elapse=00:3:00"
#PJM -j
#PJM -S

#	module load lang
module list
#	set -x
date
hostname
xospastop

SRCDIR=${HOME}/papi/scripts.fugaku
WKDIR=${HOME}/papi/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/* >/dev/null 2>&1

cp $SRCDIR/src_test/check_papi_fp.cpp main.cpp
cp $SRCDIR/src_subs/sub_fma.c sub.c
#	ls -go

# on Login node
#	PAPI_DIR=/opt/FJSVxos/devkit/aarch64/rfs/usr
# on compute node
PAPI_DIR=/usr
PAPI_LDFLAGS="-L${PAPI_DIR}/lib64 -lpapi -lpfm "
PAPI_INCLUDES="-I${PAPI_DIR}/include "

PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/fugaku
PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPMmpi -lpapi_ext "
MPI_LDFLAGS="-lmpi "

#	-O2			# produce the assembly code using multiply and add separately
#	-Kfast		# produce the complex unrolled and software pipelined assembly code
#	-Kfast,nounroll,noswp # produce the simple assembly code using FMA

export OMP_NUM_THREADS=1
FCFLAGS="-O2 -Kopenmp -Nnofjprof -Nfjomplib -w"
CXXFLAGS="-O2 -Kopenmp -Nnofjprof -Nfjomplib -w"
mpiFCC -c ${CXXFLAGS} main.cpp ${PAPI_INCLUDES}

set -x
for opt in \
"-O0 " \
"-O1 -Knounroll,noswp " \
"-O2 -Knounroll,noswp " \
"-Kfast,nounroll,noswp " \
"-Kfast " \

do
CFLAGS="${opt} -Kopenmp -w "
#	mpifcc -c ${CFLAGS} -S -Nlst=t sub.c 
mpifcc -c ${CFLAGS} sub.c 
mpiFCC ${CXXFLAGS}  main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}
#	mpifcc ${CFLAGS} sub.c main.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}

mpirun -np 1 ./a.out

done

