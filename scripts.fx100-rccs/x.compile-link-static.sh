#!/bin/bash
#	module list
date
hostname

WK_DIR=${HOME}/papi/scripts
cd $WK_DIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm a.out

#   FJ='-L/opt/FJSVXosDevkit/sparc64fx/V02L01E07/rfs/usr/lib64'
#   PAPI_LDFLAGS="${FJ} -lpapi -lpfm "
#   PAPI_LDFLAGS="${FJ} -Bstatic -lpapi -lpfm -Bdynamic "
PAPI_LDFLAGS="${FJ} -Wl,-Bstatic,-lpapi,-lpfm,-Bdynamic "

CFLAGS="-Ntl_notrt -w "
set -x
fccpx  ${CFLAGS} check_papi_version.c   ${PAPI_LDFLAGS}
file a.out

