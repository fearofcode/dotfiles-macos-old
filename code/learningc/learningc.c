#include <stdio.h>

void array_func(int* data)
{
    for(int i = 0; i < 5; i++) {
	printf("%d\n", data[i]);
    }
}

int two_dimensional_sum(int ar[][4]) {
    int sum = 0;

    for(int i = 0; i < 4; i++) {
	for(int j = 0; j < 4; j++) {
	    sum += ar[i][j];
	}
    }

    return sum;
}

int main() {
    int data[5] = {12, 5, 4, -1, 3};
    double more_data[5] = {3.8, 2.6, -1.0, 0.222, 0.00001};

    for(int i = 0; i < 5; i++) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wformat-pedantic"
	printf("%d: %p (%d), %p (%f)\n", i, data + i, *(data + i), more_data + i, *(more_data + i));
#pragma clang diagnostic pop
    }
    array_func(data);

    int two_dimensional_array[4][4] = { {1, 2, 3, 4}, {5, 6, 1, 0}, {9, 12, 16, 20}, {0, -1, 0, 1} };

    printf("%d\n", two_dimensional_sum(two_dimensional_array));

    int *literal = (int []) { 5, 8, 6, 12};

    for(int i = 0; i < 4; i++) {
	printf("%d\n", literal[i]);
    }
    
    return 0;
}
