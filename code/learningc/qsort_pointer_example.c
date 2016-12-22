#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LEN 3

static int qsort_strcmp(const void * restrict p1, const void * restrict p2) {
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
     * `const char * const *`, but that's not strictly necessary --
     * that seems almost intentionally designed to confuse people not
     * familiar with C's right-to-left declaration rules.
     * 
     * After that, we have a well-casted pointer-pointer that we can
     * simply dereference to get our actual strings -- dereferencing
     * the const char ** gives a char *, i.e., a string. We can then
     * pass that string to strcmp() as usual now that we've finally
     * bridged the gap from void * -> const char ** -> const char *
     * via casting and dereferencing.
     * 
     * With the hard part over, to make a functioning qsort comparison
     * function that returns -1, 0, or 1 as required, we can just use
     * strcmp()'s return value as is.
     * 
     * A less concise but hopefully more clear implementation appears
     * below.
     */

    const char * * restrict str_ptr1 = (const char * * restrict) p1;
    const char * *  restrict str_ptr2 = (const char * * restrict) p2;

    const char * restrict str1 = *str_ptr1;
    const char * restrict str2 = *str_ptr2;
    
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
