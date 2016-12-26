# originally stolen from https://sites.google.com/site/michaelsafyan/software-engineering/how-to-write-a-makefile

CC := gcc
TARGET := learningc
DEBUG_TARGET = $(TARGET).debug
RELEASE_TARGET = $(TARGET).release
SRC_FILES := $(TARGET).c # $(wildcard *.c) to get all files
OBJECT_FILES := ${SRC_FILES:.c=.o}

BASE_FLAGS = -Wall -Wextra -Wshadow -Werror -Wfatal-errors -pedantic -std=gnu11 -m64 \
	-Wno-missing-braces -Wextra -Wno-missing-field-initializers -Wformat=2 \
	-Wswitch-default -Wswitch-enum -Wcast-align -Wpointer-arith \
	-Wbad-function-cast -Wstrict-overflow=5 -Wstrict-prototypes -Winline \
	-Wundef -Wnested-externs -Wcast-qual -Wshadow -Wunreachable-code \
	-Wlogical-op -Wfloat-equal -Wstrict-aliasing=2 -Wredundant-decls \
	-Wold-style-definition # http://stackoverflow.com/a/1667114 
GCOV_CFLAGS = -fprofile-arcs -ftest-coverage # add to DEBUG_FLAGS below to measure code coverage with gcov
DEBUG_FLAGS = -g
RELEASE_FLAGS = -O3
GCOV_LFLAGS = -lgcov --coverage # add to LFLAGS below to measure code coverage with gcov
LFLAGS += -lpthread

VALGRIND = valgrind --tool=memcheck --verbose --log-file

.PHONY: all clean distclean

all: debug

debug: CFLAGS += $(DEBUG_FLAGS) $(BASE_FLAGS)
debug: $(OBJECT_FILES)
	$(CC) $(CFLAGS) $(OBJECT_FILES) -o $(DEBUG_TARGET) $(LFLAGS)

release: CFLAGS += $(RELEASE_FLAGS) $(BASE_FLAGS)
release: $(OBJECT_FILES)
	$(CC) $(CFLAGS) $(OBJECT_FILES) -o $(RELEASE_TARGET) $(LFLAGS)

clean:
	$(RM) $(TARGET)
	$(RM) *.o
	$(RM) output* log*
	$(RM) *.gcov *.gcno

distclean: clean
