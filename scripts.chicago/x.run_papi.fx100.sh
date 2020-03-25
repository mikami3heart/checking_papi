#!/bin/bash
#PJM -N TEST-PAPI-SERIAL
#PJM -L "elapse=1:00:00"
#PJM -L "node=1"
#PJM --mpi "proc=1"
#PJM -j
#PJM -S

#	module list
#	set -x
#	date
#	hostname

xospastop
WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

export OMP_NUM_THREADS=1
#	export PAPI_PERFMON_EVENT_FILE=/usr/share/papi/papi_events.csv
export PAPI_PERFMON_EVENT_FILE=${HOME}/papi/scripts/mods/papi_events.csv
#	papi_avail
./a.out

