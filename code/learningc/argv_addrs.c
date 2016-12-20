#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv) {
    printf("Symbol\t\tAddress\t\tValue\n");
    for(int i = argc-1; i >= 0; i--) {

	for(int j = strlen(argv[i]) - 1; j >= 0; j--) {
	    printf("argv[%d][%d]\t%p\t%c\n", i, j, &argv[i][j], argv[i][j]);
	}
    }

    for(int i = argc-1; i >= 0; i--) {
	printf("argv[%d]\t\t%p\t%s\n", i, &argv[i], argv[i]);
    }
    printf("argv\t\t%p\t%p\n", &argv, argv);
    printf("argc\t\t%p\t%d\n", &argc, argc);
    
    return EXIT_SUCCESS;
}
