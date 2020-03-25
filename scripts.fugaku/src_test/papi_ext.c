#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <papi.h>

#define HL_STOP		0
#define HL_START	1

typedef struct _HighLevelInfo
{
	int EventSet;		/**< EventSet of the thread */
	short int num_evts;	/**< number of events in the eventset */
	short int running;	/**< STOP, START, or RATE */
	long long initial_real_time;	/**< Start real time */
	long long initial_proc_time;	/**< Start processor time */
	long long last_real_time;	/**< Previous value of real time */
	long long last_proc_time;	/**< Previous value of processor time */
	long long total_ins;		/**< Total instructions */
} HighLevelInfo;

//	extern void _internal_cleanup_hl_info( HighLevelInfo * state );
//	extern int _internal_check_state( HighLevelInfo ** state );
//	extern int _internal_start_hl_counters( HighLevelInfo * state );
extern int _hl_rate_calls( HighLevelInfo * state );


main()
{
    int retval, EventSet = PAPI_NULL;
    unsigned int native = 0x0;
    PAPI_event_info_t info;
	HighLevelInfo *state = NULL;

	retval = _hl_rate_calls( &state ) ;

printf("PAPI_VERSION(5.5.1.0)=%ld\n", PAPI_VERSION_NUMBER(5,5,1,0));
printf("PAPI_VERSION(5.6.0.0)=%ld\n", PAPI_VERSION_NUMBER(5,6,0,0));
printf("PAPI_VERSION(5.7.0.0)=%ld\n", PAPI_VERSION_NUMBER(5,7,0,0));
printf("PAPI_VER_CURRENT=%ld\n", PAPI_VER_CURRENT);
printf("PAPI_VERSION_MAJOR()=%ld\n", PAPI_VERSION_MAJOR(PAPI_VER_CURRENT) );
printf("PAPI_VERSION_MINOR()=%ld\n", PAPI_VERSION_MINOR(PAPI_VER_CURRENT) );
printf("PAPI_VERSION_REVISION()=%ld\n", PAPI_VERSION_REVISION(PAPI_VER_CURRENT) );
printf("PAPI_VERSION_INCREMENT()=%ld\n", PAPI_VERSION_INCREMENT(PAPI_VER_CURRENT) );

    /* Initialize the library */
    retval = PAPI_library_init(PAPI_VER_CURRENT);
    if (retval != PAPI_VER_CURRENT) {
        printf("PAPI_library_init: Failed!\n"); exit(1);
    } else {
        printf("PAPI_library_init: OK!\n");
    }

    /* Create an EventSet */
    retval = PAPI_create_eventset(&EventSet);
    if (retval != PAPI_OK) {
        printf("PAPI_create_eventset: Failed!\n");
    } else {
        printf("PAPI_create_eventset: OK!\n");
    }

    /* Find the first available native event */
    native = PAPI_NATIVE_MASK | 0;
    retval = PAPI_enum_event(&native, PAPI_ENUM_FIRST);
    if (retval != PAPI_OK) {
        printf("PAPI_enum_event: Failed!\n");
    } else {
        printf("PAPI_enum_event: OK!\n");
    }

    /* Add it to the eventset */
    retval = PAPI_add_event(EventSet, native);
    if (retval != PAPI_OK) {
        printf("PAPI_enum_event: Failed!\n");
    } else {
        printf("PAPI_enum_event: OK!\n");
    }

    /* Exit successfully */
    printf("Success!\n");
    exit(0);
}




int my_papi_add_events ( int *events, int num_events)
{
	HighLevelInfo *state = NULL;
	int i, retval;

	if ( num_events == 0 ) {
		return PAPI_OK;
	}
	#ifdef DEBUG_PRINT_PAPI_EXT
	fprintf(stderr,"\t <my_papi_add_events> num_events=%d\n", num_events);
	for (i=0; i<num_events; i++){
		fprintf(stderr, "  i:%d events[i]:%u\n", i,events[i]);
	}
	#endif

	if ( ( retval = _internal_check_state( &state ) ) != PAPI_OK ) {
		fprintf(stderr,"*** error. <my_papi_add_events> :: <_state>\n");
		return retval;
	}

	if (( retval = PAPI_add_events( state->EventSet, events, num_events )) != PAPI_OK ) {
		fprintf(stderr,"*** error. <my_papi_add_events> :: <PAPI_add_events> state->EventSet=%d, num_events=%d\n", state->EventSet, num_events);
		_internal_cleanup_hl_info( state );
		PAPI_cleanup_eventset( state->EventSet );
		return retval;
	}
	//	print_state_HighLevelInfo(state);

	return PAPI_OK;
}


int my_papi_bind_start ( long long *values, int num_events)
{
	HighLevelInfo *state = NULL;
	int retval;

	if ( num_events == 0 ) {
		return PAPI_OK;
	}
	#ifdef DEBUG_PRINT_PAPI_EXT
	fprintf(stderr,"\t <my_papi_bind_start> num_events=%d\n", num_events);
	#endif

	if ( ( retval = _internal_check_state( &state ) ) != PAPI_OK ) {
		fprintf(stderr,"*** error. <my_papi_bind_start> :: <_state>\n");
		return retval;
	}
	if ( ( retval = PAPI_start( state->EventSet ) ) != PAPI_OK ) {
		if ( retval == PAPI_EISRUN) {
		// Event set is already running.
		// This is usually the case for multi level measurement sections
		// As of current version, we ignore this, i.e. single level support
		}
		else {
			fprintf(stderr,"*** error. <my_papi_bind_start> :: <PAPI_start>\n");
			return retval;
		}
	}
	state->running = HL_START;

	return PAPI_OK;
}


int my_papi_bind_stop ( long long *values, int num_events)
{
	HighLevelInfo *state = NULL;
	int retval;

	if ( num_events == 0 ) {
		return PAPI_OK;
	}
	#ifdef DEBUG_PRINT_PAPI_EXT
	fprintf(stderr,"\t <my_papi_bind_stop> num_events=%d\n", num_events);
	#endif

	if ( ( retval = _internal_check_state( &state ) ) != PAPI_OK ) {
		fprintf(stderr,"*** error. <my_papi_bind_stop> :: <_state>\n");
		return retval;
	}
	if ( ( retval = PAPI_stop( state->EventSet, values ) ) != PAPI_OK ) {
		fprintf(stderr,"*** error. <my_papi_bind_stop> :: <PAPI_stop>\n");
		state->running = HL_STOP;
		return retval;
	}
	if ( ( retval = PAPI_start( state->EventSet ) ) != PAPI_OK ) {
		fprintf(stderr,"*** error. <my_papi_bind_stop> :: <PAPI_start>\n");
		state->running = HL_STOP;
		return retval;
	}
	return PAPI_OK;
}


int my_papi_bind_read ( long long *values, int num_events)
{
	HighLevelInfo *state = NULL;
	int retval;

	if ( num_events == 0 ) {
		return PAPI_OK;
	}
	#ifdef DEBUG_PRINT_PAPI_EXT
	fprintf(stderr,"\t <my_papi_bind_read> \n");
	#endif

	if ( ( retval = _internal_check_state( &state ) ) != PAPI_OK ) {
		fprintf(stderr,"*** error. <my_papi_bind_read> :: <_state> \n");
		return retval;
	}
	if ( ( retval = PAPI_read( state->EventSet, values ) ) != PAPI_OK ) {
		fprintf(stderr,"*** error. <my_papi_bind_read> :: <PAPI_read>\n");
		return retval;
	}
	return PAPI_OK;
}


void my_papi_name_to_code ( char* c_event, int* i_event)
{
	int retval;
	//	retval = PAPI_event_name_to_code( c_event, &i_event );

	retval = PAPI_event_name_to_code( c_event, i_event );
	if ( retval != PAPI_OK ) {
		fprintf(stderr,"*** error. <PAPI_event_name_to_code> c_event=[%s], retval=%d\n", c_event, retval);
		return;
	}
	#ifdef DEBUG_PRINT_PAPI_EXT
	fprintf(stderr,"\t <my_papi_name_to_code> c_event=[%s], i_event=%u\n",
		c_event, *i_event);
	#endif

	return;
}

