#include <stdio.h>
#include <math.h>
#define MATSIZE 1000

//	typedef float PRECISION;
typedef double PRECISION;

struct {
	int nsize;
	PRECISION a2[MATSIZE][MATSIZE];
	PRECISION b2[MATSIZE][MATSIZE];
	PRECISION c2[MATSIZE][MATSIZE];
} matrix;


void set_array()
{
int i, j, k;
PRECISION c1;
int nsize = MATSIZE;

	matrix.nsize = nsize;

#pragma omp parallel
#pragma omp for
	for (i=0; i<nsize; i++){
	for (j=0; j<nsize; j++){
	matrix.a2[i][j] = sin((PRECISION)j/(PRECISION)nsize);
	matrix.b2[i][j] = cos((PRECISION)j/(PRECISION)nsize);
	//	matrix.a2[i][j] = (PRECISION)j;
	//	matrix.b2[i][j] = (PRECISION)i;
	matrix.c2[i][j] = 0.0;
	}
	}
}

void sub_kernel()
{
int i, j, k;
PRECISION c1;
int nsize = MATSIZE;

	matrix.nsize = nsize;
#pragma omp parallel private(c1)
#pragma omp for
	for (i=0; i<nsize; i++){
	for (j=0; j<nsize; j++){
		c1=0.0;
#pragma nounroll
#ifndef __FUJITSU
#pragma omp simd
#endif
		for (k=0; k<nsize; k++){
		c1=c1 + matrix.a2[i][k] * matrix.b2[j][k];
		}
		matrix.c2[i][j] = matrix.c2[i][j] + c1/(PRECISION)nsize;
	}
	}

fprintf(stderr,"\t Check print before finishing subkernel()\n");
fprintf(stderr,"\t %e, %e \n", matrix.c2[1][1] , matrix.c2[nsize-1][nsize-1] );

}

