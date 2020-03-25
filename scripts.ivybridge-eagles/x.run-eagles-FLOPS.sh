#!/bin/bash
#PBS -N PAPI-IVY-VEC
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -q quv

#	module list
#	set -x
date
hostname

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*

SRCDIR=${HOME}/papi/scripts
cp $SRCDIR/check_papi_fp_eagles.cpp main.cpp
#	cp $SRCDIR/check_papi_band_eagles.cpp main.cpp
cp $SRCDIR/sub_fma.c sub.c
#	cp $SRCDIR/sub_stream.c sub.c

CXXFLAGS="-no-ipo -qopenmp "
FCFLAGS="-no-ipo -qopenmp "
#	CFLAGS="-no-ipo -std=c99 -qopenmp "
#	CFLAGS="-O2 -no-ipo -std=c99 -qopenmp -xavx "
#	CFLAGS="-Fa -unroll=0 -Ofast -no-ipo -qopenmp -fma -xHost -opt-report=3 "

CFLAGS="-Ofast -no-ipo -qopenmp -fma -xcore-avx2 -xHost "
#	CFLAGS="-O2 -no-ipo -qopenmp -fma -xsse4.1 "
#	CFLAGS="-O1 -no-ipo -qopenmp "
#	CFLAGS="-unroll=0 -O0 -no-ipo -qopenmp "


PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.5.1-intel
PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/intel

# on Login node
PAPI_LDFLAGS="-L${PAPI_DIR}/lib -lpapi -lpfm "
PAPI_LDFLAGS="${PAPI_DIR}/lib/libpapi.a ${PAPI_DIR}/lib/libpfm.a "
PAPI_INCLUDES="-I${PAPI_DIR}/include "

PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPMmpi -lpapi_ext "

MPI_LDFLAGS="-lmpi "

#	icpc ${CXXFLAGS} main.cpp ${PAPI_INCLUDES} ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}
#	exit
set -x
icpc -c ${CXXFLAGS} main.cpp ${PAPI_INCLUDES}
icc  -c ${CFLAGS} sub.c 
icpc ${CXXFLAGS}  main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}

export OMP_NUM_THREADS=1
#	mpijob omplace ./a.out
mpirun -np 1 ./a.out

exit
export PATH=${PATH}:${PAPI_DIR}/bin
papi_avail -a
