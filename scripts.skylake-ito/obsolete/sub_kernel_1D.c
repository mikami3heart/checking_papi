#include <stdio.h>
#include <math.h>
#define MATSIZE 10000

//	typedef float PRECISION;
typedef double PRECISION;

void subkernel()
{
int i, j, k;
PRECISION c1;
PRECISION* a2;
PRECISION* b2;
PRECISION* c2;
int nsize = MATSIZE*MATSIZE;

a2 = (PRECISION*) malloc(sizeof(PRECISION)*MATSIZE*MATSIZE);
if(a2 == NULL) fprintf(stderr,"<subkernel malloc() error");
b2 = (PRECISION*) malloc(sizeof(PRECISION)*MATSIZE*MATSIZE);
if(b2 == NULL) fprintf(stderr,"<subkernel malloc() error");
c2 = (PRECISION*) malloc(sizeof(PRECISION)*MATSIZE*MATSIZE);
if(c2 == NULL) fprintf(stderr,"<subkernel malloc() error");

#pragma omp parallel
#pragma omp for
	for (i=0; i<nsize; i++){
	for (j=0; j<nsize; j++){
	a2[i*MATSIZE+j] = sin((PRECISION)j/(PRECISION)nsize);
	b2[i*MATSIZE+j] = cos((PRECISION)j/(PRECISION)nsize);
	c2[i*MATSIZE+j] = 0.0;
	}
	}


#pragma omp parallel 
#pragma omp for
	for (i=0; i<nsize; i++){
	for (j=0; j<nsize; j++){
#pragma nounroll
#ifndef __FUJITSU
#pragma omp simd
#endif
	c2[i*MATSIZE+j] = c2[i*MATSIZE+j] +
		a2[i*MATSIZE+j] * a2[i*MATSIZE+j] +
		b2[i*MATSIZE+j] * b2[i*MATSIZE+j] ;
	}
	}

fprintf(stderr,"\t Check print before finishing subkernel()\n");
fprintf(stderr,"\t %e, %e \n", c2[nsize-1] , c2[(nsize-1)*(nsize-1)] );
free(a2);
free(b2);
free(c2);
}

