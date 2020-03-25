#!/bin/bash
module load intel/2017
module list
set -x
date
#   export   I_MPI_CXX=icpc
#   export   I_MPI_CC=icc
#   export   I_MPI_F90=ifort

PREFIX=${HOME}/papi/usr_local_papi/papi-5.6.0-intel
SRCDIR=${HOME}/papi/papi-5.6.0/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
make distclean

# Edit line 14 of ${SRCDIR}/validation_tests/Makefile.target.in
#	LDFLAGS = @LDL@ @STATIC@ @LDFLAGS@

export LANG=C
./configure F77=ifort CC=icc MPICC=mpiicc --prefix="${PREFIX}"
make
make test
#	make install
# The last step must be done by root
make install-all
#       ln -s lib lib64
#   date


