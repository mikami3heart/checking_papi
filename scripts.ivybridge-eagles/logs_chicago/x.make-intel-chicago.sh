#!/bin/bash
#	module purge
#	source /usr/share/Modules/init/bash
#	module load intel 
INTEL_TOP=/opt/intel
source ${INTEL_TOP}/bin/compilervars.sh intel64

set -x
date
SRCDIR=/home/mikami/papi/papi-5.5.1/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

PREFIX=${HOME}/papi/usr_local_papi/papi-5.5.1-intel
make clean
./configure --prefix=$PREFIX \
	F77=ifort FFLAGS="-qopenmp" \
	CC=icc CFLAGS="-qopenmp" \
	MPICC="mpiicc"  MPIF77="mpiifort"
make
make test
# The last step must be done by root
#	make install-all
#	date

