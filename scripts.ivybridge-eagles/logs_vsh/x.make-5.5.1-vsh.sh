#!/bin/bash
module load intel impi
set -x
date
SRCDIR=${HOME}/papi/papi-5.5.1/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

PREFIX=/usr/local/papi/papi-5.5.1/intel
#	PREFIX=${HOME}/papi/usr_local_papi/papi-5.5.1-intel
make distclean
./configure --prefix=$PREFIX CC=icc F77=ifort FFLAGS=-openmp CFLAGS=-openmp \
	MPICC=mpiicc 
	#	MPICC=mpiicc -with-ffsll
make
make test
#	make install-all
# The last step must be done by root
#	make install-all
#	date

