// pmlib C test program based on stream.c by John McCalpin
# include <stdio.h>
# include <math.h>
# include <float.h>
# include <limits.h>
# include <sys/time.h>

# define N	1000000000	// 1,000,000,000 == 1G //
# define NTIMES	10
//	# define N	1000000
//	# define NTIMES	10
//	# define N	10000
//	# define NTIMES	100
//	//	# define NTIMES	1
# define OFFSET	0

# ifndef MIN
# define MIN(x,y) ((x)<(y)?(x):(y))
# endif
# ifndef MAX
# define MAX(x,y) ((x)>(y)?(x):(y))
# endif

# define PRECISION float
static PRECISION	a[N+OFFSET], b[N+OFFSET], c[N+OFFSET];
static PRECISION	bytes[4] = {
    2 * sizeof(PRECISION) * N,
    2 * sizeof(PRECISION) * N,
    3 * sizeof(PRECISION) * N,
    3 * sizeof(PRECISION) * N
    };
static PRECISION	scalar;


static double	avgtime[4] = {0}, maxtime[4] = {0},
		mintime[4] = {FLT_MAX,FLT_MAX,FLT_MAX,FLT_MAX};
static char	*label[4] = {"Copy:      ", "Scale:     ",
    "Add:       ", "Triad:     "};

extern double mysecond();
#ifdef __cplusplus
extern "C" int omp_get_num_threads();
#else
extern int omp_get_num_threads();
#endif

void bandwidth()
{
    int			BytesPerWord;
    register int	j, k, nth;
    double		times[4][NTIMES];

    printf("Array Copy size = %d\n" , N);

#ifdef _OPENMP
#pragma omp parallel 
    {
#pragma omp master
	{
	    nth = omp_get_num_threads();
	    printf ("Number of Threads requested = %i\n",nth);
        }
    }
// end of #pragma omp parallel 
#endif


    /* Get initial value for system clock. */
#pragma omp parallel for
    for (j=0; j<N; j++) {
	a[j] = 1.0;
	b[j] = 2.0;
	//	c[j] = 0.0;
	}
/*
*/

    /*	--- MAIN LOOP --- repeat test cases NTIMES times --- */

    scalar = 3.0;
    for (k=0; k<NTIMES; k++)
	{
	times[0][k] = mysecond();
#pragma omp parallel for
	//	for (j=0; j<N; j++)
	for (j=k; j<k+1; j++)	// skip it
	    c[j] = a[j];
	times[0][k] = mysecond() - times[0][k];
	
	times[1][k] = mysecond();
#pragma omp parallel for
	//	for (j=0; j<N; j++)
	for (j=k; j<k+1; j++)	// skip it
	    b[j] = scalar*c[j];
	times[1][k] = mysecond() - times[1][k];
	
	times[2][k] = mysecond();
#pragma omp parallel for
	for (j=0; j<N; j++)
	    c[j] = a[j]+b[j];
	times[2][k] = mysecond() - times[2][k];
	
	times[3][k] = mysecond();
#pragma omp parallel for
	//	for (j=0; j<N; j++)
	for (j=k; j<k+1; j++)	// skip it
	    a[j] = b[j]+scalar*c[j];
	times[3][k] = mysecond() - times[3][k];

	}

    /*	--- SUMMARY --- */

    for (k=1; k<NTIMES; k++) /* note -- skip first iteration */
	{
	for (j=0; j<4; j++)
	    {
	    avgtime[j] = avgtime[j] + times[j][k];
	    mintime[j] = MIN(mintime[j], times[j][k]);
	    maxtime[j] = MAX(maxtime[j], times[j][k]);
	    }
	}
    
    printf("Function      Rate (MB/s)   Avg time     Min time     Max time\n");
    //	for (j=0; j<4; j++) {
    j=2; {
	avgtime[j] = avgtime[j]/(double)(NTIMES-1);

	printf("%s%11.3f  %11.6f  %11.6f  %11.6f\n", label[j],
	       1.0E-06 * bytes[j]/mintime[j],
	       avgtime[j],
	       mintime[j],
	       maxtime[j]);
    }
}


/* A gettimeofday routine to give access to the wall
   clock timer on most UNIX-like systems.  */

#include <sys/time.h>

double mysecond()
{
        struct timeval tp;
        struct timezone tzp;
        int i;

        i = gettimeofday(&tp,&tzp);
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}

