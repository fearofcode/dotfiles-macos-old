#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

double * new_arr(int n, ...) {
    va_list ap;
    va_start(ap, n);
    
    double *data = (double *) malloc(sizeof(double) * n);

    for(int i = 0; i < n; i++) {
	data[i] = va_arg(ap, double);
    }

    va_end(ap);
    
    return data;
}

int main(int argc, char **argv) {
    double * data = new_arr(5, 1.2, 3.4, 5.6, 6.8, -3.0);

    for(int i = 0; i < 5; i++) {
	printf("%d = %f\n", i, data[i]);
    }
    
    return 0;
}
