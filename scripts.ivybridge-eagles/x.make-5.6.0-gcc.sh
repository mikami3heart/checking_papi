#!/bin/bash
module list

set -x
date
PREFIX=${HOME}/papi/usr_local_papi/papi-5.6.0-gnu

SRCDIR=${HOME}/papi/papi-5.6.0-gnu/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
./configure --help

make clean
make distclean

#	export LDFLAGS='-qopenmp'
./configure F77=gfortran CC=gcc --prefix="${PREFIX}" 

export LANG=C
make
make test
# The last step must be done by root
#	make install-all
#       ln -s lib lib64
#   date

