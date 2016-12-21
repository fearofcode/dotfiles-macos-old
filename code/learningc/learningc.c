#include <stdio.h>
#include <stdlib.h>

int main(void) {
    const int rows = 8;
    const int columns = 3;

    int **data = (int **) malloc(rows * sizeof(int *));
    
    for(int i = 0; i < rows; i++) {
	data[i] = (int *) malloc(columns * sizeof(int));
	
	for(int j = 0; j < columns; j++) {
	    data[i][j] = i + j;
	    printf("data[%d][%d] = %d, &data[%d][%d] = %p\n", i, j, data[i][j], i, j, (void*)&data[i][j]);
	}

	free(data[i]);
    }

    free(data);
    return EXIT_SUCCESS;
}
