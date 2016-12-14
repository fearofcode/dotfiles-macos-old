#include <stdio.h>

int main(int argc, char **argv) {
#define SQR(X) ((X) * (X)) /* we are smart and efficient programmers! no function call! */
    int k = 42;
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wunsequenced"
    printf("%d\n", SQR(++k));
    #pragma clang diagnostic pop
    return 0;
}
