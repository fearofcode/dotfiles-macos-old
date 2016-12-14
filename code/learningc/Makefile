CC=gcc
CFLAGS = -g -Wall -Werror -pedantic -std=gnu11 -lc -lm 
MAKE = make
TARGET = learningc

default: all
all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) -o $(TARGET) $(TARGET).c $(CFLAGS)

release: $(TARGET).c
	$(CC) $(RELEASE_FLAGS) -o $(TARGET).release $(TARGET).c

assembler: $(TARGET).c
	$(CC) $(ASSEMBLER_CFLAGS) $(TARGET).c 
clean:
	rm $(TARGET) 

test:
	$(SCAN_BUILD) $(MAKE)
