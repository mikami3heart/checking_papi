#!/bin/bash
#	module list
#	set -x
date
hostname

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*

SRCDIR=${HOME}/papi/scripts
#	cp $SRCDIR/main_papi_events.cpp main.cpp
#	cp $SRCDIR/sub_stream.c sub.c
#	cp $SRCDIR/sub_sp_stream.c sub.c
cp $SRCDIR/check_papi_fp_fx100.cpp main.cpp
cp $SRCDIR/sub_kernel.c sub.c

CXXFLAGS="-Kopenmp,fast -Ntl_notrt -w"
CFLAGS="-Kopenmp,fast -Ntl_notrt -w"
FCFLAGS="-Cpp -Kopenmp,fast -Ntl_notrt -w"

#	CFLAGS="-Kopenmp -O2 -Ntl_notrt -w"
CFLAGS+=" -g -O2 "
#	CFLAGS+=" -g -O1 "
#	CFLAGS+=" -g -O0 "
#	CXXFLAGS+=" -g -O1 -DDEBUG_PRINT_PAPI -DDEBUG_PRINT_PAPI_THREADS"

#	CFLAGS+=" -Nlst=t -S "

# on Login node
PAPI_LDFLAGS="-lpapi -lpfm "
PMLIB_LDFLAGS="-L${HOME}/pmlib/usr_local_pmlib/fx100/lib -lPMmpi -lpapi_ext "
set -x
mpiFCCpx -c ${CXXFLAGS} main.cpp ${PAPI_LDFLAGS}	#	${PMLIB_LDFLAGS}
mpifccpx  -c ${CFLAGS} sub.c ${PAPI_LDFLAGS}		#	${PMLIB_LDFLAGS}
mpiFCCpx ${CXXFLAGS} main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}

#	# on Compute node
#	PAPI_LDFLAGS="-L/usr/lib64 -lpapi -lpfm "
#	PMLIB_LDFLAGS="-L${HOME}/pmlib/install_develop/lib -lPM -lpapi_ext "
#	FCC -c ${CXXFLAGS} main.cpp ${PAPI_LDFLAGS}	#	${PMLIB_LDFLAGS}
#	fcc  -c ${CFLAGS} sub.c ${PAPI_LDFLAGS}		#	${PMLIB_LDFLAGS}
#	FCC ${CXXFLAGS} main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}

