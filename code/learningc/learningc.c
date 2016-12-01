#include <stdio.h>
#include <float.h>
#include <math.h>
#include <stdlib.h>

int main(int argc, char** argv) {
    /* calculate 1 + 1/2 + 1/4 + 1/8 + ... */
    double sum = 0.0;
    unsigned long term_cnt = 0;
    double denominator = 1.0;
    double exponent;
    
    if (argc == 1) {
	fprintf(stderr, "Supply an argument\n");
	return 1;
    }

    exponent = strtod(argv[1], NULL);
    printf("Using exponent %f\n", exponent);

    while (fabs(1.0/denominator) > DBL_EPSILON) {
	double term = 1.0 / denominator;
	denominator *= exponent;
	sum += term;
	term_cnt++;
	//printf("i = %lu: %f\n", term_cnt, sum);
    }
    printf("%f (%lu terms to converge)\n", sum, term_cnt);
    return 0;
}
