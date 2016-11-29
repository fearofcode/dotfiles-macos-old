CC=clang
CFLAGS = -g -Weverything -Werror -pedantic -std=c11
ASSEMBLER_CFLAGS = -S -O3
MAKE = make
# OS X's clang doesn't come with scan-build because ????, so:
# $ brew install llvm
# $ ln -s /usr/local/Cellar/llvm/3.9.0/bin/scan-build /usr/local/bin/scan-build
SCAN_BUILD = scan-build
TARGET = learningc

default: all
all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c 

assembler: $(TARGET).c
	$(CC) $(ASSEMBLER_CFLAGS) $(TARGET).c 
clean:
	rm $(TARGET) 

test:
	$(MAKE) clean && $(SCAN_BUILD) $(MAKE)
