# originally stolen from https://sites.google.com/site/michaelsafyan/software-engineering/how-to-write-a-makefile

CC := gcc
TARGET := learningc
DEBUG_TARGET = $(TARGET).debug
RELEASE_TARGET = $(TARGET).release
SRC_FILES := $(TARGET).c aredistinct.c # $(wildcard *.c) to get all files
OBJECT_FILES := ${SRC_FILES:.c=.o}
BASE_FLAGS = -Wall -Wextra -Wshadow -Werror -Wfatal-errors -pedantic -std=gnu11 -m64 \
	-Wno-missing-braces -Wextra -Wno-missing-field-initializers -Wformat=2 \
	-Wswitch-default -Wswitch-enum -Wcast-align -Wpointer-arith \
	-Wbad-function-cast -Wstrict-overflow=5 -Wstrict-prototypes -Winline \
	-Wundef -Wnested-externs -Wcast-qual -Wshadow -Wunreachable-code \
	-Wlogical-op -Wfloat-equal -Wstrict-aliasing=2 -Wredundant-decls \
	-Wold-style-definition # http://stackoverflow.com/a/1667114 

.PHONY: all clean distclean

all: debug release

debug: CFLAGS += -g $(BASE_FLAGS)
debug: $(OBJECT_FILES)
	$(CC) $(CFLAGS) $(OBJECT_FILES) -o $(DEBUG_TARGET)

release: CFLAGS += -O3 $(BASE_FLAGS)
release: $(OBJECT_FILES)
	$(CC) $(CFLAGS) $(OBJECT_FILES) -o $(RELEASE_TARGET)

clean:
	$(RM) $(TARGET)
	$(RM) $(OBJECT_FILES)
	$(RM) output*

distclean: clean

test0: $(DEBUG_TARGET)
	$(RM) output* expected0 input0
	touch input0
	touch expected0
	./$(DEBUG_TARGET) input0 > output0
	diff expected0 output0

test1: $(DEBUG_TARGET)
	./$(DEBUG_TARGET) input1 > output1
	diff expected1 output1

test2: $(DEBUG_TARGET)
	./$(DEBUG_TARGET) input2 > output2
	diff expected2 output2

test: test0 test1 test2
