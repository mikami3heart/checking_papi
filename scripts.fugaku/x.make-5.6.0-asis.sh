#!/bin/bash
#PJM -N MAKE-COMPUTE-5.6
#PJM --rsc-list "rscunit=rscunit_ft02"
#PJM --rsc-list "rscgrp=dv1-30"
#PJM --rsc-list "node=1"
#PJM --mpi "proc=4"
#PJM -j
#PJM -S

module load lang
module list
set -x
xospastop

SRCDIR=${HOME}/papi/papi-5.6.0/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
#	./configure --help
make distclean

PREFIX=${HOME}/papi/usr_local_papi/papi-5.6.0-arm64

./configure \
    --prefix="${PREFIX}" \
    --with-perf-events F77=gfortran CC=cc

#./configure \
#    --with-perf-events \
#    --with-static-lib=yes --with-shared-lib=yes \
#    --with-shlib --with-shlib-tools \
#    --with-components="appio coretemp example infiniband lmsensors lustre micpower mx net rapl stealtime"

export LANG=C
#	export LD_LIBRARY_PATH=${SRCDIR}:${SRCDIR}/libpfm4/lib

make

make test
# The last step must be done by root
make install-all
#       ln -s lib lib64
#   date


exit
export LDFLAGS='-Kfast'
./configure F77=frtpx CC=fccpx MPICC=FCCpx \
	FFLAGS="-Kfast" CFLAGS="-Kfast" LDFLAGS="-Kfast" \
    --host=fugaku \
    --with-arch=aarcch64 \
    --with-ffsll=yes \
    --with-walltimer=gettimeofday \
    --with-tls=no \
    --with-virtualtimer=times \
    --prefix="${PREFIX}" 

export LANG=C
make
exit

make test
# The last step must be done by root
make install-all
#       ln -s lib lib64
#   date

