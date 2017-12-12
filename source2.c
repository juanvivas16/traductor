#include <stdlib.h>
#include <stdio.h>

int main()
{
  int a = 1;
  int b = 1;
  int c = 1;
  int N;

  scanf("%d", &N);
  printf("La serie con %d terminos es:", N);
  printf("%d, %d, %d", a, b, c);

  int i = 4;
  int termino;

  while(i <= N)
  {
    termino = a + b;
    termino += c;
    printf(", %d", termino);
    a = b;
    b = c;
    c = termino;
    i += 1;
  }

  printf(" ");
  return 0;

}
