#! /bin/bash
source /home/system/Env_base
echo \
./configure F77=frt FFLAGS="-Kfast,parallel,ocl,openmp,optmsg=2 -Qt" \
	CC=gcc

./configure F77=frt FFLAGS="-Kfast,parallel,ocl,openmp,optmsg=2 -Qt" \
	CC=gcc

exit
echo \
./configure F77=frt FFLAGS="-Kfast,parallel,ocl,openmp,optmsg=2 -Qt" \
	CC=fcc CFLAGS="-Kfast,parallel,ocl"

./configure F77=frt FFLAGS="-Kfast,parallel,ocl,openmp,optmsg=2 -Qt" \
	CC=fcc CFLAGS="-Kfast,parallel,ocl"

