//	#define PAPI_VERSION_NUMBER(maj,min,rev,inc) (((maj)<<24) | ((min)<<16) | ((rev)<<8) | (inc))
//	#define PAPI_VERSION_MAJOR(x)    (((x)>>24)    & 0xff)
//	#define PAPI_VERSION_MINOR(x)    (((x)>>16)    & 0xff)
//	#define PAPI_VERSION_REVISION(x) (((x)>>8)     & 0xff)
//	#define PAPI_VERSION_INCREMENT(x)((x)          & 0xff)



#include <stdlib.h>
#include <stdio.h>
#include <papi.h>

void handle_error(int retval) { printf("*** Error %d\n", retval); }

main()
{
    int retval, EventSet = PAPI_NULL;
    int native = 0x0;
	const PAPI_hw_info_t *hwinfo = NULL;

//	printf("PAPI_VERSION(3.6.2.0)=%ld\n", PAPI_VERSION_NUMBER(3,6,2,0));
//	printf("PAPI_VERSION(4.1.3.0)=%ld\n", PAPI_VERSION_NUMBER(4,1,3,0));
//	printf("PAPI_VERSION(5.5.1.0)=%ld\n", PAPI_VERSION_NUMBER(5,5,1,0));
printf("PAPI_VERSION(5.6.0.0)=%ld\n", PAPI_VERSION_NUMBER(5,6,0,0));
//	printf("PAPI_VERSION(5.7.0.0)=%ld\n", PAPI_VERSION_NUMBER(5,7,0,0));
printf("PAPI_VER_CURRENT=%ld\n", PAPI_VER_CURRENT);
printf("PAPI_VERSION_MAJOR()=%ld\n", PAPI_VERSION_MAJOR(PAPI_VER_CURRENT) );
printf("PAPI_VERSION_MINOR()=%ld\n", PAPI_VERSION_MINOR(PAPI_VER_CURRENT) );
printf("PAPI_VERSION_REVISION()=%ld\n", PAPI_VERSION_REVISION(PAPI_VER_CURRENT) );
printf("PAPI_VERSION_INCREMENT()=%ld\n", PAPI_VERSION_INCREMENT(PAPI_VER_CURRENT) );
	 

    /* Initialize the library */
    retval = PAPI_library_init(PAPI_VER_CURRENT);
    if (retval != PAPI_VER_CURRENT) {
        printf("PAPI library init error!\n");
        exit(1);
    }


// Identify the CPU architecture

    hwinfo = PAPI_get_hardware_info();
    if (hwinfo == NULL) {
        fprintf (stderr, "*** error. <PAPI_get_hardware_info> failed.\n" );
    }
    fprintf (stderr, "<PAPI_get_hardware_info>\n");
    fprintf (stderr, " vendor=%d  \n", hwinfo->vendor);
    fprintf (stderr, " vendor_string=%s \n", hwinfo->vendor_string);
    fprintf (stderr, " model=%d \n", hwinfo->model);
    fprintf (stderr, " model_string=%s \n", hwinfo->model_string);
    fprintf (stderr, " ncpu=%d, threads=%d, cores=%d, sockets=%d \n", hwinfo->ncpu, hwinfo->threads, hwinfo->cores, hwinfo->sockets);
    fprintf (stderr, " nnodes=%d, totalcpus=%d \n", hwinfo->nnodes, hwinfo->totalcpus);
    fprintf (stderr, " cpuid_family=%d, cpuid_model=%d, cpuid_stepping=%d \n", hwinfo->cpuid_family, hwinfo->cpuid_model, hwinfo->cpuid_stepping);



    /* Create an EventSet */
    retval = PAPI_create_eventset(&EventSet);
    if (retval != PAPI_OK) handle_error(retval);

    /* Find the first available native event */
    native = PAPI_NATIVE_MASK | 0;
    retval = PAPI_enum_event(&native, PAPI_ENUM_FIRST);
    if (retval != PAPI_OK) handle_error(retval);

    /* Add it to the eventset */
    retval = PAPI_add_event(EventSet, native);
    if (retval != PAPI_OK) handle_error(retval);

    /* Exit successfully */
    printf("Success!\n");
    exit(0);
}
