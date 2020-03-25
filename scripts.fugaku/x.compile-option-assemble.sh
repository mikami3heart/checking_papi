#	#!/bin/bash
#PJM -N COMPILE-CODE
#PJM --rsc-list "rscunit=rscunit_ft02"
#PJM --rsc-list "rscgrp=dv1-10"
#PJM --rsc-list "node=1"
#PJM --rsc-list "elapse=00:3:00"
#PJM -j
#PJM -S

module load lang
module list
#	set -x
date

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/* >/dev/null 2>&1

SRCDIR=${HOME}/papi/scripts.fugaku
cp $SRCDIR/src_subs/sub_fma.c sub.c

set -x
for opt in \
"-O0" \
"-O1" \
"-O2" \
"-Kfast" \

do
CFLAGS="${opt} -Knounroll,noswp,noopenmp -w "
mpifcc -c ${CFLAGS} -S -Nlst=t sub.c 
mv sub.s sub.s${opt}
mv sub.lst sub.lst${opt}
done

