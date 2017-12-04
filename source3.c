#include "stdlib.h"
#include "stdio.h"

int main()
{
  int X;
  scanf("%d", &X);

  int i = 2;
  int j = 4;
  int contador = 0;
  int mod;

  do {
    mod = X % i;

    if (mod == 0)
      contador += 1;

    i += 1;
    j = i * i;

  } while(j <= X);

  if (contador == 0)
  {
    if ( X == 1)
      printf("%d No es primo1\n", X);
    else
      printf("%d Es primo\n", X);
  }
  else
    printf("%d No es primo\n", X);

  return 0;
}
