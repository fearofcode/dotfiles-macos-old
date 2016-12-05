#include <stdio.h>

void swap(int* x, int* y) {
    int temp = *x;
    *x = *y;
    *y = temp;
}

void to_base_n(unsigned int k, unsigned int base) {
    if (k >= base) {
	to_base_n(k/base, base);
    }

    printf("%d", k % base);
}

void iter_fib(unsigned int k) {
    unsigned int a = 0;
    unsigned int b = 1;
    unsigned int c = a + b;
    
    for(int i = 1; i <= k; i++) {
	printf("%d\n", c);
	c = a + b;
	a = b;
	b = c;
    }
}

int main() {
    int x = 5, y = 10;
    printf("before swap, x = %d, y = %d\n", x, y);
    swap(&x, &y);
    printf("after swap, x = %d, y = %d\n", x, y); 
    to_base_n(5, 2);
    printf("\n");
    to_base_n(129, 8);
    printf("\n");

    iter_fib(20);
    return 0;
}
