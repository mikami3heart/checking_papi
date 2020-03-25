#!/bin/bash
#PBS -N PAPI-IVY-VEC
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -q quv

module purge
#	module load intelcompiler/17.0.5.239 intelmpi/2017.4.239
module load intelcompiler/15.0.6.233 intelmpi/5.0.3.049
module list
#	module list
#	set -x
date
hostname
export LANG=C

WKDIR=${HOME}/tmp/check_papi
mkdir -p $WKDIR
cd $WKDIR; if [ $? != 0 ] ; then echo '@@@ Directory error @@@'; exit; fi
rm $WKDIR/*
pwd

SRCDIR=${HOME}/papi/scripts
cp $SRCDIR/check_papi_band_eagles.cpp main.cpp
cp $SRCDIR/sub_bandwidth.c sub_bandwidth.c
cp $SRCDIR/sub_add.f90 sub_add.f90
#	cp $SRCDIR/sub_fma.c sub.c
#	cp $SRCDIR/sub_stream.c sub.c

#	PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.5.1-intel
#	PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/intel
PAPI_DIR=${HOME}/papi/usr_local_papi/papi-5.6.0-intel
PMLIB_DIR=${HOME}/pmlib/usr_local_pmlib/pmlib-papi56


# on Login node
PAPI_LDFLAGS="-L${PAPI_DIR}/lib -lpapi -lpfm "
PAPI_LDFLAGS="${PAPI_DIR}/lib/libpapi.a ${PAPI_DIR}/lib/libpfm.a "
PAPI_INCLUDES="-I${PAPI_DIR}/include "
PMLIB_LDFLAGS="-L${PMLIB_DIR}/lib -lPMmpi -lpapi_ext "
MPI_LDFLAGS="-lmpi "
LDFLAGS="${PAPI_LDFLAGS} ${PMLIB_LDFLAGS}  ${MPI_LDFLAGS} -qopenmp"
export OMP_NUM_THREADS=1


for i in \
"-Ofast" \
#	"-O0" \

do

#	for j in "-qopt-streaming-stores=auto"
#	do
#	done

#	j="-xsse4.1 "
#	j="-xavx "
#	j="-xcommon-avx2 "
#	j="-xHost "
#	j="-xHost "

#	j="-qopt-streaming-stores=never"
#	j="-qopt-streaming-stores=always"

OPTFLAGS="-unroll=0 -no-ipo -qno-openmp -g -mcmodel=medium ${i} ${j} "

CXXFLAGS="${OPTFLAGS} -w "
CFLAGS="${OPTFLAGS} -w "
FFLAGS="${OPTFLAGS} "

mpiicc  -c ${CFLAGS} -S -fsource-asm sub_bandwidth.c
#	mpiifort  -c ${CFLAGS} -S -fsource-asm sub_add.f90

mpiicpc -c ${CXXFLAGS} main.cpp ${PAPI_INCLUDES}
mpiicc  -c ${CFLAGS} sub_bandwidth.c
mpiicpc ${CXXFLAGS}  main.o sub_bandwidth.o ${LDFLAGS}
mpirun -np 1 ./a.out

done

exit

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

#0, 80000035                              PAPI_LD_INS  14016144216
#1, 80000036                              PAPI_SR_INS  2006004045
#2, 40000023            MEM_LOAD_UOPS_RETIRED:HIT_LFB  338671
#3, 40000024             MEM_LOAD_UOPS_RETIRED:L1_HIT  14011972359
#4, 80000006                              PAPI_L1_TCM  251936145
#5, 80000007                              PAPI_L2_TCM  4973016
#6, 40000025                             L2_TRANS:ALL  1010066475



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
+ L2_TRANS:L2_WB     203,920,612

#1, 40000030                                 L2_TRANS  203920612 == L2_TRANS:L2_WB L2 WB only...
#0, 4000002f                                 L2_RQSTS  584665777

#2, 40000005                     L2_RQSTS:ALL_CODE_RD  8951
#3, 40000008              L2_RQSTS:ALL_DEMAND_DATA_RD  4575268
#4, 40000031                          L2_RQSTS:ALL_PF  580119833
#5, 4000002a                         L2_RQSTS:ALL_RFO  350293
#6, 40000032                      L2_RQSTS:REFERENCES  585054345

#0, 4000002f            MEM_LOAD_UOPS_RETIRED:HIT_LFB  1277321
#1, 40000030             MEM_LOAD_UOPS_RETIRED:L1_HIT  14010201757
#2, 80000006                              PAPI_L1_TCM  251719811
#3, 80000007                              PAPI_L2_TCM  563884383
#4, 40000031                      L2_RQSTS:REFERENCES  585176318
#5, 40000032                                 L2_TRANS  206964467
#6, 40000033                           L2_TRANS:L2_WB  206964467



# IVY

 c[j] = a[j]+b[j];

Array Copy size = 1000000000
3 x 1G x 4 x 10 = 120 GB (80 GB/R + 40 GB/W)

The counted events are:
#0, 80000035                              PAPI_LD_INS  5022966800
#1, 80000036                              PAPI_SR_INS  3000003812
#2, 40000023      OFFCORE_RESPONSE_0:ANY_DATA:L3_MISS  1253345071	: 64 x 1.22G = 80 GB
#3, 40000024       OFFCORE_RESPONSE_0:ANY_RFO:L3_MISS  18768
The counted events are:
#2, 40000023  OFFCORE_RESPONSE_0:ANY_DATA:LLC_HITMESF  673334457	: 64 x 0.67G = 43 GB
#3, 40000024   OFFCORE_RESPONSE_0:ANY_RFO:LLC_HITMESF  13341
The counted events are:
#0, 80000007                              PAPI_L2_TCM  630478682
#1, 80000008                              PAPI_L3_TCM  127828241
The counted events are:
#0, 000023 OFFCORE_RESPONSE_0:PF_DATA_RD:ANY_RESPONSE  629652625
#1, 40000024       OFFCORE_RESPONSE_0:WB:ANY_RESPONSE  6644880
The counted events are:
#0, 4000000c          OFFCORE_REQUESTS:DEMAND_DATA_RD  638327888
#1, 40000023              OFFCORE_REQUESTS:DEMAND_RFO  95


The counted events are:
#0, 40000023            MEM_LOAD_UOPS_RETIRED:L2_MISS  561027816
#1, 40000024            MEM_LOAD_UOPS_RETIRED:L3_MISS  106261027
#2, 40000025             OFFCORE_REQUESTS:ALL_DATA_RD  1261087931	: 64 x 1261087931 = 80 GB
#3, 40000026      OFFCORE_RESPONSE_0:ANY_DATA:L3_MISS  1253334053	: 64 x 1253334053 = 80 GB
#4, 40000027       OFFCORE_RESPONSE_0:ANY_RFO:L3_MISS  15720

The counted events are:
#0, 40000023     OFFCORE_RESPONSE_0:ANY_DATA:LLC_HITM  227374
#1, 40000024     OFFCORE_RESPONSE_0:ANY_DATA:LLC_HITE  673198100
#0, 40000023     OFFCORE_RESPONSE_0:ANY_DATA:LLC_HITS  58667
#1, 40000024     OFFCORE_RESPONSE_0:ANY_DATA:LLC_HITF  18254
The counted events are:
#0, 40000023    OFFCORE_RESPONSE_0:PF_DATA_RD:L3_MISS  479906886
#1, 0000024 OFFCORE_RESPONSE_0:PF_DATA_RD:LLC_HITMESF  150645760
#0, 0000023 OFFCORE_RESPONSE_0:PF_LLC_DATA_RD:L3_MISS  645534070
#1, 024 OFFCORE_RESPONSE_0:PF_LLC_DATA_RD:LLC_HITMESF  19558439

# IVY
#2, 40000023      OFFCORE_RESPONSE_0:ANY_DATA:L3_MISS  1253345071
#2, 40000023  OFFCORE_RESPONSE_0:ANY_DATA:LLC_HITMESF  673334457
# HAS
#2, 40000028      OFFCORE_RESPONSE_0:ANY_DATA:L3_MISS  437679409
#3, 40000029       OFFCORE_RESPONSE_0:ANY_DATA:L3_HIT  816820977


#############################################################################################33
Array Copy size = 1000000
3 x 1M x 4 x 10 = 120 MB

The counted events are:
#0, 80000035                              PAPI_LD_INS  5040146
#1, 80000036                              PAPI_SR_INS  3003919
#2, 40000023      OFFCORE_RESPONSE_0:ANY_DATA:L3_MISS  134715	: 64 x 134715 =   7 MB
#3, 40000024       OFFCORE_RESPONSE_0:ANY_RFO:L3_MISS  29
The counted events are:
#2, 40000023  OFFCORE_RESPONSE_0:ANY_DATA:LLC_HITMESF  1452280	: 64 x 1452280 = 93 MB
#3, 40000024   OFFCORE_RESPONSE_0:ANY_RFO:LLC_HITMESF  345
The counted events are:
#0, 80000007                              PAPI_L2_TCM  323663
#1, 80000008                              PAPI_L3_TCM  20059
The counted events are:
#0, 000023 OFFCORE_RESPONSE_0:PF_DATA_RD:ANY_RESPONSE  947254	: 64 x 947254 = 61 MB
#1, 40000024       OFFCORE_RESPONSE_0:WB:ANY_RESPONSE  6684

The counted events are:
#0, 40000023            MEM_LOAD_UOPS_RETIRED:L2_MISS  300618
#1, 40000024            MEM_LOAD_UOPS_RETIRED:L3_MISS  18913
#2, 40000025             OFFCORE_REQUESTS:ALL_DATA_RD  1269373	: 64 x 1269373 = 81 MB
#3, 40000026      OFFCORE_RESPONSE_0:ANY_DATA:L3_MISS  135486	: 64 x 135486 =   9 MB
#4, 40000027       OFFCORE_RESPONSE_0:ANY_RFO:L3_MISS  49


#############################################################################################33
Array Copy size = 10000
3 x 10K x 4 x 100 = 12 MB

The counted events are:
#0, 80000035                              PAPI_LD_INS  527773
#1, 80000036                              PAPI_SR_INS  269440
#2, 40000023      OFFCORE_RESPONSE_0:ANY_DATA:L3_MISS  16
#3, 40000024       OFFCORE_RESPONSE_0:ANY_RFO:L3_MISS  0
The counted events are:
#2, 40000023  OFFCORE_RESPONSE_0:ANY_DATA:LLC_HITMESF  8131	: 64 x 8131 = 0.5 KB
#3, 40000024   OFFCORE_RESPONSE_0:ANY_RFO:LLC_HITMESF  22429 : 64 x 22429 = 1.4 MB
The counted events are:
#0, 80000007                              PAPI_L2_TCM  21058 : 64 x 21058 = 1.3 MB
#1, 80000008                              PAPI_L3_TCM  103
The counted events are:
#0, 40000023 OFFCORE_RESPONSE_0:PF_DATA_RD:ANY_RESPONSE  8237
#1, 40000024       OFFCORE_RESPONSE_0:WB:ANY_RESPONSE  13510

The counted events are:
#2, 40000023             OFFCORE_REQUESTS:ALL_DATA_RD  9776	: 64 x 9776 = 0.6 MB
#3, 40000024      OFFCORE_RESPONSE_0:ANY_DATA:L3_MISS  72

The counted events are:
#0, 40000023            MEM_LOAD_UOPS_RETIRED:HIT_LFB  362626
#1, 40000024             MEM_LOAD_UOPS_RETIRED:L1_HIT  49528
#2, 80000006                              PAPI_L1_TCM  190690	: 64 x 190690 = 12 MB
#3, 80000007                              PAPI_L2_TCM  21624	: 64 x 21624 = 1.4 MB
#4, 80000008                              PAPI_L3_TCM  87


==> CACHE is more useful for short loops

