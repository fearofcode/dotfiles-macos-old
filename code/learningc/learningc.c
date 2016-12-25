#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int age;
    char *name;
} person;

int compare_by_age(const void *p1, const void *p2) {
    return ((const person *) p1)->age - ((const person *) p2)->age;
}

int main(void) {
    person* people = malloc(sizeof(person)*2);

    people[0].age = 48;
    people[0].name = strdup("test");

    people[1].age = 42;
    people[1].name = strdup("blah");

    printf("%d, %s\n", people[0].age, people[0].name);
    printf("%d, %s\n", people[1].age, people[1].name);

    qsort(people, 2, sizeof(person), compare_by_age);
    printf("%d, %s\n", people[0].age, people[0].name);
    printf("%d, %s\n", people[1].age, people[1].name);

    free(people[1].name);
    free(people[0].name);
    free(people);
    return EXIT_SUCCESS;
}
