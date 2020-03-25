#!/bin/bash
#BSUB -J PAPI-PGI
#BSUB -o PAPI-PGI-%J
#BSUB -n 2
#BSUB -R "span[ptile=1]"
#BSUB -x
#	source /usr/share/Modules/init/bash
module load pgi openmpi/pgi papi/gnu
module list
set -x
date
hostname

#	WKDIR=/home/ra000004/mikami/tmp/wrk_dir/check_papi
WKDIR=/work/ra000004/mikami/scratch/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

SRCDIR=/home/ra000004/mikami/papi/scripts
cp $SRCDIR/check_papi.c c.c

#	CFLAGS=' '
#	INCLUDES='-I/usr/local/papi/papi-5.2.0/gnu/include'
#	LDFLAGS=' -L/usr/local/papi/papi-5.2.0/gnu/lib -lpapi -lpfm '
#	export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/papi/papi-5.2.0/gnu/lib
mpicc ${INCLUDES} ${CFLAGS} c.c ${LDFLAGS} 
export OMP_NUM_THREADS=1
mpirun -np 2 ./a.out


