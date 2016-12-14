#include <stdio.h>
#include <math.h>

struct func {
    double (*fp)(double);
    const char * name;
};

void enumerate_values(double *arguments,
		      size_t argument_len,
		      size_t function_len,
		      struct func functions[function_len]) {
    for(int arg_idx = 0; arg_idx < argument_len; arg_idx++) {
	double arg = arguments[arg_idx];

	for(int fun_idx = 0; fun_idx < function_len; fun_idx++) {
	    const char *function_name = functions[fun_idx].name;
	    double (*function)(double) = functions[fun_idx].fp;
	    printf("%s(%f) = %f\n", function_name, arg, function(arg));
	}

	printf("\n");
    }
}

int main(int argc, char **argv) {
    double data[6] = {0.0, M_PI/4, 1.0, M_PI/2, M_PI, -1.0};
    struct func functions[3] = {
	{.fp = sin, .name = "sin"},
	{.fp = cos, .name = "cos"},
	{.fp = tan, .name = "tan"}
    };
    
    enumerate_values(data, 6, 3, functions);

    return 0;
}
