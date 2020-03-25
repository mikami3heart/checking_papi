#!/bin/bash
#PJM -N CHECK-LIB
#PJM --rsc-list "rscunit=rscunit_ft02"
#PJM --rsc-list "rscgrp=dv1-10"
#PJM --rsc-list "node=1"
#PJM --rsc-list "elapse=00:1:00"
#PJM -j
#PJM -S

module load lang
module list
set -x

# Run this command on the Login-node

file /opt/FJSVxos/devkit/aarch64/rfs/usr/lib64/libpapi.so

cd /opt ; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
find . -name libpapi.so

#	exit
#	LIB_DIR=/opt/FJSVXosDevkit
#	cd ${LIB_DIR}; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
#	find . -name libpapi.so


