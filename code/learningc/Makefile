CC=clang
CFLAGS = -g -Wall -pedantic
MAKE = make
SCAN_BUILD = scan-build
TARGET = learningc

default: all
all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c 

clean:
	rm $(TARGET) 

test:
	$(MAKE) clean && $(SCAN_BUILD) make
