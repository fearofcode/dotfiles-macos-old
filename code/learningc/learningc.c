#include <stdio.h>

int main(int argc, char **argv) {
    const int BYTE_MASK = 0xff;
    const unsigned int color = 0x2a162f;
    const unsigned int green = (color >> 8) & BYTE_MASK;
    const unsigned int red = (color >> 16) & BYTE_MASK;
    printf("green = %#x, red = %#x\n", green, red);
    return 0;
}
