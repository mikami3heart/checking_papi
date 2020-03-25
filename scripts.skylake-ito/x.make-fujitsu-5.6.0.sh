#!/bin/bash
module list
set -x
date

PREFIX=${HOME}/papi/usr_local_papi/papi-5.6.0-fujitsu
SRCDIR=${HOME}/papi/papi-5.6.0-fujitsu/src
#	PREFIX=${HOME}/papi/usr_local_papi/papi-5.5.1-fujitsu
#	SRCDIR=${HOME}/papi/papi-5.5.1-fujitsu/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
make distclean

# Edit line 14 of ${SRCDIR}/validation_tests/Makefile.target.in
#	LDFLAGS = @LDL@ @STATIC@ @LDFLAGS@

export LANG=C
export CFLAGS="-Xg -fvisibility=default "
export CPPFLAGS="-Xg -fvisibility=default "
./configure F77=frt CC=fcc CXX=FCC MPICC=mpifcc --prefix="${PREFIX}"
#	export CFLAGS="-Xg -std=gnu99 -fvisibility=default "
#	export CPPFLAGS="-Xg -std=gnu99 -fvisibility=default "
#	./configure F77=frt CC=fcc MPICC=mpifcc --prefix="${PREFIX}"
make
make test
#	make install
# The last step must be done by root
make install-all
#       ln -s lib lib64
#   date


