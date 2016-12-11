#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv) {
    const char * filename = "numbers.data";
    const size_t sz = 10000;
    double buf[sz];
    
    FILE *fp;

    if ((fp = fopen(filename, "wb")) == NULL) {
	fprintf(stderr, "Couldn't open file %s\n", filename);
	exit(EXIT_FAILURE);
    }

    for(int i = 0; i < sz; i++) {
	buf[i] = 1.0/(i+1);
    }

    fwrite(buf, sizeof(double), sz, fp);

    fclose(fp);

    if ((fp = fopen(filename, "rb")) == NULL) {
	fprintf(stderr, "Couldn't read file %s\n", filename);
	exit(EXIT_FAILURE);
    }
    
    for(int i = 0; i < sz; i += 100) {
	const long pos = (long) i * sizeof(double);
	fseek(fp, pos, SEEK_SET);
	double value;
	fread(&value, sizeof (double), 1, fp);
	if (value != buf[i]) {
	    printf("Value at %d (%d) = %f vs. %f\n", i, pos, value, buf[i]);
	}
    }

    fclose(fp);
    
    return 0;
}
