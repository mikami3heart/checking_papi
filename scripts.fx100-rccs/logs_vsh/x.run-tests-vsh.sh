#!/bin/bash
#BSUB -J PAPI-I-IMPI
#BSUB -o PAPI-I-IMPI-%J
#BSUB -n 2
#BSUB -R "span[ptile=1]"
#BSUB -x
module load intel impi papi/intel
#	PAPI_ROOT=/usr/local/papi/papi-5.2.0/intel
#	PAPI_BIN=$PAPI_ROOT/bin
#	PAPI_INCLUDE=$PAPI_ROOT/include
module list
set -x
date

PAPI_FTESTS=$PAPI_ROOT/share/papi/ftests
PAPI_CTESTS=$PAPI_ROOT/share/papi/ctests
PAPI_LIB="$PAPI_ROOT/lib/libpapi.a $PAPI_ROOT/lib/libpfm.a"
PAPI_PRESETS="-I$PAPI_INCLUDE -I$PAPI_FTESTS -I$PAPI_CTESTS $PAPI_LIB $PFM_LIB"
PAPI_TESTLIB=$PAPI_ROOT/share/papi/testlib

#	WKDIR=/home/ra000004/mikami/tmp/wrk_dir/check_papi
WKDIR=/media/dali/data1/mikami/check_stream_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*


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

SRCDIR=/home/ra000004/mikami/papi/papi-5.3.2-intel/src/utils
cp $SRCDIR/avail.c c.c
cp $SRCDIR/*.h .

ls -go
icc  -c99 -g $PAPI_PRESETS -openmp c.c $PAPI_LIB \
	-L${PAPI_TESTLIB} -ltestlib -I${PAPI_TESTLIB} 

export OMP_NUM_THREADS=1
./a.out

rm a.out
SRCDIR=/home/ra000004/mikami/papi/scripts
cp $SRCDIR/main.papi.f90 f.f90
ifort  -openmp $PAPI_PRESETS -V -free f.f90 $PAPI_LIB \
	-L${PAPI_TESTLIB} -ltestlib
export OMP_NUM_THREADS=8
./a.out

rm a.out
cp $SRCDIR/c.papi.c c.c
icc  $PAPI_PRESETS -openmp c.c $PAPI_LIB
./a.out
exit


cp $SRCDIR/hl_rates.c c.c
#	cp $SRCDIR/high-level2.c c.c
#	cp $SRCDIR/nineth.c c.c
#	cp $SRCDIR/flops.c c.c
#	cp $SRCDIR/val_omp.c c.c
#	cp $SRCDIR/avail.c c.c
cp $SRCDIR/*.h .
cp $SRCDIR/../testlib/*.h .
cp $SRCDIR/../testlib/test_utils.o .
cp $SRCDIR/../testlib/do_loops.o .
cp $SRCDIR/../testlib/dummy.o .
#	ifort  $PAPI_PRESETS -openmp -V f.F $PAPI_LIB *.o
icc  -c99 $PAPI_PRESETS -openmp -V c.c $PAPI_LIB *.o
#	ldd ./a.out
./a.out
