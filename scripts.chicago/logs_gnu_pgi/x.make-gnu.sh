#!/bin/bash
module purge
module load gnu 
module list
set -x
date
#	SRCDIR=/home/ra000004/mikami/papi/papi-5.3.2-gnu/src
SRCDIR=/home/ra000004/mikami/papi/papi-5.5.1-gnu/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

#	PREFIX=/usr/local/papi/papi-5.3.2/gnu
PREFIX=/usr/local/papi/papi-5.5.1/gnu
make clean
./configure F77=gfortran CC=gcc \
	FFLAGS="-fopenmp " CFLAGS="-fopenmp "  --prefix="${PREFIX}"
make
make test
# The last step must be done by root
#	make install-all
#	date

