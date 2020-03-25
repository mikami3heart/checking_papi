#!/bin/bash
module purge
source /usr/share/Modules/init/bash
module load intel impi
set -x
date
#	SRCDIR=/home/ra000004/mikami/papi/papi-5.2.0/src
#	SRCDIR=/home/ra000004/mikami/papi/papi-5.3.0-intel/src
SRCDIR=/home/ra000004/mikami/papi/papi-5.3.2-intel/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

#	PREFIX=/usr/local/papi/papi-5.2.0/intel
#	PREFIX=/usr/local/papi/papi-5.3.0/intel
PREFIX=/usr/local/papi/papi-5.3.2/intel
make distclean
./configure --prefix=$PREFIX F77=ifort FFLAGS=-openmp CFLAGS=-openmp
make
make test
# The last step must be done by root
#	make install-all
#	date

