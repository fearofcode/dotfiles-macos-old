#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LEN 3

static int qsort_strcmp(const void *p1, const void *p2) {
    /**
     * Terse version of this function:
     *
     *     return strcmp(* (const char **) p1, * (const char **) p2);
     * 
     * Here's what's going on. Each array element is a `const char
     * *`. p1 and p2 are pointers to those const char *'s.  So we'll
     * want to cast p1 and p2 as const char **.
     * 
     * It's possible to add more consts to make an expression like
     * `const char * const *`, but that's not strictly necessary.
     * 
     * After that, we have a well-casted pointer-pointer that we can
     * simply dereference to get our actual strings -- dereferencing
     * the char ** gives a char *, i.e., a string. That gives us a
     * const char * we can pass to strcmp().
     * 
     * A less concise, hopefully more clear version appears below.
     */

    const char * * str_ptr1 = (const char * *) p1;
    const char * * str_ptr2 = (const char * *) p2;

    const char * str1 = *str_ptr1;
    const char * str2 = *str_ptr2;
    
    return strcmp(str1, str2);
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
    return EXIT_SUCCESS;
}
