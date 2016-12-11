#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv) {
    double data = 1.235;
    const double * dp = &data;
    // if we wrote something like "*dp = 2.386;" it would generate an error
    printf("%f\n", *dp);
    return 0;
}
