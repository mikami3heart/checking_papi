#!/bin/bash
module load openmpi/3.1.1-nocuda-gcc4.8.5
module list
set -x
date
export   CC=gcc CXX=g++ FC=gfortran

PREFIX=${HOME}/papi/usr_local_papi/papi-5.6.0-gnu
SRCDIR=${HOME}/papi/papi-5.6.0-gnu/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
make distclean

# Edit line 14 of ${SRCDIR}/validation_tests/Makefile.target.in
#	LDFLAGS = @LDL@ @STATIC@ @LDFLAGS@

export LANG=C
./configure F77=gfortran CC=gcc MPICC=mpicc --prefix="${PREFIX}"
make
make test
#	make install
# The last step must be done by root
make install-all
#       ln -s lib lib64
#   date


