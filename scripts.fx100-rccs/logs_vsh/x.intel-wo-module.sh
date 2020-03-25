#!/bin/bash
#	Building PMlib without using module command : Intel version

#	module load intel
INTEL_DIR=/usr/local/intel/composer_xe_2013
source ${INTEL_DIR}/bin/compilervars.sh intel64
#	export INTEL_LICENSE_FILE=/usr/local/intel/flexlm/server.lic
#	export  FC=ifort
#	export  CC=icc
#	export  CXX=icpc

#	module load impi
export I_MPI_ROOT=/usr/local/intel/impi/4.1.0.024
source ${I_MPI_ROOT}/bin64/mpivars.sh
export I_MPI_F90=ifort 
export I_MPI_F77=ifort 
export I_MPI_CC=icc 
export I_MPI_CXX=icpc 
#	export MKLROOT=${INTEL_DIR}/mkl
#	source ${MKLROOT}/bin/mklvars.sh intel64
set -x

#	module load papi/intel
PAPI_ROOT=/usr/local/papi/papi-5.3.2/intel
PAPI_DIR=${PAPI_ROOT}
export LDFLAGS="-L${PAPI_ROOT}/lib -lpapi -lpfm"
export INCLUDES="-I{PAPI_ROOT}/include"
export LD_LIBRARY_PATH=${PAPI_ROOT}/lib:${LD_LIBRARY_PATH}

INSTALL_DIR=${HOME}/pmlib/install_develop

SRC_DIR=${HOME}/pmlib/PMlib
BUILD_DIR=${SRC_DIR}/BUILD_DIR
cd $BUILD_DIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
make distclean # >/dev/null 2>&1

CFLAGS="-std=c99 -openmp"
FCFLAGS="-fpp -openmp "
CXXFLAGS="-openmp "
MPI_DIR=${I_MPI_ROOT}

../configure \
	CXX=mpicxx CC=mpicc FC=mpif90 \
	CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" FCFLAGS="${FCFLAGS}" \
	-prefix=${INSTALL_DIR} \
	--with-impi=${MPI_DIR} \
	--with-comp=INTEL \
    --with-papi=${PAPI_DIR} \
	--with-example=yes # >/dev/null

make
make install
if [ $? != 0 ] ; then echo '@@@ installation error @@@'; exit; fi
#	make distclean
#	exit

export HWPC_CHOOSER=FLOPS
#   export HWPC_CHOOSER=VECTOR
#   export HWPC_CHOOSER=BANDWIDTH
#   export HWPC_CHOOSER=CACHE
#   export HWPC_CHOOSER=CYCLE

NPROCS=4
export OMP_NUM_THREADS=8
mpirun -np ${NPROCS} example/test1/test1
sleep 2
mpirun -np ${NPROCS} example/test2/test2
sleep 2
mpirun -np ${NPROCS} example/test3/test3
sleep 2
mpirun -np ${NPROCS} example/test4/test4
sleep 2
mpirun -np ${NPROCS} example/test5/test5
sleep 2
pwd
