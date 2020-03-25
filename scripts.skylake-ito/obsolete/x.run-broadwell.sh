#!/bin/bash
module load intel/2017

PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/pmlib-develop
PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPM -lpapi_ext "

PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.5.1-broadwell
PAPI_INCLUDES="-I${PAPI_DIR}/include "
#	PAPI_LDFLAGS="-L${PAPI_DIR}/lib -Wl,-Bstatic,-lpapi,-lpfm,-Bdynamic "
PAPI_LDFLAGS="${PAPI_DIR}/lib/libpapi.a ${PAPI_DIR}/lib/libpfm.a "
LDFLAGS+=" ${PMLIB_LDFLAGS} ${PAPI_LDFLAGS} -lstdc++ "

export LD_LIBRARY_PATH=${PAPI_DIR}/lib:${LD_LIBRARY_PATH}

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*

SRCDIR=${HOME}/papi/scripts
cp $SRCDIR/check_papi_band_broadwell.cpp main.cpp
#	cp $SRCDIR/check_papi_fp_broadwell.cpp   main.cpp
cp $SRCDIR/sub_kernel.c sub.c
#	cp $SRCDIR/sub_fma.c sub.c
#	cp $SRCDIR/sub_stream.c sub.c

CXXFLAGS="-g -xcore-avx2 -Ofast -no-ipo -qopenmp -qopt-report "
FCFLAGS="-no-ipo -qopenmp "
#	CFLAGS="-no-ipo -std=c99 -qopenmp "
#	CFLAGS="-Ofast -no-ipo -std=c99 -qopenmp -xHost "
#	CFLAGS="-std=c99 -qopenmp -xavx -opt-report=3 "
#	CFLAGS="-O2 -no-ipo -std=c99 -qopenmp -xavx "
#	CFLAGS="-Fa -unroll=0 -Ofast -no-ipo -qopenmp -fma -xHost "
#	CFLAGS="-O2 -no-ipo -std=c99 -qopenmp -xsse4.1 -xavx "
#	CFLAGS="-Ofast -no-ipo -qopenmp -fma -xcore-avx2 -xHost "
#	CFLAGS="-O2 -no-ipo -qopenmp -fma -xsse4.1 "
#	CFLAGS="-g -xcore-avx2 -O2 -no-ipo -qopenmp -qopt-report "
#	CFLAGS="-g -O3 -no-ipo -xsse4.1 -msse4.1 -qopt-report "
CFLAGS="-g -xcore-avx2 -Ofast -no-ipo -qopenmp -qopt-report "
CFLAGS="-Ofast -xHost -no-ipo -qopenmp "


set -x
icpc -c ${CXXFLAGS} main.cpp ${PAPI_INCLUDES}
icc  -c ${CFLAGS} sub.c 
icpc ${CXXFLAGS}  main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  

export OMP_NUM_THREADS=1
./a.out
