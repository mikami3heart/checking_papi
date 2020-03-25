#!/bin/bash
#	module purge
#	source /usr/share/Modules/init/bash
#	module load intel 
INTEL_TOP=/opt/intel
source ${INTEL_TOP}/bin/compilervars.sh intel64

set -x
date
WDIR=$CWD
cd $WDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.5.1-intel

export PATH=${PAPI_DIR}/bin:${PATH}
export LD_LIBRARY_PATH+=${PAPI_DIR}/lib
papi_avail -a

papi_avail -d
