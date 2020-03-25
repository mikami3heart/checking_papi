#include <stdio.h>
#include <math.h>

static int nsize=1000;
struct {
	int nsize;
	float a2[MATSIZE][MATSIZE];
	float b2[MATSIZE][MATSIZE];
	float c2[MATSIZE][MATSIZE];
} matrix;


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
