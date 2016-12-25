#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void * worker(void * arg) {
    printf("hello from worker thread %d\n", *(int *) arg);
    return NULL;
}

int main(void) {
    const int worker_count = 8;
    pthread_t thread[worker_count];
    int args[worker_count];
    
    for(int i = 0; i < worker_count; i++) {
	args[i] = i;
	printf("calling pthread_create with argument %d\n", args[i]);
	int rtv = pthread_create(&thread[i], NULL, worker, (void*) &args[i]);

	if (rtv != 0) {
	    fprintf(stderr, "pthread_create() erroneously returned %d\n", rtv);
	    return EXIT_FAILURE;
	}
    }

    for(int i = 0; i < worker_count; i++) {
	int rtv = pthread_join(thread[i], NULL);

	if (rtv != 0) {
	    fprintf(stderr, "pthread_join() erroneously returned %d\n", rtv);
	    return EXIT_FAILURE;
	}
    }
    
    
    return EXIT_SUCCESS;
}
