#include <stdio.h>
#include <stdlib.h>

int main()
{
	// Declaracion de las variables
	int N;
	// Operaciones
	scanf ("%d",&N);

	int i = 1;
	int j;

	while(i <= N)
	{
		j = 1;

		while(j <= i)
		{
			printf("%d", i);
 			j++;
		}
			printf(" ");
			i++;
		}

	return 0;
}
