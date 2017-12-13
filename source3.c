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

  while(j <= X)
  {
    mod = X % i;

    if (mod == 0)
    {
      contador += 1;
    }
    i += 1;
    j = i * i;
  }

  if (contador == 0)
  {
    if ( X == 1)
    {
      printf("%d No es primo1", X);
    }
    if( X != 1)
    {
      printf("%d Es primo", X);
    }
  }
  if (contador != 0)
  {
    printf("%d No es primo", X);
  }

  return 0;
}
