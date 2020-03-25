#!/bin/bash
source /usr/share/Modules/init/bash
module purge
module load pgi
module list
set -x
date
SRCDIR=/home/ra000004/mikami/papi/papi-5.2.0-pgi/src
cd $SRCDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi

make distclean
make clean
sleep 10
./configure F77=pgf90 CC=pgcc CFLAGS='-mp=nonuma'

#	PREFIX=/usr/local/papi/papi-5.2.0/pgi
#	./configure F77=pgf90 CC=pgcc FFLAGS='-mp=nonuma' CFLAGS='-mp=nonuma' \
#		--prefix="${PREFIX}"
make
make test
# The last step must be done by root
#	make install-all
#	date

