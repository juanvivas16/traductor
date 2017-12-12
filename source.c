#include <asdf>
#include <fdssdfg>

int main()
{

  int a = 645.4;
  a = 2;
  float z;
  char y = '7';
  int b = 2;
  b= a;
  a = 3;
  a = b+a;
  a = b+6;

  a = 9+b;
  a = b-a;

  a = 9-b;
  a = b*a;
  a = b*6;
  a = 9*b;
  a = b/a;
  a = b/6;
  a = 9/b;


  a += b;
  a += 2;
  a -= b;
  a -= 3;
  a *= b;
  a *= 4;

  a++;
  ++a;

  a--;
  --a;


  a = a%b;
  a = a%3;
  a = 3%a;
  a = 4%3;

scanf("%c", &y);

printf("hola mundo");

printf("hola %d mundo", a);

printf("%d hola mundo", a);

printf("hola %d", a);

printf("%d", a);

printf("%c hola mundo %f", y, z);

printf("%c hola %f mundo: %d", y, z, a);


  if(a >= b)
     a++;

  while( a < b)
    b--;




  return 0;
}
