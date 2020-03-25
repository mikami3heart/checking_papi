#!/bin/bash
#PJM -N FUGAKU-CPUINFO
#PJM --rsc-list "rscunit=rscunit_ft02"
#PJM --rsc-list "rscgrp=dv1-10"
#PJM --rsc-list "node=1"
#PJM --rsc-list "elapse=00:2:00"
#PJM --mpi "proc=2"
#PJM -j
#PJM -S

module load lang
module list
set -x

cat /proc/cpuinfo
xospastop
papi_avail -a
