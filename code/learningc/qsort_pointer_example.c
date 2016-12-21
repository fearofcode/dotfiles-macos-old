#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LEN 3

static int qsort_strcmp(const void *p1, const void *p2) {
    /**
     * Terse version of this function:
     *
     *     return strcmp(* (const char * const *) p1, * (const char * const *) p2);
     * 
     * Here's what's going on. Each array element is a `const char
     * *`. p1 and p2 are pointers to those const char *'s.  So we'll
     * want to cast p1 and p2 as char **. But p1 and p2 are const
     * pointers, so the type we'll want to cast to will be a const
     * pointer pointer: `const char * const *`. The two consts reflect
     * that both the pointer and the string are const.
     * 
     * After that, we have a well-casted expression that we can simply
     * dereference to get our actual strings. Putting it all together,
     * we get:
     *
     *    * (char * const *) p1
     * 
     * A less concise, hopefully more clear version appears below.
     */

    const char * const * str_ptr1 = (const char * const *) p1;
    const char * const * str_ptr2 = (const char * const *) p2;

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
