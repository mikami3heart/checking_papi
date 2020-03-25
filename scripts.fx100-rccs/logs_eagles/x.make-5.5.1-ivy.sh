#!/bin/bash
#	source /opt/intel/bin/compilervars.sh intel64
#	source /opt/intel/impi_latest/intel64/bin/mpivars.sh
#	module load intelcompiler mpt # they are loaded by default
#	source /usr/share/modules/init/bash
module purge
module load intelcompiler intelmpi
module list
set -x
date
#	export   I_MPI_CXX=icpc
#	export   I_MPI_CC=icc
#	export   I_MPI_F90=ifort

#	PREFIX=/ap/papi/papi-5.5.1
PREFIX=${HOME}/papi/usr_local_papi/papi-5.5.1-ivy

SRCDIR=${HOME}/papi/papi-5.5.1-ivy/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
make clean
make distclean

./configure F77=ifort CC=icc FFLAGS="-openmp " CFLAGS="-openmp " \
    MPICC=mpiicc \
    --prefix="${PREFIX}" 
    #   --with-bitmode=64 
make
make test
# The last step must be done by root
make install-all
#       ln -s lib lib64
#   date

