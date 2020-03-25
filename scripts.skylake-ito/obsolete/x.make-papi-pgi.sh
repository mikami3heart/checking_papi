#!/bin/bash
# PGI compiler is available on ITO subsystem-B only.
#PJM -N B-PGI-xjunks
#PJM -L "elapse=0:30:00"
#PJM -L "rscunit=ito-b"        
#PJM -L "rscgrp=ito-g-16-dbg"
#PJM -L "vnode=2"
#PJM --mpi "proc=2"
#PJM -j
#PJM -S

module load pgi/17.7 pgi/17.7_openmpi
module list
set -x
hostname
date
cd ${HOME}/prog_c
rm a.out
pgcc -v macro.c
./a.out
if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

export CC=pgcc CXX=pgc++ F90=pgf90 FC=pgfortran

CXXFLAGS="-DUSE_PRECISE_TIMER -mp "
FCFLAGS="-Mpreprocess -mp "
CFLAGS="-mp "
LDFLAGS="-pgc++libs "
#   LDFLAGS="-pgc++libs -Mnomain "
DEBUG=""
#   DEBUG="-O0 -g -v "
#   DEBUG+="-DDEBUG_PRINT_MONITOR "
#   DEBUG+="-DDEBUG_PRINT_WATCH "
#   DEBUG+="-DDEBUG_PRINT_PAPI "
#   DEBUG+="-DDEBUG_PRINT_PAPI_THREADS "
#   DEBUG+="-DDEBUG_PRINT_LABEL " 
#   DEBUG+="-DDEBUG_PRINT_OTF "
#   DEBUG+="-DDEBUG_FORT "   
#   DEBUG+="-DDEBUG_PRINT_MPI_GROUP "

PREFIX=${HOME}/papi/usr_local_papi/papi-5.6.0-pgi
SRCDIR=${HOME}/papi/papi-5.6.0-pgi/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
make distclean

# Edit line 14 of ${SRCDIR}/validation_tests/Makefile.target.in
#	LDFLAGS = @LDL@ @STATIC@ @LDFLAGS@

export LANG=C
./configure CC=pgcc F77=pgfortran MPICC=mpicc --prefix="${PREFIX}"
make
make test
#	make install
# The last step must be done by root
make install-all
#       ln -s lib lib64
#   date


