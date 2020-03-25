#!/bin/bash
module load intel impi
set -x
date
SRCDIR=${HOME}/papi/papi-5.3.2/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

#	PREFIX=/usr/local/papi/papi-5.3.2/intel
PREFIX=${HOME}/papi/usr_local_papi/papi-5.3.2-intel
make distclean
./configure --prefix=$PREFIX CC=icc F77=ifort FFLAGS=-openmp CFLAGS=-openmp \
MPICC=mpiicc
make
make test
# The last step must be done by root
#	make install-all
#	date

