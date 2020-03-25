#include <mpi.h>
#include <stdio.h>
#include <math.h>
#include <omp.h>
#include "papi.h"
#define MATSIZE 1000

int nsize;
struct {
	int nsize;
	float a2[MATSIZE][MATSIZE];
	float b2[MATSIZE][MATSIZE];
	float c2[MATSIZE][MATSIZE];
} matrix;
extern "C" void set_array(), subkerel();
int my_id, npes, num_threads;


int main (int argc, char *argv[])
{

double flop_count;
double tt, t1, t2, t3, t4;
int i, j, k, loop;
float real_time, proc_time, mflops;
float real_time0, proc_time0, mflips;
long long flpops, flpins;
int num_threads;
int retval;

	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &my_id);
	MPI_Comm_size(MPI_COMM_WORLD, &npes);

	num_threads  = omp_get_max_threads();
	if(my_id == 0) {
		printf("<main> MATSIZE=%d max_threads=%d\n", MATSIZE, num_threads);
		}
	printf ( " PAPI_VER_CURRENT=%lu\n", PAPI_VER_CURRENT);

	retval = PAPI_library_init( PAPI_VER_CURRENT );
	if ( PAPI_query_event( PAPI_FP_OPS ) != PAPI_OK ) {
		printf ( "*** Error. PAPI_FP_OPS is not defined...\n" ); }
	if ( PAPI_query_event( PAPI_FP_INS ) != PAPI_OK ) {
		printf ( "*** Error. PAPI_FP_INS is not defined...\n" ); }
	retval = PAPI_thread_init( (unsigned long (*)(void)) (omp_get_thread_num) );
	printf ( "<PAPI_thread_init> returned %d\n", retval);

#pragma omp parallel private(retval)
{
	retval = PAPI_flops( &real_time, &proc_time, &flpops, &mflops );
	if ( retval != PAPI_OK ) {
		printf ( "*** PAPI_flops failed... %d\n", retval );
	}
}

	nsize=MATSIZE;
	matrix.nsize=nsize;
	k=nsize-1;
	set_array();

	t3=MPI_Wtime();
	t4=MPI_Wtime();
	loop=5;
	for (i=1; i<=loop; i++){
		t1=MPI_Wtime();
		subkerel();
		t2=MPI_Wtime();
		MPI_Barrier(MPI_COMM_WORLD);
		if(my_id == 0) printf("step %d finished in %f seconds\n", i,(t2-t1));
	}
	flop_count=pow ((double)nsize, 3.0)*4.0*(float)loop;
	if(my_id == 0) { printf("<main> exact flop count: %15.0f \n", flop_count);}

float fp1,fp2,fp4;
long long ip3=0;
#pragma omp parallel private(fp1,fp2,ip3,fp4)
{
	retval = PAPI_flops( &fp1, &fp2, &ip3, &fp4 );
	if ( retval != PAPI_OK ) printf ( "*** PAPI_flops failed...\n" );

	#pragma omp critical
	{
	flpops += ip3;
	mflops += fp4;
	printf( "FLOP fp1: %f fp2: %f ip3: %lld fp4: %f\n", fp1, fp2, ip3, fp4 );
	}
}
	printf( "FLOP RealT: %f ProcT: %f Flpops: %lld MFlops: %f\n", real_time, proc_time, flpops, mflops );

MPI_Finalize();
return 0;
}

