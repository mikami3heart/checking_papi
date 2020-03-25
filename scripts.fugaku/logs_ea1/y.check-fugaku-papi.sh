#!/bin/bash
#PJM -N PAPI_AVAIL
#PJM --rsc-list "rscunit=rscunit_ft02"
#PJM --rsc-list "rscgrp=dv1-10"
#PJM --rsc-list "node=1"
#PJM --rsc-list "elapse=00:1:00"
#PJM -j
#PJM -S

module load lang
module list
set -x
date
hostname
#	grep "model name" /proc/cpuinfo| sort|uniq
HERE=$PWD
cd ${HERE}; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
which papi_avail
papi_avail
papi_avail -a
papi_avail -d
papi_native_avail
papi_event_chooser NATIVE LD_INS
papi_event_chooser NATIVE PAPI_LD_INS

exit
#	frtpx -o serial_hi.ex serial_hi.f90
#	./serial_hi.ex
