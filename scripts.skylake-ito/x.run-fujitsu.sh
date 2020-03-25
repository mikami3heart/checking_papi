#!/bin/bash
#PJM -N PM62-USER-FUJITSU
#PJM -L "elapse=0:30:00"
#PJM -L rscunit=ito-a
#PJM -L "rscgrp=ito-ss"
# To reserve exclusive nodes:
#PJM -L "vnode=1"
#PJM -L "vnode-core=36"
#PJM --mpi "proc=1"
#PJM -j
#PJM -S


#	PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/pmlib-fujitsu-gnu-mix
PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/pmlib-fujitsu
PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPM -lpapi_ext "

#	PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.6.0-gnu
PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.6.0-fujitsu
PAPI_INCLUDES="-I${PAPI_DIR}/include "
#	PAPI_LDFLAGS="-L${PAPI_DIR}/lib -Wl,-Bstatic,-lpapi,-lpfm,-Bdynamic "
PAPI_LDFLAGS="${PAPI_DIR}/lib/libpapi.a ${PAPI_DIR}/lib/libpfm.a "
#	LDFLAGS+=" ${PMLIB_LDFLAGS} ${PAPI_LDFLAGS} -lstdc++ "
LDFLAGS+=" ${PMLIB_LDFLAGS} ${PAPI_LDFLAGS} "	# Dont add -lstdc++ !!!

export LD_LIBRARY_PATH=${PAPI_DIR}/lib:${LD_LIBRARY_PATH}

WKDIR=${HOME}/tmp/check_papi_fujitsu
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*
set -x

SRCDIR=${HOME}/papi/scripts
cp $SRCDIR/check_papi_band_skylake.cpp main.cpp
#	cp $SRCDIR/check_papi_fp_skylake.cpp   main.cpp
cp $SRCDIR/sub_kernel.c sub.c
#	cp $SRCDIR/sub_fma.c sub.c
#	cp $SRCDIR/sub_stream.c sub.c

CXXFLAGS="-Kopenmp -Xg -fvisibility=default "
CFLAGS="-Kopenmp -Xg -fvisibility=default "
FCFLAGS="-Kopenmp "
LDFLAGS+="--linkfortran "


set -x
FCC -c ${CXXFLAGS} main.cpp ${PAPI_INCLUDES}
fcc  -c ${CFLAGS} sub.c 
FCC ${CXXFLAGS} main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS} ${LDFLAGS}
export OMP_NUM_THREADS=4
./a.out
