#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int areDistinct(int * arr, int len);

int main(int argc, char **argv) {
    if (argc != 2) {
	return EXIT_FAILURE;
    }

    FILE* fptr = fopen(argv[1], "r");

    if (fptr == NULL) {
	return EXIT_FAILURE;
    }

    int length = 0;
    int value;

    while (fscanf(fptr, "%d", &value) == 1) {
	length++;
    }

    fseek(fptr, 0, SEEK_SET);

    int * arr = (int *) malloc(length * sizeof(int));

    length = 0;

    while (fscanf(fptr, "%d", &(arr[length])) == 1) {
	length++;
    }

    fclose(fptr);

    if (length == 0) {
	return EXIT_SUCCESS;
    }
    
    int dist = areDistinct(arr, length);

    printf("%s\n", dist ? "Elements are distinct" : "Elements are not distinct");

    return EXIT_SUCCESS;
}
