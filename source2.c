#include <stdlib.h>
#include <stdio.h>

int main()
{
  int a = 1;
  int b = 1;
  int c = 1;
  int N;

  scanf("%d", &N);
  printf("La serie con %d terminos es: \n", N);
  printf("%d, %d, %d", a, b, c);

  int i = 4;
  int termino;

  do {
    termino = a + b + c;
    printf(", %d", termino);
    a = b;
    b = c;
    c = termino;
    i += 1;

  } while(i <= N);

  printf("\n");
  return 0;

}
