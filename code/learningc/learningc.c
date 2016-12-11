#include <stdio.h>

struct book {
    const char * title;
};

struct book make_a_book(const char *title) {
    /* this uses designated initializers and compound literals, both C99 features */
    return (struct book) {.title = title};
}

int main(int argc, char **argv) {
    struct book b = make_a_book("TAOCP");
    printf("%s\n", b.title);
    return 0;
}
