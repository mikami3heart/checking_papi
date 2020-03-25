#!/bin/bash
#BSUB -J PAPI-GNU
#BSUB -o PAPI-GNU-%J
#BSUB -n 2
#BSUB -R "span[ptile=1]"
#BSUB -x
#	source /usr/share/Modules/init/bash
module load gnu openmpi/gnu papi/gnu
module list
set -x
date
hostname

WKDIR=/work/ra000004/mikami/scratch/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

SRCDIR=/home/ra000004/mikami/papi/scripts
cp $SRCDIR/check_papi.c c.c
mpicc ${INCLUDES} ${CFLAGS} c.c ${LDFLAGS} 
export OMP_NUM_THREADS=1
mpirun -np 2 ./a.out


