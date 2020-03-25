#	#!/bin/bash
#PJM -N FP_MEM
#PJM --rsc-list "rscunit=rscunit_ft02"
#PJM --rsc-list "rscgrp=dv1-10"
#PJM --rsc-list "node=1"
#PJM --rsc-list "elapse=00:3:00"
#PJM -j
#PJM -S

module load lang
module list
#	set -x
date
hostname
xospastop

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/* >/dev/null 2>&1

SRCDIR=${HOME}/papi/scripts.fugaku
cp $SRCDIR/src_test/check_papi_mem.cpp main.cpp
cp $SRCDIR/src_subs/sub_fma.c sub.c
#	ls -go

# on Login node
PAPI_DIR=/opt/FJSVxos/devkit/aarch64/rfs/usr
PAPI_LDFLAGS="-L${PAPI_DIR}/lib64 -lpapi -lpfm -Nnofjprof"
#	PAPI_LDFLAGS="-L${PAPI_DIR}/lib64 -lpapi -lpfm "
#	PAPI_LDFLAGS="-L${PAPI_DIR}/lib64 -lpapi -lpfm "
#	PAPI_LDFLAGS="${PAPI_DIR}/lib64/libpapi.a ${PAPI_DIR}/lib64/libpfm.a "
PAPI_INCLUDES="-I${PAPI_DIR}/include "

PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/aarch64
PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPMmpi -lpapi_ext "
MPI_LDFLAGS="-lmpi "

#	-O2			# produce the assembly code using multiply and add separately
#	-Kfast		# produce the complex unrolled and software pipelined assembly code
#	-Kfast,nounroll,noswp # produce the simple assembly code using FMA

export OMP_NUM_THREADS=1
FCFLAGS="-O2 -Knoopenmp "
CXXFLAGS="-O2 -Knoopenmp -w "
mpiFCC -c ${CXXFLAGS} main.cpp ${PAPI_INCLUDES}

#	set -x
for opt in \
"-O0" \
"-O1" \
"-O2" \
"-Kfast" \

do
CFLAGS="${opt} -Knoopenmp -w -Knounroll,noswp"
mpifcc -c ${CFLAGS} -S -Nlst=t sub.c 
mv sub.s sub${opt}.s
mv sub.lst sub${opt}.lst
mpifcc -c ${CFLAGS} sub.c 
mpiFCC ${CXXFLAGS}  main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}
#	mpifcc ${CFLAGS} sub.c main.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}

echo CFLAGS=${CFLAGS}
mpirun -np 1 ./a.out

done



for opt in \
"-O0" \
"-O1" \
"-O2" \
"-Kfast" \

do
echo sub${opt}.lst
cat sub${opt}.lst
echo sub${opt}.s
cat sub${opt}.s

done



