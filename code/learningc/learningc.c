#include <stdio.h>

int main(void) {
    printf("int = %zd\n", sizeof(int));
    printf("char = %zd\n", sizeof(char));
    printf("long = %zd\n", sizeof(long));
    printf("long long = %zd\n", sizeof(long long));
    printf("double = %zd\n", sizeof(double));
    printf("long double = %zd\n", sizeof(long double));
    return 0;
}
