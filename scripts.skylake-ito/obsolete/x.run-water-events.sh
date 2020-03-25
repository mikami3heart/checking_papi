#!/bin/bash
# For interactive execution on Xeon Skylake node
module load intel intelmpi
module list
set -x

#	PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/intel
#	PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/pmlib-develop
#	PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/pmlib-DEBUG53
PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/pmlib-DEBUG55
PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPM "

#	PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.3.2-skylake
PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.5.1-skylake
PAPI_LDFLAGS="-lpapi_ext -L${PAPI_DIR}/lib -Wl,-Bstatic,-lpapi,-lpfm,-Bdynamic "

LDFLAGS+=" ${PMLIB_LDFLAGS} ${PAPI_LDFLAGS} ${OTF_LDFLAGS} -lstdc++ "

export LD_LIBRARY_PATH=${PAPI_DIR}/lib:${LD_LIBRARY_PATH}

PAPI_LDFLAGS="-lpapi_ext -L${PAPI_DIR}/lib -Wl,-Bstatic,-lpapi,-lpfm,-Bdynamic "

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*

SRCDIR=${HOME}/papi/scripts
cp $SRCDIR/check_papi_band_eagles.cpp main.cpp
#	cp $SRCDIR/papi_events.intel.cpp main.cpp
cp $SRCDIR/sub_kernel.c sub.c
#	cp $SRCDIR/sub_fma.c sub.c
#	cp $SRCDIR/sub_stream.c sub.c

CXXFLAGS="-no-ipo -qopenmp "
FCFLAGS="-no-ipo -qopenmp "
#	CFLAGS="-no-ipo -std=c99 -qopenmp "
#	CFLAGS="-Ofast -no-ipo -std=c99 -qopenmp -xHost "
#	CFLAGS="-std=c99 -qopenmp -xavx -opt-report=3 "
#	CFLAGS="-O2 -no-ipo -std=c99 -qopenmp -xavx "
#	CFLAGS="-Fa -unroll=0 -Ofast -no-ipo -qopenmp -fma -xHost -opt-report=3 "
#	CFLAGS="-O2 -no-ipo -std=c99 -qopenmp -xsse4.1 -xavx "

#	CFLAGS="-Ofast -no-ipo -qopenmp -fma -xcore-avx2 -xHost "
#	CFLAGS="-O2 -no-ipo -qopenmp -fma -xsse4.1 "
CFLAGS="-O1 -no-ipo -qopenmp "
#	CFLAGS="-unroll=0 -O0 -no-ipo -qopenmp "


#	PAPI_LDFLAGS="-L${PAPI_DIR}/lib -lpapi -lpfm "
#	PAPI_LDFLAGS="${PAPI_DIR}/lib/libpapi.a ${PAPI_DIR}/lib/libpfm.a "
PAPI_INCLUDES="-I${PAPI_DIR}/include "

PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPMmpi -lpapi_ext "

MPI_LDFLAGS="-lmpi "

mpiicpc -c ${CXXFLAGS} main.cpp ${PAPI_INCLUDES}
mpiicc  -c ${CFLAGS} sub.c 
mpiicpc ${CXXFLAGS}  main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}

export OMP_NUM_THREADS=4
#	mpijob omplace ./a.out
mpirun -np 1 ./a.out
