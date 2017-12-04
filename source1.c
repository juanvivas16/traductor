/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- Primer Ejercicio del Proyecto
-- Alumnos: Juan Vivas
--			Julián Briceño
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{

	// Declaracion de las variables
	int n = 0;
	int i = 1;
	int j = 1;

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
