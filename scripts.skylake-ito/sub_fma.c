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


void subkernel()
{
int i, j, k;
PRECISION c1;
int nsize = MATSIZE;

	matrix.nsize = nsize;

	for (i=0; i<nsize; i++){
	for (j=0; j<nsize; j++){
	//	matrix.a2[i][j] = sin((PRECISION)j/(PRECISION)nsize);
	//	matrix.b2[i][j] = cos((PRECISION)j/(PRECISION)nsize);
	matrix.a2[i][j] = (PRECISION)j;
	matrix.b2[i][j] = (PRECISION)i;
	matrix.c2[i][j] = 0.0;
	}
	}

	//	c1 + matrix.c2[10][10];
	for (i=0; i<nsize; i++){
	for (j=0; j<nsize; j++){
	for (k=0; k<nsize; k++){
	matrix.c2[j][k] = matrix.c2[j][k] + matrix.a2[i][k] *matrix.b2[j][k];
	}
	}
	}
}

