#!/bin/bash
#	source /opt/intel/bin/compilervars.sh intel64
#	source /opt/intel/impi_latest/intel64/bin/mpivars.sh
#	module load intelcompiler mpt # they are loaded by default
#	source /usr/share/Modules/default/init/bash
module purge
module load intelcompiler intelmpi
module list
set -x
date
PREFIX=${HOME}/papi/usr_local_papi/papi-5.3.2-intel

SRCDIR=${HOME}/papi/papi-5.3.2/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
make clean
make distclean

./configure --prefix=$PREFIX CC=icc F77=ifort FFLAGS=-openmp CFLAGS=-openmp \
MPICC=mpiicc
make
make test
make install-all	# The last step must be done by root

exit

./configure --prefix="${PREFIX}" CC=gcc F77=gfortran \
    FFLAGS="-fopenmp " CFLAGS="-fopenmp " LDFLAGS="-fopenmp " \
    #   --with-bitmode=64 

