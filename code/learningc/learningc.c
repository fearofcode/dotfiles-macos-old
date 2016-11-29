#include <stdio.h>
#include <limits.h>
#include <float.h>

int main(void) {
    printf("int = %zd\n", sizeof(int));
    printf("char = %zd\n", sizeof(char));
    printf("long = %zd\n", sizeof(long));
    printf("long long = %zd\n", sizeof(long long));
    printf("double = %zd\n", sizeof(double));
    printf("long double = %zd\n", sizeof(long double));
    printf("FLT_MANT_DIG = %d\n", FLT_MANT_DIG);
    printf("FLT_DIG = %d\n", FLT_DIG);
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdouble-promotion"
    printf("FLT_EPSILON = %e\n", FLT_EPSILON);
    #pragma clang diagnostic pop
    return 0;
}
