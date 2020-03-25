//	#define PAPI_VERSION_NUMBER(maj,min,rev,inc) (((maj)<<24) | ((min)<<16) | ((rev)<<8) | (inc))
//	#define PAPI_VERSION_MAJOR(x)    (((x)>>24)    & 0xff)
//	#define PAPI_VERSION_MINOR(x)    (((x)>>16)    & 0xff)
//	#define PAPI_VERSION_REVISION(x) (((x)>>8)     & 0xff)
//	#define PAPI_VERSION_INCREMENT(x)((x)          & 0xff)



#include <stdlib.h>
#include <stdio.h>
#include <papi.h>

void handle_error(int retval)
{
printf("*** Error %d\n", retval);
}

main()
{
    int retval, EventSet = PAPI_NULL;
    unsigned int native = 0x0;
    PAPI_event_info_t info;

printf("PAPI_VERSION(3.6.2.0)=%ld\n", PAPI_VERSION_NUMBER(3,6,2,0));
printf("PAPI_VERSION(4.1.3.0)=%ld\n", PAPI_VERSION_NUMBER(4,1,3,0));
printf("PAPI_VERSION(5.5.1.0)=%ld\n", PAPI_VERSION_NUMBER(5,5,1,0));
printf("PAPI_VER_CURRENT=%ld\n", PAPI_VER_CURRENT);
	 
    /* Initialize the library */
    retval = PAPI_library_init(PAPI_VER_CURRENT);
    if (retval != PAPI_VER_CURRENT) {
        printf("PAPI library init error!\n");
        exit(1);
    }

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
