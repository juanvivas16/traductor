#include <stdio.h>
#include <stdlib.h>

int main()
{
	// Declaracion de las variables
	int n;
	int i = 1;
	int j;

	// Operaciones
	scanf ("%d",&n);

		do{
			j = 1;
			do{
				printf("%d", i);
 				j++;
			}
			while(j <= i);
			i++;
			printf("\n");
		}
		while(i <= n);

	return 0;
}
