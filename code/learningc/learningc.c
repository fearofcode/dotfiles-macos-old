#include <stdio.h>
#include <ctype.h>

int main() {
    unsigned int space_cnt = 0;
    unsigned int newline_cnt = 0;
    unsigned int other_ch_cnt = 0;
    char ch;

    while ((ch = getchar()) != '#') {
	if (isspace(ch)) {
	    space_cnt++;
	}

	if (ch == '\n') {
	    newline_cnt++;
	}

	if (!isspace(ch) && ch != '\n') {
	    other_ch_cnt++;
	}

    }

    printf("Spaces: %d\n", space_cnt);
    printf("Newlines: %d\n", newline_cnt);
    printf("Other characters: %d\n", other_ch_cnt);
    return 0;
}
