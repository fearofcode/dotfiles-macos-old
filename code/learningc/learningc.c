#include <stdio.h>
#include <stdbool.h>

int main(void) {
  /* wtf why is Emacs only indenting 2 spaces? idk it's late */
  int x, y;
  scanf("%d %d", &x, &y);
  printf("%d\n", x & y);
  printf("%p %p\n", (void *) &x, (void *) &y);
  return 0;
}
