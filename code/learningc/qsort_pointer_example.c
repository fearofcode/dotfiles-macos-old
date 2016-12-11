#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LEN 3

static int qsort_strcmp(const void *p1, const void *p2) {
    /* TODO WHAT THE FUCK IS THIS POINTER SHIT WHAT THE FUCK JESUS CHRIST */
    return strcmp(* (char * const *) p1, * (char * const *) p2);
}

int main() {
    const char* strings[] = {
	"here is a string",
	"and here is another",
	"i (lowercase) would like these sorted, please."
    };

    for(int i = 0; i < LEN; i++) {
	printf("%s\n", strings[i]);
    }

    qsort(strings, LEN, sizeof(char *), qsort_strcmp);

    printf("Sorted, the strings are:\n");
    
    for(int i = 0; i < LEN; i++) {
	printf("%s\n", strings[i]);
    }
    return 0;
}
