#!/bin/bash
# OpenMP
#BSUB -J PAPI-FLOPS-1Px16Th_Node
#BSUB -o PAPI-FLOPS-1Px16Th_Node-%J
#BSUB -n 2
#BSUB -R "span[ptile=1]"
#BSUB -L /bin/bash
#BSUB -x
#	source /usr/share/Modules/init/bash
module load intel impi papi/intel 
module load pmlib/intel 
#	module load ${HOME}/local_module/pmlib/develop
module list
set -x
date
hostname

echo PAPI_ROOT=$PAPI_ROOT
#	PAPI_ROOT is set by the modulefile papi
#	PAPI_INCLUDE=$PAPI_ROOT/include
#	PAPI_LIB="$PAPI_ROOT/lib/libpapi.a $PAPI_ROOT/lib/libpfm.a"


#	WKDIR=/home/ra000004/mikami/tmp/wrk_dir/check_papi
#	WKDIR=/work/ra000004/mikami/tmp/check_papi
WKDIR=/media/dali/data1/mikami/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
#	rm $WKDIR/*

#	export OMP_NUM_THREADS=8
#	mpirun -np 1 ./a.out
#	mpirun -np 2 /bin/bash ./env.sh
#	mpirun -genv LD_LIBRARY_PATH -np 2 ./a.out
#	#exit

#	PAPI_PRESETS="-I$PAPI_FTESTS -I$PAPI_CTESTS "
#	PAPI_FTESTS=$PAPI_ROOT/share/papi/ftests
#	PAPI_CTESTS=$PAPI_ROOT/share/papi/ctests
#	PAPI_TESTLIB=$PAPI_ROOT/share/papi/testlib
#	cp -p $PAPI_TESTLIB/*.[oh] .

# Fortran
#	SRCDIR=$PAPI_FTESTS
#	cp $SRCDIR/nineth.F f.F
#	cp $SRCDIR/fmatrixlowpapi.F f.F
#	cp $SRCDIR/fmatrixpapi2.F f.F
#	cp $SRCDIR/flops.F f.F
#	cp $SRCDIR/avail.F f.F
#	cp $SRCDIR/../ftests/ftests_util.o .

# C
#	SRCDIR=$PAPI_CTESTS
#	cp $SRCDIR/hl_rates.c c.c
#	cp $SRCDIR/high-level2.c c.c
#	cp $SRCDIR/nineth.c c.c
#	cp $SRCDIR/flops.c c.c
#	cp $SRCDIR/val_omp.c c.c
#	cp $PAPI_CTESTS/*.h .

SRCDIR=/home/ra000004/mikami/papi/scripts
#	cp $SRCDIR/check_papi_hl.c c.c
#	CFLAGS="-openmp -no-ipo -fno-inline-functions -I${PAPI_INCLUDE}"
#	mpicc ${CFLAGS} c.c ${PAPI_LDFLAGS}

cp $SRCDIR/check_papi_events.cpp main.cpp
cp $SRCDIR/sub_stream.c sub.c
CFLAGS="-g -O0 -no-opt-prefetch -openmp -no-ipo -fno-inline-functions -I${PAPI_INCLUDE}"
CXXFLAGS="-g -O0 -no-opt-prefetch -openmp -no-ipo -fno-inline-functions -I${PAPI_INCLUDE}"
#	CFLAGS="-g -O1 -openmp -no-ipo -fno-inline-functions -I${PAPI_INCLUDE}"
#	CFLAGS="-g -O2 -openmp -no-ipo -fno-inline-functions -I${PAPI_INCLUDE}"
#	CFLAGS="-O3 -xHost -openmp -no-ipo -fno-inline-functions -I${PAPI_INCLUDE}"
#	CXXFLAGS="-openmp -no-ipo -fno-inline-functions -I${PAPI_INCLUDE}"

#	CFLAGS="${CFLAGS} -fsource-asm -S"
CXXFLAGS="${CXXFLAGS} -DDEBUG_PRINT_PAPI -DDEBUG_PRINT_PAPI_THREADS"

mpicxx -c ${CXXFLAGS} main.cpp ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}
mpicc  -c ${CFLAGS} sub.c ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}
mpicxx ${CXXFLAGS} main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}

export OMP_NUM_THREADS=8
mpirun -np 1 ./a.out
mpirun -genv LD_LIBRARY_PATH -np 2 ./a.out
mpirun -np 2 ./env.sh
exit

IS_OPENMP="yes"
# Loop for OpenMP threads
if [ "$IS_OPENMP" == "yes" ] ; then
NPROCS=2
for j in compact scatter
do
export KMP_AFFINITY=${j}
for i in 1 2 4 8 16
do
export OMP_NUM_THREADS="${i}"
mpirun -np ${NPROCS} ./a.out
done
mpirun -np ${NPROCS} hostname
done
exit
fi


IS_MPI="no"
export OMP_NUM_THREADS=1
export KMP_AFFINITY=compact
if [ "$IS_MPI" == "yes" ] ; then
for i in 1 2 4 8 16 32
do
NPROCS=${i}
mpirun -np ${NPROCS} ./a.out
done
mpirun -np ${NPROCS} hostname
exit
fi

exit


SRCDIR=/home/ra000004/mikami/papi/scripts
cp $SRCDIR/main.papi.f90 f.f90
#	#	mpif90  $PAPI_PRESETS -openmp -V -free f.f90 $PAPI_LIB
#	ifort   -traceback -g -O0 $PAPI_PRESETS -openmp -V -free f.f90 $PAPI_LIB
#	ifort   -traceback -g -O0 $PAPI_PRESETS -V -free f.f90 $PAPI_LIB
#	ifort   -openmp $PAPI_PRESETS -V -free f.f90 $PAPI_LIB
ifort  -openmp $PAPI_PRESETS -V -free f.f90 $PAPI_LIB
export OMP_NUM_THREADS=8
./a.out

cp $SRCDIR/c.papi.c c.c
icc  $PAPI_PRESETS -openmp c.c $PAPI_LIB
./a.out
exit

mpicc  $PAPI_PRESETS -openmp -V -free c.c $PAPI_LIB
sleep 3
export OMP_NUM_THREADS=2
export I_MPI_DEBUG=3
export I_MPI_FABRICS="shm:ofa"

#       mpiexec.hydra -np 8 ./a.out
mpirun -np 4 hostname
mpirun -np 4 ./a.out

