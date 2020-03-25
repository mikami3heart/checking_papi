#!/bin/bash
#BSUB -J PAPI-I-IMPI
#BSUB -o PAPI-I-IMPI-%J
#BSUB -n 2
#BSUB -R "span[ptile=1]"
#BSUB -x
source /usr/share/Modules/init/bash
module load intel impi
module list
set -x
date

PAPI_ROOT=/usr/local/papi/papi-5.2.0/intel
PAPI_BIN=$PAPI_ROOT/bin
PAPI_INCLUDE=$PAPI_ROOT/include
PAPI_TESTLIB=$PAPI_ROOT/share/papi/testlib

PAPI_FTESTS=$PAPI_ROOT/share/papi/ftests
PAPI_CTESTS=$PAPI_ROOT/share/papi/ctests
PAPI_LIB="$PAPI_ROOT/lib/libpapi.a $PAPI_ROOT/lib/libpfm.a"
PAPI_PRESETS="-I$PAPI_INCLUDE -I$PAPI_FTESTS -I$PAPI_CTESTS $PAPI_LIB $PFM_LIB"

WKDIR=/home/ra000004/mikami/tmp/wrk_dir/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*

#	cp $SRCDIR/../testlib/*.h .
#	cp $SRCDIR/../testlib/test_utils.o .
#	cp $SRCDIR/../testlib/do_loops.o .
#	cp $SRCDIR/../testlib/dummy.o .
cp -p $PAPI_TESTLIB/*.[oh] .

# Fortran
#	SRCDIR=$PAPI_FTESTS
#	SRCDIR=/home/ra000004/mikami/papi/papi-5.2.0/src/ftests
#	cp $SRCDIR/nineth.F f.F
#	cp $SRCDIR/fmatrixlowpapi.F f.F
#	cp $SRCDIR/fmatrixpapi2.F f.F
#	cp $SRCDIR/flops.F f.F
#	cp $SRCDIR/avail.F f.F
#	cp $SRCDIR/../ftests/ftests_util.o .


# C
#	SRCDIR=$PAPI_CTESTS
#	SRCDIR=/home/ra000004/mikami/papi/papi-5.2.0/src/ctests
#	cp $SRCDIR/hl_rates.c c.c
#	cp $SRCDIR/high-level2.c c.c
#	cp $SRCDIR/nineth.c c.c
#	cp $SRCDIR/flops.c c.c
#	cp $SRCDIR/val_omp.c c.c

SRCDIR=/home/ra000004/mikami/papi/papi-5.2.0/src/utils
cp $SRCDIR/avail.c c.c
cp $SRCDIR/*.h .

#	ifort  $PAPI_PRESETS -openmp -V f.F $PAPI_LIB *.o
icc  -c99 $PAPI_PRESETS -openmp -V c.c $PAPI_LIB *.o
#	ldd ./a.out
export OMP_NUM_THREADS=1

./a.out
./a.out -h


rm a.out
SRCDIR=/home/ra000004/mikami/papi/scripts
cp $SRCDIR/main.papi.f90 f.f90
#	#	mpif90  $PAPI_PRESETS -openmp -V -free f.f90 $PAPI_LIB
#	ifort   -traceback -g -O0 $PAPI_PRESETS -openmp -V -free f.f90 $PAPI_LIB
ifort   -traceback -g -O0 $PAPI_PRESETS -V -free f.f90 $PAPI_LIB
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

