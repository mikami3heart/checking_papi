#!/bin/bash
#PJM -N PM62-USER-SKYLAKE
#PJM -L "elapse=0:30:00"
#PJM -L rscunit=ito-a
#PJM -L "rscgrp=ito-ss"
# To reserve exclusive nodes:
#PJM -L "vnode=1"
#PJM -L "vnode-core=36"
#       #PJM -L "node=4"
#       #PJM --mpi "proc=4"
#       #PJM -L "vnode=4"
#PJM --mpi "proc=2"
#PJM -j
#PJM -S

module load intel/2017

PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/pmlib-intel
#	PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/pmlib-6.2
#	PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/pmlib-precise
PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPM -lpapi_ext "

PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.6.0-intel
#	${PAPI_DIR}/bin/papi_avail -a
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
cp $SRCDIR/check_papi_band_skylake.cpp main.cpp
#	cp $SRCDIR/check_papi_fp_skylake.cpp   main.cpp
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

#	icpc -c ${CXXFLAGS} main.cpp ${PAPI_INCLUDES}
#	icc  -c ${CFLAGS} sub.c 
#	icpc ${CXXFLAGS}  main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  
#	export OMP_NUM_THREADS=1
#	./a.out

export CC=mpiicc CXX=mpiicpc F90=mpiifort FC=mpiifort
export I_MPI_CC=icc I_MPI_CXX=icpc I_MPI_F90=ifort I_MPI_FC=ifort

#	mpiicpc -c ${CXXFLAGS} main.cpp ${PAPI_INCLUDES}
#	mpiicc  -c ${CFLAGS} sub.c 
#	mpiicpc ${CXXFLAGS}  main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  
#	NPROCS=2
#	mpirun -np ${NPROCS} ./a.out

icpc -c ${CXXFLAGS} main.cpp ${PAPI_INCLUDES}
icc  -c ${CFLAGS} sub.c 
icpc ${CXXFLAGS}  main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  
set -x
export OMP_NUM_THREADS=4
./a.out

