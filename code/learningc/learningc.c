#define _GNU_SOURCE /* GNU extensions */
#include <stdio.h>
#include <stdlib.h>

int main() {
    size_t buf_sz = 0;
    char *buf = NULL;
    getline(&buf, &buf_sz, stdin);
    printf("%s\n", buf);
    free(buf);
}
