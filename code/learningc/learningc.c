#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv) {
    if (argc != 2) {
	fprintf(stderr, "Provide a parameter for # of words");
	exit(EXIT_FAILURE);
    }

    int word_cnt = atoi(argv[1]);
    
    char * words[word_cnt];

    for(int i = 0; i < word_cnt; i++) {
	size_t len = 0;
	getline(&words[i], &len, stdin);
    }

    for(int i = 0; i < word_cnt; i++) {
	printf("%s", words[i]);
	free(words[i]);
    }
    
    return 0;
}
