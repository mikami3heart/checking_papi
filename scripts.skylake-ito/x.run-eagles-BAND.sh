#!/bin/bash
#PBS -N PAPI-IVY-VEC
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -q quv

#	module list
#	set -x
date
hostname

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*

SRCDIR=${HOME}/papi/scripts
cp $SRCDIR/check_papi_band_eagles.cpp main.cpp
cp $SRCDIR/sub_fma.c sub.c
#	cp $SRCDIR/sub_stream.c sub.c

CXXFLAGS="-no-ipo -qopenmp "
FCFLAGS="-no-ipo -qopenmp "
#	CFLAGS="-no-ipo -std=c99 -qopenmp "
#	CFLAGS="-Ofast -no-ipo -std=c99 -qopenmp -xHost "
#	CFLAGS="-std=c99 -qopenmp -xavx -opt-report=3 "
#	CFLAGS="-O2 -no-ipo -std=c99 -qopenmp -xavx "
#	CFLAGS="-Fa -unroll=0 -Ofast -no-ipo -qopenmp -fma -xHost -opt-report=3 "
#	CFLAGS="-O2 -no-ipo -std=c99 -qopenmp -xsse4.1 -xavx "

#	CFLAGS="-Ofast -no-ipo -qopenmp -fma -xcore-avx2 -xHost "
#	CFLAGS="-O2 -no-ipo -qopenmp -fma -xsse4.1 "
#	CFLAGS="-O1 -no-ipo -qopenmp "
CFLAGS="-unroll=0 -O0 -no-ipo -qopenmp "


PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.5.1-intel
PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/intel

# on Login node
PAPI_LDFLAGS="-L${PAPI_DIR}/lib -lpapi -lpfm "
PAPI_LDFLAGS="${PAPI_DIR}/lib/libpapi.a ${PAPI_DIR}/lib/libpfm.a "
PAPI_INCLUDES="-I${PAPI_DIR}/include "

PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPMmpi -lpapi_ext "

MPI_LDFLAGS="-lmpi "

#	icpc ${CXXFLAGS} main.cpp ${PAPI_INCLUDES} ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}
#	exit
set -x
icpc -c ${CXXFLAGS} main.cpp ${PAPI_INCLUDES}
icc  -c ${CFLAGS} sub.c 
icpc ${CXXFLAGS}  main.o sub.o ${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS}

export OMP_NUM_THREADS=1
#	mpijob omplace ./a.out
mpirun -np 1 ./a.out

exit


# IVY
L2_TRANS:ALL  1,005,922,562
#0, 40000023                                 L2_TRANS  1005922562 == L2_TRANS:ALL

#0, 40000023                          L2_TRANS:ALL_PF  251087311
#1, 40000024                             L2_TRANS:RFO  66171
#2, 40000025                           L2_TRANS:L2_WB  124963600    WB access
#3, 40000026                          L2_TRANS:L1D_WB  125052923    WB access
#4, 40000027                    L2_TRANS:DMND_DATA_RD  251862169
#5, 40000028                         L2_TRANS:CODE_RD  3412
#6, 40000029                         L2_TRANS:L2_FILL  251777101

#0, 7fff                                 L2_RQSTS  0    *** error

#0, 4000000b                     L2_RQSTS:ALL_CODE_RD  202
#1, 40000004              L2_RQSTS:ALL_DEMAND_DATA_RD  251764475
#2, 40000023                          L2_RQSTS:ALL_PF  251011873
#3, 4000001d                         L2_RQSTS:ALL_RFO  58375



# HASWELL
L2_TRANS:ALL_REQUESTS 1,017,575,155
#1, 40000029                                 L2_TRANS  1017575155 == L2_TRANS:ALL_REQUESTS

#0, 40000028                          L2_TRANS:ALL_PF  250763585
#1, 40000024                             L2_TRANS:RFO  57841
#2, 40000029                           L2_TRANS:L2_WB  124954514    WB access
#3, 40000023                          L2_TRANS:L1D_WB  125052430    WB access
#4, 40000022                  L2_TRANS:DEMAND_DATA_RD  8737203
#5, 4000002a                         L2_TRANS:CODE_RD  2009
#6, 4000002b                         L2_TRANS:L2_FILL  251415044

#0, 40000028                                 L2_RQSTS  502449893
#0, 40000005                     L2_RQSTS:ALL_CODE_RD  322
#1, 40000008              L2_RQSTS:ALL_DEMAND_DATA_RD  8172293
#2, 40000028                          L2_RQSTS:ALL_PF  494112047
#3, 40000029                         L2_RQSTS:ALL_RFO  67003



# SKYLAKE
L2_RQSTS:REFERENCES  585,054,345
+ L2_TRANS:L2_WB   203,920,612

#1, 40000030                                 L2_TRANS  203920612    L2 WB access only...
#0, 4000002f                                 L2_RQSTS  584665777

#2, 40000005                     L2_RQSTS:ALL_CODE_RD  8951
#3, 40000008              L2_RQSTS:ALL_DEMAND_DATA_RD  4575268
#4, 40000031                          L2_RQSTS:ALL_PF  580119833
#5, 4000002a                         L2_RQSTS:ALL_RFO  350293
#6, 40000032                      L2_RQSTS:REFERENCES  585054345


# VSH : SANDYBRIDGE V2
L2_TRANS:ALL  1,006,573,565
#0, 40000023                                 L2_RQSTS  17668646803
#1, 40000024                                 L2_TRANS  17668646803
#2, 4000000b                     L2_RQSTS:ALL_CODE_RD  871
#3, 40000004              L2_RQSTS:ALL_DEMAND_DATA_RD  246537456
#4, 40000025                          L2_RQSTS:ALL_PF  247084967
#5, 4000001d                         L2_RQSTS:RFO_ANY  360726

#0, 40000023                                 L2_RQSTS  17676633278
#1, 40000024                             L2_TRANS:ALL  1006573565
#2, 4000000b                     L2_RQSTS:ALL_CODE_RD  406
#3, 40000004              L2_RQSTS:ALL_DEMAND_DATA_RD  246202301
#4, 40000025                          L2_RQSTS:ALL_PF  247036761
#5, 4000001d                         L2_RQSTS:RFO_ANY  360680

