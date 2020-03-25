#!/bin/bash
#	module purge

set -x
date
SRCDIR=/home/mikami/papi/papi-5.5.1/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

PREFIX=${HOME}/papi/usr_local_papi/papi-5.5.1-gnu
#	make clean
./configure --prefix=$PREFIX \
	F77=gfortran CC=gcc 
make
make test
# The last step must be done by root
#	make install-all
#	date

