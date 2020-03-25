#!/bin/bash
#PBS -N PAPI-VERSION
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -q quv

#	module list
#	set -x
#	date
#	hostname

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*

SRCDIR=${HOME}/papi/scripts.eagles
cp $SRCDIR/check_papi_version.c ./

CXXFLAGS="-O2 -no-ipo -qopenmp "
CFLAGS="-O2 -no-ipo -std=c99 -qopenmp "
FCFLAGS="-O2 -no-ipo -qopenmp "

#	CXXFLAGS="-Ofast -no-ipo -qopenmp -xavx "
#	CFLAGS="-Ofast -no-ipo -std=c99 -qopenmp -xavx "
#	FCFLAGS="-Ofast -no-ipo -qopenmp -xavx "


#	PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.5.1-intel
#	PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.6.0-intel
PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.7.0-intel

PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/intel

# on Login node
PAPI_LDFLAGS="-L${PAPI_DIR}/lib -lpapi -lpfm "
PAPI_LDFLAGS="${PAPI_DIR}/lib/libpapi.a ${PAPI_DIR}/lib/libpfm.a "
PAPI_INCLUDES="-I${PAPI_DIR}/include "

#	PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPMmpi -lpapi_ext "
#	MPI_LDFLAGS="-lmpi "

PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPM -lpapi_ext "

icc ${CFLAGS} check_papi_version.c ${PAPI_INCLUDES} ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}

export OMP_NUM_THREADS=1
./a.out
#	mpirun -np 1 ./a.out
