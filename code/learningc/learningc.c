#include <stdio.h>
#include <math.h>

void enumerate_values(double *arguments,
		      size_t argument_len,
		      size_t function_len,
		      double (*functions[function_len])(double),
		      const char   *function_names[function_len]) {
    for(int arg_idx = 0; arg_idx < argument_len; arg_idx++) {
	double arg = arguments[arg_idx];

	for(int fun_idx = 0; fun_idx < function_len; fun_idx++) {
	    const char *function_name = function_names[fun_idx];
	    double (*function)(double) = functions[fun_idx];
	    printf("%s(%f) = %f\n", function_name, arg, function(arg));
	}

	printf("\n");
    }
}

int main(int argc, char **argv) {
    double data[6] = {0.0, M_PI/4, 1.0, M_PI/2, M_PI, -1.0};
    double (*functions[3])(double) = {sin, cos, tan};
    const char *function_names[3] = {"sin", "cos", "tan"};

    enumerate_values(data, 6, 3, functions, function_names); 
    return 0;
}
