#!/bin/bash
set -x
date
#	SRCDIR=${HOME}/papi/papi-5.4.1/src
SRCDIR=${HOME}/papi/papi-5.5.1/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

CXXFLAGS="-Kopenmp,fast -Ntl_notrt  -v -Nfjcex"
CFLAGS="-std=c99 -Kopenmp,fast -Ntl_notrt -w"
FCFLAGS="-Cpp -Kopenmp,fast -Ntl_notrt -w"

INSTALL_DIR=${HOME}/papi/install_fx100_5.5.1
make clean
./configure --prefix=$PREFIX F77=frt CC=fcc CXX=FCC \
CXXFLAGS="-Kopenmp,fast -Ntl_notrt  -v -Nfjcex" \
CFLAGS="-std=c99 -Kopenmp,fast -Ntl_notrt -w" \
FCFLAGS="-Cpp -Kopenmp,fast -Ntl_notrt -w"

exit

#./configure --prefix=$PREFIX F77=frtpx CC=fccpx CXX=FCCpx \
#	--host=sparc64-unknown-linux-gnu \
#CXX=FCCpx CXXFLAGS="${CXXFLAGS}" \
#CC=fccpx CFLAGS="${CFLAGS}" \
#FC=frtpx FCFLAGS="${FCFLAGS}"

make
make test
# The last step must be done by root
#	make install-all
#	date

