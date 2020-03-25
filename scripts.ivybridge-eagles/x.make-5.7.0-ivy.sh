#!/bin/bash
#	source /opt/intel/bin/compilervars.sh intel64
#	source /opt/intel/impi_latest/intel64/bin/mpivars.sh
#	module load intelcompiler mpt # they are loaded by default
#	source /usr/share/modules/init/bash
module purge
module load intelcompiler intelmpi
#	module load intelcompiler/17.0.5.239 intelmpi/2017.4.239
module list

set -x
date
#	export   I_MPI_CXX=icpc
#	export   I_MPI_CC=icc
#	export   I_MPI_F90=ifort

PREFIX=${HOME}/papi/usr_local_papi/papi-5.7.0-intel

SRCDIR=${HOME}/papi/papi-5.7.0/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
./configure --help

make clean
make distclean

#	./configure F77=ifort CC=icc MPICC=mpiicc --prefix="${PREFIX}" 

export LDFLAGS='-qopenmp'
./configure F77=ifort CC=icc MPICC=mpiicc \
	FFLAGS="-qopenmp" CFLAGS="-qopenmp" LDFLAGS="-qopenmp" \
    --prefix="${PREFIX}" 

export LANG=C
make
make test
# The last step must be done by root
make install-all
#       ln -s lib lib64
#   date

