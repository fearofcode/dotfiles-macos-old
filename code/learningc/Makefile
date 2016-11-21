CC=clang
all: learningc

learningc: learningc.c
	$(CC) -g -Wall -pedantic -o learningc learningc.c

clean:
	rm learningc

test:
	make clean && scan-build make
