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

void set_array(), subkerel(), print_header();
int my_id, npes, num_threads, retval;


int main (int argc, char *argv[])
{
double tt, t1, t2, t3, t4;
int i, j, k, loop;
//	FILE *fp;
char fn[]="tmp.cio.###";
float real_time, proc_time, mflops;
float real_time0, proc_time0, mflips;
long_long flpops, flpins;
int num_threads;

	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &my_id);
	MPI_Comm_size(MPI_COMM_WORLD, &npes);

	num_threads  = omp_get_max_threads();
	if(my_id == 0) {
		printf("<main> MATSIZE=%d max_threads=%d\n", MATSIZE, num_threads);
	}
	retval = PAPI_library_init( PAPI_VER_CURRENT );
    printf ( "<PAPI_library_init> returned %d\n", retval);
	retval = PAPI_thread_init( (unsigned long (*)(void)) (omp_get_thread_num) );
    printf ( "<PAPI_thread_init> returned %d\n", retval);

#pragma omp parallel
{
	retval = PAPI_flops( &real_time, &proc_time, &flpops, &mflops );
	if ( retval < PAPI_OK ) printf ( "*** PAPI_flops failed...\n" );
}
	nsize=MATSIZE;
	loop=5;
	set_array();
	for (i=1; i<=loop; i++){
		t1=MPI_Wtime();
		subkerel();
		t2=MPI_Wtime();
		MPI_Barrier(MPI_COMM_WORLD);
	if(my_id == 0) { printf("step %d finished in %f seconds\n", i,(t2-t1));}

	}
	double flop_count=pow ((double)nsize, 3.0)*4.0*(float)loop;
	if(my_id == 0) { printf("exact flop count is : %15.0f \n", flop_count);}

	float fp1,fp2,fp4;
	long long ip3=0;
#pragma omp parallel
{
	retval = PAPI_flops( &fp1, &fp2, &ip3, &fp4 );
	if ( retval != PAPI_OK ) printf ( "*** PAPI_flops failed...\n" );
	#pragma omp critical
	{
	//  #pragma omp atmic update
	flpops += ip3;
	mflops += fp4;
	}
	printf( "FLOP fp1: %f fp2: %f ip3: %lld fp4: %f\n", fp1, fp2, ip3, fp4 );
}
	printf( "FLOP RealT: %f ProcT: %f Flpops: %lld MFlops: %f\n", real_time, proc_time, flpops, mflops );

MPI_Finalize();
return 0;
}

void set_array()
{
int i, j, k;
float f1,f2,f3;
	matrix.nsize = nsize;
#pragma omp parallel
#pragma omp for
	for (i=0; i<nsize; i++){
	for (j=0; j<nsize; j++){
	matrix.a2[i][j] = sin((float)j/(float)nsize);
	matrix.b2[i][j] = cos((float)j/(float)nsize);
	matrix.c2[i][j] = 0.0;
	}
	}
}

void subkerel()
{
int i, j, k;
float c1;
#pragma omp parallel
#pragma omp for
	for (i=0; i<nsize; i++){
	for (j=0; j<nsize; j++){
		c1=0.0;
		for (k=0; k<nsize; k++){
		c1=c1 + matrix.a2[i][k] * matrix.a2[j][k];
		c1=c1 + matrix.b2[i][k] * matrix.b2[j][k];
		}
		matrix.c2[i][j] = matrix.c2[i][j] + c1/(float)nsize;
	}
	}
}
