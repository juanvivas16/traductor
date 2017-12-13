%{
	#include <iostream>
	#include <cstdio>
	#include <list>
	#include <cctype>
	#include <cstring>
  #include <string>
	#include <cstdlib>
	#include <typeinfo>
	#include <tuple>
	#include <vector>

	using namespace std;

	typedef tuple<char *, char *> tupla;

	FILE *yysalida;
	vector<vector<tupla>> tabla_sim;
	int cantErrores = 0;
	extern int lineas;
	extern int yyparse();
	extern int yylex();
	extern FILE *yyin;
	extern list<char *> reservada_tipo;
	extern list<char *> reservada;
	void yyerror(const char *);

	void agregar_ambito();
	void eliminar_ambito();
	bool esta_tabla_sim(char *);
	tupla obtener_tupla_por_id(char *);
	void imprimir_tabla_sim();
	bool insertar_tabla_sim(tupla const & );
	void liberar_tabla_sim();
	void obtener_ambito();

	extern void cargar_reservada_tipo();
	extern void eliminar_reservada_tipo();
	extern bool esta_reservada_tipo(char *);
	extern void imprimir_reservada_tipo();

	extern void cargar_reservada();
	extern bool esta_reservada(char *);
	extern int posicion_reservada(char *);
	extern void imprimir_reservada();
	extern void eliminar_reservada();

%}

%union
{
	char *strval;
	int	ival;
}

%type<strval> suma resta multi div asignacion declaracion condicional retornar
%type<strval> print scan estructura principal cuerpo cabecera codigo programa

%token<strval> TIPO ID RESERVADA PRCVAL TEXTO
%token<ival>	NUM

%token PUNTO PTOCOMA LLAVEABR LLAVECERR PARENTESISABR PARENTESISCERR DOSPTOS
%token MENOR MAYOR EXCL IGUAL SUMA MENOS MULTI DIV POTEN NUMERAL AMPERSAND MENOR_I MAYOR_I DIST
%token SUM_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN
%token IGUALD OR AND INC DEC PORCENTAJE COMA COMISIMPLE COMILLAS

%right IGUAL
%left SUMA MENOS
%left MULTI
%left POTEN
%left COMILLAS
%left PARENTESISABR

%start programa

%%

programa:
	codigo
	{
		if(cantErrores > 0)
			cout<<endl<<endl<<"***ERROR: tipo - Semantico***"<<endl;
		else
		{
			FILE *yysalida;
			yysalida = fopen("salida.sh", "w");
			fputs("#!/bin/bash\n", yysalida);
			fputs($1, yysalida);
			fclose(yysalida);
			free($1);
			cout<<endl<<endl<<"Exito!"<<endl;
		}
	};

codigo:
	cabecera principal
	{
		$$ = (char *)malloc(strlen($2)+1);
		strcpy($$,$2);
		free($2);
	}
	| principal
	{
		$$ = (char *)malloc(strlen($1)+1);
		strcpy($$,$1);
		free($1);
};

cabecera:
	cabecera NUMERAL RESERVADA MENOR ID MAYOR
	{
		if(strcmp($3, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen(" ")+1);
		strcpy($$," ");
	}
	|
	NUMERAL RESERVADA MENOR ID MAYOR
	{
		if(strcmp($2, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen(" ")+1);
		strcpy($$," ");
	}
	|
	cabecera NUMERAL RESERVADA COMILLAS TEXTO COMILLAS
	{
		if(strcmp($3, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen(" ")+1);
		strcpy($$," ");
	}
	|
	NUMERAL RESERVADA COMILLAS TEXTO COMILLAS
	{
		if(strcmp($2, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen(" ")+1);
		strcpy($$," ");
	}
	|
	cabecera NUMERAL RESERVADA MENOR ID PUNTO ID MAYOR
	{
		if(strcmp($3, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen(" ")+1);
		strcpy($$," ");
	}
	|
	NUMERAL RESERVADA MENOR ID PUNTO ID MAYOR
	{
		if(strcmp($2, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen(" ")+1);
		strcpy($$," ");
	};

principal:
	TIPO RESERVADA PARENTESISABR PARENTESISCERR LLAVEABR cuerpo LLAVECERR
	{
		if(strcmp($2, "main"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<". Quizo decir 'main'"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen($6)+1);
		strcpy($$,$6);
		free($6);
	};

cuerpo:
	asignacion cuerpo
	{
		$$ = (char *)malloc(strlen($1)+strlen($2) + 1);
		strcpy($$,$1);
		strcat($$,$2);
		free($1);
		free($2);

	}
	|	asignacion
	{
		$$ = (char *)malloc(strlen($1) + 1);
		strcpy($$,$1);
		free($1);
	}
	| declaracion cuerpo
	{
		$$ = (char *)malloc(strlen($1)+strlen($2) + 1);
		strcpy($$,$1);
		strcat($$,$2);
		free($1);
		free($2);
	}
	| declaracion
	{
		$$ = (char *)malloc(strlen($1) + 1);
		strcpy($$,$1);
		free($1);
	}
	| retornar cuerpo
	{
		$$ = (char *)malloc(strlen($1)+strlen($2) + 1);
		strcpy($$,$1);
		strcat($$,$2);
		free($1);
		free($2);
	}
	| retornar
	{
		$$ = (char *)malloc(strlen($1) + 1);
		strcpy($$,$1);
		free($1);
	}
	| scan cuerpo
	{
		$$ = (char *)malloc(strlen($1)+strlen($2) + 1);
		strcpy($$,$1);
		strcat($$,$2);
		free($1);
		free($2);
	}
	| scan
	{
		$$ = (char *)malloc(strlen($1) + 1);
		strcpy($$,$1);
		free($1);
	}
	| print cuerpo
	{
		$$ = (char *)malloc(strlen($1)+strlen($2) + 1);
		strcpy($$,$1);
		strcat($$,$2);
		free($1);
		free($2);
	}
	| print
	{
		$$ = (char *)malloc(strlen($1) + 1);
		strcpy($$,$1);
		free($1);
	}
	| estructura cuerpo
	{
		char * copy = strdup($1);
		char * pch = strtok (copy," ");

		if (pch != NULL)
		{
			if(!strcmp(pch, "while"))
			{
				$$ = (char *)malloc(strlen($1)+strlen($2)+strlen("\ndone\n")+ 1);
				strcpy($$,$1);
				strcat($$,$2);
				strcat($$,"\ndone\n");
				free($1);
				free($2);
			}

			if(!strcmp(pch, "if"))
			{
				$$ = (char *)malloc(strlen($1)+strlen($2)+strlen("\nfi\n")+ 1);
				strcpy($$,$1);
				strcat($$,$2);
				strcat($$,"\nfi\n");
				free($1);
				free($2);
			}
		}
		else
		{
			$$ = (char *)malloc(strlen(" ")+1);
			strcpy($$," ");
		}
	}
	| estructura
	{
		char * copy = strdup($1);
		char * pch = strtok (copy," ");
		if (pch != NULL)
		{
			if(!strcmp(pch, "while"))
			{
				$$ = (char *)malloc(strlen($1)+strlen("\ndone\n")+ 1);
				strcpy($$,$1);
				strcat($$,"\ndone\n");
				free($1);
			}

			if(!strcmp(pch, "if"))
			{
				$$ = (char *)malloc(strlen($1)+strlen("\nfi\n")+ 1);
				strcpy($$,$1);
				strcat($$,"\nfi\n");
				free($1);
			}
		}
		else
		{
			$$ = (char *)malloc(strlen(" ")+1);
			strcpy($$," ");
		}
	}
	| estructura LLAVEABR cuerpo LLAVECERR cuerpo
	{
		char * copy = strdup($1);
		char * pch = strtok (copy," ");

		if (pch != NULL)
		{
			if(!strcmp(pch, "while"))
			{
				$$ = (char *)malloc(strlen($1)+strlen($3)+strlen($5)+strlen("\ndone\n")+ 1);
				strcpy($$,$1);
				strcat($$,$3);
				strcat($$,"\ndone\n");
				strcat($$,$5);
				free($1);
				free($3);
				free($5);
			}

			if(!strcmp(pch, "if"))
			{
				$$ = (char *)malloc(strlen($1)+strlen($3)+strlen($5)+strlen("\nfi\n")+ 1);
				strcpy($$,$1);
				strcat($$,$3);
				strcat($$,"\nfi\n");
				strcat($$,$5);
				free($1);
				free($3);
				free($5);
			}
		}
		else
		{
			$$ = (char *)malloc(strlen(" ")+1);
			strcpy($$," ");
		}
	}
	| estructura LLAVEABR cuerpo LLAVECERR
	{
		char * copy = strdup($1);
		char * pch = strtok (copy," ");

		if (pch != NULL)
		{
			if(!strcmp(pch, "while"))
			{
				$$ = (char *)malloc(strlen($1)+strlen($3)+strlen("\ndone\n")+ 1);
				strcpy($$,$1);
				strcat($$,$3);
				strcat($$,"\ndone\n");
				free($1);
				free($3);
			}

			if(!strcmp(pch, "if"))
			{
				$$ = (char *)malloc(strlen($1)+strlen($3)+strlen("\nfi\n")+ 1);
				strcpy($$,$1);
				strcat($$,$3);
				strcat($$,"\nfi\n");
				free($1);
				free($3);
			}
		}
		else
		{
			$$ = (char *)malloc(strlen(" ")+1);
			strcpy($$," ");
		}
	}

estructura:
	RESERVADA PARENTESISABR condicional PARENTESISCERR
	{
		if(strcmp($1, "while") && strcmp($1, "if"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(!strcmp($1, "while"))
		{
			$$ = (char *)malloc(strlen("while ")+strlen($3)+strlen("\ndo\n")+ 1);
			strcpy($$,"while ");
			strcat($$,$3);
			strcat($$,"\ndo\n");
			free($3);
		}

		else
			{
			if(!strcmp($1, "if"))
			{
				$$ = (char *)malloc(strlen("if ")+strlen($3)+strlen("\nthen\n")+ 1);
				strcpy($$,"if ");
				strcat($$,$3);
				strcat($$,"\nthen\n");
				free($3);
			}
			else
			{
				$$ = (char *)malloc(strlen(" ")+1);
				strcpy($$," ");
			}
	}
	};

scan:
	RESERVADA PARENTESISABR COMILLAS PRCVAL COMILLAS COMA  AMPERSAND ID PARENTESISCERR PTOCOMA
	{
		if(strcmp($1, "scanf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($8))
		{
			cout<<endl<<"*ERROR: variable ->"<<$8<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else
		{
			if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "int"))) { }

			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "char"))) { }

			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "float"))) { }

			else
			{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		$$ = (char *)malloc(strlen("read ")+strlen($8)+strlen("\n")+ 1);
		strcpy($$,"read ");
		strcat($$,$8);
		strcat($$,"\n");
		free($8);
	};

print:
	RESERVADA PARENTESISABR COMILLAS TEXTO COMILLAS PARENTESISCERR PTOCOMA
	{
		if(strcmp($1, "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen("echo ")+strlen($4)+strlen("\n")+ 1);
		strcpy($$,"echo ");
		strcat($$,$4);
		strcat($$,"\n");
		free($4);

	}
	|
	RESERVADA PARENTESISABR COMILLAS TEXTO PRCVAL TEXTO COMILLAS COMA ID PARENTESISCERR PTOCOMA
	{
		if(strcmp($1, "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($9))
		{
			cout<<endl<<"*ERROR: variable ->"<<$9<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else
		{
			if(!(strcmp($5,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "int"))) { }

			else if(!(strcmp($5,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "char"))) { }

			else if(!(strcmp($5,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "float"))) { }

			else
			{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		$$ = (char *)malloc(strlen("echo ")+strlen($4)+strlen("$")+strlen($9)+strlen($6)+strlen("\n")+ 1);
		strcpy($$,"echo ");
		strcat($$,$4);
		strcat($$,"$");
		strcat($$,$9);
		strcat($$,$6);
		strcat($$,"\n");
		free($4);
		free($5);
		free($9);
	}
	|
	RESERVADA PARENTESISABR COMILLAS PRCVAL TEXTO COMILLAS COMA ID PARENTESISCERR PTOCOMA
	{
		if(strcmp($1, "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($8))
		{
			cout<<endl<<"*ERROR: variable ->"<<$8<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else
		{
			if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "int"))) { }

			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "char"))) { }

			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "float"))) { }

			else
			{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO435 "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		$$ = (char *)malloc(strlen("echo $")+strlen($8)+strlen($5)+strlen("\n")+ 1);
		strcpy($$,"echo $");
		strcat($$,$8);
		strcat($$,$5);
		strcat($$,"\n");
		free($5);
		free($8);
	}
	|
	RESERVADA PARENTESISABR COMILLAS TEXTO PRCVAL COMILLAS COMA ID PARENTESISCERR PTOCOMA
	{
		if(strcmp($1, "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($8))
		{
			cout<<endl<<"*ERROR: variable ->"<<$8<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else
		{
			if(!(strcmp($5,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "int"))) { }

			else if(!(strcmp($5,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "char"))) { }

			else if(!(strcmp($5,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "float"))) { }

			else
			{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		$$ = (char *)malloc(strlen("echo ")+strlen($4)+strlen(" $")+strlen($8)+strlen("\n")+ 1);
		strcpy($$,"echo ");
		strcat($$,$4);
		strcat($$, " $");
		strcat($$,$8);
		strcat($$,"\n");
		free($4);
		free($8);
	}
	|
	RESERVADA PARENTESISABR COMILLAS PRCVAL COMILLAS COMA ID PARENTESISCERR PTOCOMA
	{
		if(strcmp($1, "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($7))
		{
			cout<<endl<<"*ERROR: variable ->"<<$7<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else
		{
			if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($7)), "int"))) { }

			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($7)), "char"))) { }

			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($7)), "float"))) { }

			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		$$ = (char *)malloc(strlen("echo $")+strlen($7)+strlen("\n")+ 1);
		strcpy($$,"echo $");
		strcat($$,$7);
		strcat($$,"\n");
		free($7);
	}
	|
	RESERVADA PARENTESISABR COMILLAS PRCVAL TEXTO PRCVAL COMILLAS COMA ID COMA ID PARENTESISCERR PTOCOMA
	{
		if(strcmp($1, "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($9))
		{
			cout<<endl<<"*ERROR: variable ->"<<$9<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($11))
		{
			cout<<endl<<"*ERROR: variable ->"<<$11<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else
		{
			if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "int")) && !(strcmp($6,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "int")) ) { }

			else if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "int")) && !(strcmp($6,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "char"))) { }

			else if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "int")) && !(strcmp($6,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "float"))) { }

			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "char")) && !(strcmp($6,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "int"))) { }

			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "char")) && !(strcmp($6,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "char"))) { }

			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "char")) && !(strcmp($6,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "float"))) { }

			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "float")) && !(strcmp($6,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "int"))) { }

			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "float")) && !(strcmp($6,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "char"))) { }

			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "float")) && !(strcmp($6,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "float"))) { }

			else
			{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		$$ = (char *)malloc(strlen("echo $")+strlen($9)+strlen($5)+strlen("$")+strlen($11)+strlen("\n")+ 1);
		strcpy($$,"echo $");
		strcat($$,$9);
		strcat($$,$5);
		strcat($$,"$");
		strcat($$,$11);
		strcat($$,"\n");
		free($5);
		free($9);
		free($11);
	}
	|
	RESERVADA PARENTESISABR COMILLAS PRCVAL TEXTO PRCVAL TEXTO PRCVAL COMILLAS COMA ID COMA ID COMA ID PARENTESISCERR PTOCOMA
	{
		if(strcmp($1, "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($11))
		{
			cout<<endl<<"*ERROR: variable ->"<<$11<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($13))
		{
			cout<<endl<<"*ERROR: variable ->"<<$13<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($15))
		{
			cout<<endl<<"*ERROR: variable ->"<<$15<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("echo $")+strlen($11)+strlen($5)+strlen("$")+strlen($13)+strlen($7)+strlen("$")+strlen($15)+strlen("\n")+ 1);
		strcpy($$,"echo $");
		strcat($$,$11);
		strcat($$,$5);
		strcat($$,"$");
		strcat($$,$13);
		strcat($$,$7);
		strcat($$,"$");
		strcat($$,$15);
		strcat($$,"\n");
		free($5);
		free($7);
		free($11);
		free($13);
		free($15);
	};

condicional:
	ID IGUALD ID
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+strlen($1)+strlen(" -eq $")+strlen($3)+strlen(" ]") + 1);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -eq $");
		strcat($$,$3);
		strcat($$," ]");
		free($1);
		free($3);
	}
	|
	NUM IGUALD ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ ")+sizeof($1)+strlen(" -eq $")+strlen($3)+strlen(" ]") + 1);
		string num = to_string($1);
		strcpy($$,"[ ");
		strcat($$,num.c_str());
		strcat($$," -eq $");
		strcat($$,$3);
		strcat($$," ]");
		free($3);
	}
	|
	ID IGUALD NUM
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+sizeof($3)+strlen(" -eq ")+strlen($1)+strlen(" ]") + 1);
		string num = to_string($3);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -eq ");
		strcat($$,num.c_str());
		strcat($$," ]");
		free($1);
	}
	|
	ID MAYOR ID
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+strlen($1)+strlen(" -gt $")+strlen($3)+strlen(" ]") + 1);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -gt $");
		strcat($$,$3);
		strcat($$," ]");
		free($1);
		free($3);
	}
	|
	ID MAYOR_I ID
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+strlen($1)+strlen(" -ge $")+strlen($3)+strlen(" ]") + 1);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -ge $");
		strcat($$,$3);
		strcat($$," ]");
		free($1);
		free($3);
	}
	|
	ID MENOR ID
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+strlen($1)+strlen(" -lt $")+strlen($3)+strlen(" ]") + 1);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -lt $");
		strcat($$,$3);
		strcat($$," ]");
		free($1);
		free($3);
	}
	|
	ID MENOR_I ID
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+strlen($1)+strlen(" -le $")+strlen($3)+strlen(" ]") + 1);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -le $");
		strcat($$,$3);
		strcat($$," ]");
		free($1);
		free($3);
	}
	|
	NUM MAYOR ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen("[ ")+sizeof($1)+strlen(" -gt $")+strlen($3)+strlen(" ]") + 1);
		string num = to_string($1);
		strcpy($$,"[ ");
		strcat($$,num.c_str());
		strcat($$," -gt $");
		strcat($$,$3);
		strcat($$," ]");
		free($3);
	}
	|
	NUM MAYOR_I ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ ")+sizeof($1)+strlen(" -ge $")+strlen($3)+strlen(" ]") + 1);
		string num = to_string($1);
		strcpy($$,"[ ");
		strcat($$,num.c_str());
		strcat($$," -ge $");
		strcat($$,$3);
		strcat($$," ]");
		free($3);
	}
	|
	NUM MENOR ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ ")+sizeof($1)+strlen(" -lt $")+strlen($3)+strlen(" ]") + 1);
		string num = to_string($1);
		strcpy($$,"[ ");
		strcat($$,num.c_str());
		strcat($$," -lt $");
		strcat($$,$3);
		strcat($$," ]");
		free($3);
	}
	|
	NUM MENOR_I ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ ")+sizeof($1)+strlen(" -le $")+strlen($3)+strlen(" ]") + 1);
		string num = to_string($1);
		strcpy($$,"[ ");
		strcat($$,num.c_str());
		strcat($$," -le $");
		strcat($$,$3);
		strcat($$," ]");
		free($3);
	}
	|
	ID MAYOR NUM
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+sizeof($3)+strlen(" -gt ")+strlen($1)+strlen(" ]") + 1);
		string num = to_string($3);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -gt ");
		strcat($$,num.c_str());
		strcat($$," ]");
		free($1);
	}
	|
	ID MAYOR_I NUM
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+sizeof($3)+strlen(" -ge ")+strlen($1)+strlen(" ]") + 1);
		string num = to_string($3);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -ge ");
		strcat($$,num.c_str());
		strcat($$," ]");
		free($1);
	}
	|
	ID MENOR NUM
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+sizeof($3)+strlen(" -lt ")+strlen($1)+strlen(" ]") + 1);
		string num = to_string($3);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -lt ");
		strcat($$,num.c_str());
		strcat($$," ]");
		free($1);
	}
	|
	ID MENOR_I NUM
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+sizeof($3)+strlen(" -le ")+strlen($1)+strlen(" ]") + 1);
		string num = to_string($3);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -le ");
		strcat($$,num.c_str());
		strcat($$," ]");
		free($1);
	}
	|
	ID DIST ID
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+strlen($1)+strlen(" -ne $")+strlen($3)+strlen(" ]") + 1);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -ne $");
		strcat($$,$3);
		strcat($$," ]");
		free($1);
		free($3);
	}
	|
	ID DIST NUM
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ $")+sizeof($3)+strlen(" -ne ")+strlen($1)+strlen(" ]") + 1);
		string num = to_string($3);
		strcpy($$,"[ $");
		strcat($$,$1);
		strcat($$," -ne ");
		strcat($$,num.c_str());
		strcat($$," ]");
		free($1);
	}
	|
	NUM DIST ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("[ ")+sizeof($1)+strlen(" -ne $")+strlen($3)+strlen(" ]") + 1);
		string num = to_string($1);
		strcpy($$,"[ ");
		strcat($$,num.c_str());
		strcat($$," -ne $");
		strcat($$,$3);
		strcat($$," ]");
		free($3);
	};

retornar:
	RESERVADA NUM PTOCOMA
	{
		if(strcmp($1, "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen(" ")+1);
		strcpy($$," ");
	}
	|
	RESERVADA ID PTOCOMA
	{
		if(!esta_tabla_sim($2))
		{
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(strcmp($1, "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen(" ")+1);
		strcpy($$," ");
	}
	|
	RESERVADA PARENTESISABR NUM PARENTESISCERR PTOCOMA
	{
		if(strcmp($1, "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen(" ")+1);
		strcpy($$," ");
	}
	|
	RESERVADA PARENTESISABR ID PARENTESISCERR PTOCOMA
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;

		}

		else if(strcmp($1, "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen(" ")+1);
		strcpy($$," ");
	};

declaracion:
	TIPO ID PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else
		{
			char *tipo = strdup($1);
			char *id = strdup($2);
			tupla aux = make_tuple(tipo,id);
			insertar_tabla_sim(aux);
		}
		$$ = (char *)malloc(strlen("")+1);
		strcpy($$,"");

		free($1);
		free($2);
	}
	|
	TIPO ID IGUAL NUM PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(strcmp($1, "char"))
		{
			char * tipo = strdup($1);
			char * id = strdup($2);
			tupla aux = make_tuple(tipo,id);
			insertar_tabla_sim(aux);
		}
		else
		{
			cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($2)+strlen("=")+sizeof($4)+strlen("\n")+ 1);
		string num = to_string($4);
		strcpy($$,$2);
		strcat($$,"=");
		strcat($$,num.c_str());
		strcat($$,"\n");

		free($1);
		free($2);
	}
	|
	TIPO ID IGUAL COMISIMPLE ID COMISIMPLE PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(strcmp($1,"int") && strcmp($1, "float"))
		{
			char * tipo = strdup($1);
			char * id = strdup($2);
			tupla aux = make_tuple(tipo,id);
			insertar_tabla_sim(aux);
		}

		else
		{
			cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($2)+strlen("='")+strlen($5)+strlen("'\n")+ 1);
		strcpy($$,$2);
		strcat($$,"='");
		strcpy($$,$5);
		strcat($$,"'\n");

		free($1);
		free($2);
		free($5);
	}
	|
	TIPO ID IGUAL COMISIMPLE NUM COMISIMPLE PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(strcmp($1,"int") && strcmp($1, "float"))
		{
			char * tipo = strdup($1);
			char * id = strdup($2);
			tupla aux = make_tuple(tipo,id);
			insertar_tabla_sim(aux);
		}
		else
		{
			cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($2)+strlen("='")+sizeof($5)+strlen("'\n")+ 1);
		string num = to_string($5);
		strcpy($$,$2);
		strcat($$,"='");
		strcat($$,num.c_str());
		strcat($$,"'\n");

		free($1);
		free($2);
	}
	|
	TIPO ID IGUAL ID PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($4))
		{
			cout<<endl<<"*ERROR: variable ->"<<$4<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!strcmp($1,get<0>(obtener_tupla_por_id($4))))
		{
			char * tipo = strdup($1);
			char * id = strdup($2);
			tupla aux = make_tuple(tipo,id);

			insertar_tabla_sim(aux);
		}

		else
		{
			cout<<endl<<"*ERROR: TIPO de dato INCORRECTO"<<" Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($2)+strlen("=$")+strlen($4)+strlen("\n") + 1);
		strcpy($$,$2);
		strcat($$,"=$");
		strcat($$,$4);
		strcat($$,"\n");

		free($1);
		free($2);
		free($4);
	};

asignacion:
	ID IGUAL ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(strcmp(get<0>(obtener_tupla_por_id($1)),get<0>(obtener_tupla_por_id($3))))
		{
			cout<<endl<<"*ERROR: variables ->"<<$1<< " "<< $3<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=$")+strlen($3)+strlen("\n")+1);
		strcpy($$,$1);
		strcat($$,"=$");
		strcat($$,$3);
		strcat($$,"\n");
		free($1);
		free($3);

	}
	|
	ID IGUAL NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!strcmp(get<0>(obtener_tupla_por_id($1)), "char"))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=")+sizeof($3)+strlen("\n")+ 1);
		string num = to_string($3);
		strcpy($$,$1);
		strcat($$,"=");
		strcat($$,num.c_str());
		strcat($$,"\n");
		free($1);

	}
	|
	ID SUM_ASSIGN ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(strcmp(get<0>(obtener_tupla_por_id($1)),get<0>(obtener_tupla_por_id($3))))
		{
			cout<<endl<<"*ERROR: variables ->"<<$1<< " "<< $3<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr $")+strlen($1)+strlen(" + $")+strlen($3)+strlen("`\n")+1);
		strcpy($$,$1);
		strcat($$,"=`expr $");
		strcat($$,$1);
		strcat($$," + $");
		strcat($$,$3);
		strcat($$,"`\n");
		free($1);
		free($3);

	}
	|
	ID SUM_ASSIGN NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!strcmp(get<0>(obtener_tupla_por_id($1)), "char"))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr $")+strlen($1)+strlen(" + ")+sizeof($3)+strlen("`\n")+1);
		string num = to_string($3);
		strcpy($$,$1);
		strcat($$,"=`expr $");
		strcat($$,$1);
		strcat($$," + ");
		strcat($$,num.c_str());
		strcat($$,"`\n");
		free($1);
	}
	|
	ID SUB_ASSIGN ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(strcmp(get<0>(obtener_tupla_por_id($1)),get<0>(obtener_tupla_por_id($3))))
		{
			cout<<endl<<"*ERROR: variables ->"<<$1<< " "<< $3<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr $")+strlen($1)+strlen(" - $")+strlen($3)+strlen("`\n")+1);
		strcpy($$,$1);
		strcat($$,"=`expr $");
		strcat($$,$1);
		strcat($$," - $");
		strcat($$,$3);
		strcat($$,"`\n");
		free($1);
		free($3);
	}
	|
	ID SUB_ASSIGN NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!strcmp(get<0>(obtener_tupla_por_id($1)), "char"))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen($1)+strlen("=`expr $")+strlen($1)+strlen(" - ")+sizeof($3)+strlen("`\n")+1);
		string num = to_string($3);
		strcpy($$,$1);
		strcat($$,"=`expr $");
		strcat($$,$1);
		strcat($$," - ");
		strcat($$,num.c_str());
		strcat($$,"`\n");
		free($1);
	}
	|
	ID MUL_ASSIGN ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(strcmp(get<0>(obtener_tupla_por_id($1)),get<0>(obtener_tupla_por_id($3))))
		{
			cout<<endl<<"*ERROR: variables ->"<<$1<< " "<< $3<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr $")+strlen($1)+strlen(" \\* $")+strlen($3)+strlen("`\n")+1);
		strcpy($$,$1);
		strcat($$,"=`expr $");
		strcat($$,$1);
		strcat($$," \\* $");
		strcat($$,$3);
		strcat($$,"`\n");
		free($1);
		free($3);
	}
	|
	ID MUL_ASSIGN NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!strcmp(get<0>(obtener_tupla_por_id($1)), "char"))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr $")+strlen($1)+strlen(" \\* ")+sizeof($3)+strlen("`\n")+1);
		string num = to_string($3);
		strcpy($$,$1);
		strcat($$,"=`expr $");
		strcat($$,$1);
		strcat($$," \\* ");
		strcat($$,num.c_str());
		strcat($$,"`\n");
		free($1);
	}
	|
	ID IGUAL suma PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen($1)+strlen("=`expr ")+strlen($3)+strlen("`\n") + 1);
		strcpy($$,$1);
		strcat($$,"=`expr ");
		strcat($$,$3);
		strcat($$,"`\n");
		free($1);
		free($3);
	}
	|
	ID IGUAL resta PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr ")+strlen($3)+strlen("`\n") + 1);
		strcpy($$,$1);
		strcat($$,"=`expr ");
		strcat($$,$3);
		strcat($$,"`\n");
		free($1);
		free($3);
	}
	|
	ID IGUAL multi PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen($1)+strlen("=`expr ")+strlen($3)+strlen("`\n") + 1);
		strcpy($$,$1);
		strcat($$,"=`expr ");
		strcat($$,$3);
		strcat($$,"`\n");
		free($1);
		free($3);
	}
	|
	ID IGUAL div PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen($1)+strlen("=`expr ")+strlen($3)+strlen("`\n") + 1);
		strcpy($$,$1);
		strcat($$,"=`expr ");
		strcat($$,$3);
		strcat($$,"`\n");
		free($1);
		free($3);
	}
	|
	ID IGUAL ID PORCENTAJE ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($5))
		{
			cout<<endl<<"*ERROR: variable ->"<<$5<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr $")+strlen($3)+strlen(" % $")+strlen($5)+strlen("`\n") + 1);
		strcpy($$,$1);
		strcat($$,"=`expr $");
		strcat($$,$3);
		strcat($$, " % $");
		strcat($$,$5);
		strcat($$,"`\n");
		free($1);
		free($3);
		free($5);
	}
	|
	ID IGUAL ID PORCENTAJE NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr $")+strlen($3)+strlen(" % ")+sizeof($5)+strlen("`\n") + 1);
		string num = to_string($5);
		strcpy($$,$1);
		strcat($$,"=`expr $");
		strcat($$,$3);
		strcat($$, " % ");
		strcat($$,num.c_str());
		strcat($$,"`\n");
		free($1);
		free($3);
	}
	|
	ID IGUAL NUM PORCENTAJE ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($5))
		{
			cout<<endl<<"*ERROR: variable ->"<<$5<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr ")+strlen($5)+strlen(" % $")+sizeof($3)+strlen("`\n") + 1);
		string num = to_string($3);
		strcpy($$,$1);
		strcat($$,"=`expr ");
		strcat($$,num.c_str());
		strcat($$, " % $");
		strcpy($$,$5);
		strcat($$,"`\n");
		free($1);
		free($5);

	}
	|
	ID IGUAL NUM PORCENTAJE NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr ")+sizeof($3)+strlen(" % ")+sizeof($5)+strlen("`\n") + 1);
		string num1 = to_string($3);
		string num2 = to_string($5);
		strcpy($$,$1);
		strcat($$,"=`expr ");
		strcat($$,num1.c_str());
		strcat($$, " % ");
		strcat($$,num2.c_str());
		strcat($$,"`\n");
		free($1);
	}
	|
	ID INC PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr $")+strlen($1)+strlen(" + 1")+strlen("`\n")+1);
		strcpy($$,$1);
		strcat($$,"=`expr $");
		strcat($$,$1);
		strcat($$," + 1");
		strcat($$,"`\n");
		free($1);
	}
	|
	ID DEC PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen("=`expr $")+strlen($1)+strlen(" - 1")+strlen("`\n")+1);
		strcpy($$,$1);
		strcat($$,"=`expr $");
		strcat($$,$1);
		strcat($$," - 1");
		strcat($$,"`\n");
		free($1);
	}
	|
	INC ID PTOCOMA
	{
		if(!esta_tabla_sim($2))
		{
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($2)+strlen("=`expr $")+strlen($2)+strlen(" + 1")+strlen("`\n")+1);
		strcpy($$,$2);
		strcat($$,"=`expr $");
		strcat($$,$2);
		strcat($$," + 1");
		strcat($$,"`\n");
		free($2);

	}
	|
	DEC ID PTOCOMA
	{
		if(!esta_tabla_sim($2))
		{
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($2)+strlen("=`expr $")+strlen($2)+strlen(" - 1")+strlen("`\n")+1);
		strcpy($$,$2);
		strcat($$,"=`expr $");
		strcat($$,$2);
		strcat($$," - 1");
		strcat($$,"`\n");
		free($2);
	};

suma:
	suma SUMA ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen(" + $")+strlen($3) + 1);
		strcpy($$,$1);
		strcat($$," + $");
		strcat($$,$3);
		free($1);
		free($3);
	}
	|
	suma SUMA NUM
	{
		$$ = (char *)malloc(strlen($1)+strlen(" + ")+sizeof($3) + 1);
		string num = to_string($3);
		strcpy($$,$1);
		strcat($$," + ");
		strcat($$,num.c_str());
		free($1);
	}
	|
	ID SUMA ID
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("$")+strlen($1)+strlen(" + $")+strlen($3) + 1);
		strcpy($$,"$");
		strcat($$,$1);
		strcat($$," + $");
		strcat($$,$3);
		free($1);
		free($3);

	}
	|
	NUM SUMA NUM
	{
		$$ = (char *)malloc(sizeof($1)+strlen(" + ")+sizeof($3) + 1);
		string num1 = to_string($1);
		string num2 = to_string($3);
		strcpy($$,num1.c_str());
		strcat($$," + ");
		strcat($$,num2.c_str());
	}
	|
	ID SUMA NUM
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("$")+strlen($1)+strlen(" + ")+sizeof($3) + 1);
		string num = to_string($3);
		strcpy($$,"$");
		strcat($$,$1);
		strcat($$," + ");
		strcat($$,num.c_str());
		free($1);
	}
	|
	NUM SUMA ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($3)+strlen(" + $")+sizeof($1) + 1);
		string num = to_string($1);
		strcpy($$,num.c_str());
		strcat($$," + $");
		strcat($$,$3);
		free($3);
	};

resta:
	resta MENOS ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen(" - $")+strlen($3) + 1);
		strcpy($$,$1);
		strcat($$," - $");
		strcat($$,$3);
		free($1);
		free($3);

	}
	|
	resta MENOS NUM
	{
		$$ = (char *)malloc(strlen($1)+strlen(" - ")+sizeof($3) + 1);
		string num = to_string($3);
		strcpy($$,$1);
		strcat($$," - ");
		strcat($$,num.c_str());
		free($1);
	}
	|
	ID MENOS ID
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("$")+strlen($1)+strlen(" - $")+strlen($3) + 1);
		strcpy($$,"$");
		strcat($$,$1);
		strcat($$," - $");
		strcat($$,$3);
		free($1);
		free($3);
	}
	|
	NUM MENOS NUM
	{
		$$ = (char *)malloc(sizeof($1)+strlen(" - ")+sizeof($3) + 1);
		string num1 = to_string($1);
		string num2 = to_string($3);
		strcpy($$,num1.c_str());
		strcat($$," - ");
		strcat($$,num2.c_str());
	}
	|
	ID MENOS NUM
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("$")+strlen($1)+strlen(" - ")+sizeof($3) + 1);
		string num = to_string($3);
		strcpy($$,"$");
		strcat($$,$1);
		strcat($$," - ");
		strcat($$,num.c_str());
		free($1);
	}
	|
	NUM MENOS ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($3)+strlen(" - $")+sizeof($1) + 1);
		string num = to_string($1);
		strcpy($$,num.c_str());
		strcat($$," - $");
		strcat($$,$3);
		free($3);
	};

multi:
	multi MULTI ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen(" \\* $")+strlen($3) + 1);
		strcpy($$,$1);
		strcat($$," \\* $");
		strcat($$,$3);
		free($1);
		free($3);

	}
	|
	multi MULTI NUM
	{
		$$ = (char *)malloc(strlen($1)+strlen(" \\* ")+sizeof($3) + 1);
		string num = to_string($3);
		strcpy($$,$1);
		strcat($$," \\* ");
		strcat($$,num.c_str());
		free($1);
	}
	|
	ID MULTI ID
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("$")+strlen($1)+strlen(" \\* $")+strlen($3) + 1);
		strcpy($$,"$");
		strcat($$,$1);
		strcat($$," \\* $");
		strcat($$,$3);
		free($1);
		free($3);
	}
	|
	NUM MULTI NUM
	{
		$$ = (char *)malloc(sizeof($1)+strlen(" \\* ")+sizeof($3) + 1);
		string num1 = to_string($1);
		string num2 = to_string($3);
		strcpy($$,num1.c_str());
		strcat($$," \\* ");
		strcat($$,num2.c_str());
	}
	|
	ID MULTI NUM
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("$")+strlen($1)+strlen(" \\* ")+sizeof($3) + 1);
		string num = to_string($3);
		strcpy($$,"$");
		strcat($$,$1);
		strcat($$," \\* ");
		strcat($$,num.c_str());
		free($1);
	}
	|
	NUM MULTI ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen($3)+strlen(" \\* $")+sizeof($1) + 1);
		string num = to_string($1);
		strcpy($$,num.c_str());
		strcat($$," \\* $");
		strcat($$,$3);
		free($3);
	};

div:
	div DIV ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($1)+strlen(" / $")+strlen($3) + 1);
		strcpy($$,$1);
		strcat($$," / $");
		strcat($$,$3);
		free($1);
		free($3);
	}
	|
	div DIV NUM
	{
		$$ = (char *)malloc(strlen($1)+strlen(" / ")+sizeof($3) + 1);
		string num = to_string($3);
		strcpy($$,$1);
		strcat($$," / ");
		strcat($$,num.c_str());
		free($1);
	}
	|
	ID DIV ID
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		else if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen("$")+strlen($1)+strlen(" / $")+strlen($3) + 1);
		strcpy($$,"$");
		strcat($$,$1);
		strcat($$," / $");
		strcat($$,$3);
		free($1);
		free($3);
	}
	|
	NUM DIV NUM
	{
		$$ = (char *)malloc(sizeof($1)+strlen(" / ")+sizeof($3) + 1);
		string num1 = to_string($1);
		string num2 = to_string($3);
		strcpy($$,num1.c_str());
		strcat($$," / ");
		strcat($$,num2.c_str());
	}
	|
	ID DIV NUM
	{
		if(!esta_tabla_sim($1))
		{
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		$$ = (char *)malloc(strlen("$")+strlen($1)+strlen(" / ")+sizeof($3) + 1);
		string num = to_string($3);
		strcpy($$,"$");
		strcat($$,$1);
		strcat($$," / ");
		strcat($$,num.c_str());
		free($1);
	}
	|
	NUM DIV ID
	{
		if(!esta_tabla_sim($3))
		{
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		$$ = (char *)malloc(strlen($3)+strlen(" / $")+sizeof($1) + 1);
		string num = to_string($1);
		strcpy($$,num.c_str());
		strcat($$," / $");
		strcat($$,$3);
		free($3);

	};

%%

void agregar_ambito()
{
	vector<tupla > lista_ambito;
	tabla_sim.emplace_back(lista_ambito);
}

void eliminar_ambito()
{
	vector<vector<tuple<char *,char *> > >::iterator it;
	vector<tupla >::iterator it2;

	it = tabla_sim.end();
	it--;
	it2 = (*it).begin();

	for(it2; it2!=(*it).end() ;it2++)
	{
		free(get<0>(*it2));
		free(get<1>(*it2));
	}

	tabla_sim.pop_back();
}

bool esta_tabla_sim(char *id)
{
	vector<vector<tupla > >::iterator it;
	vector<tupla >::iterator it2;

	it = tabla_sim.end();
	it--;
	it2 = (*it).begin();

	for(it2; it2!=(*it).end(); it2++)
		if(!strcmp(get<1>(*it2),id))
			return true;

	return false;
}

tupla obtener_tupla_por_id(char *id)
{
	vector<vector<tupla > >::iterator it;
	vector<tupla >::iterator it2;

	it = tabla_sim.end();
	it--;
	it2 = (*it).begin();

	for(it2; it2!=(*it).end(); it2++)
		if(!strcmp(get<1>(*it2),id))
			return *it2;

	tupla t;
	return t;
}

void imprimir_tabla_sim()
{
	vector<vector<tupla > >::iterator it;
	vector<tupla >::iterator it2;
	int i = 0;

	it = tabla_sim.end();
	it--;

	for(i; i < tabla_sim.size(); i++)
	{
		cout<<"\nEn lista "<<i<<": ";
		it2 = (*it).begin();

		for(it2; it2 != (*it).end(); it2++)
			cout<<"<"<<get<0>(*it2)<< "," <<get<1>(*it2)<<">";

		it--;
	}
	cout<<endl;
}


bool insertar_tabla_sim(tupla const & tup)
{
	vector<vector<tupla > >::iterator it;

	if(esta_tabla_sim(get<1>(tup)))
	{
		cout<<"ALERTA"<<endl;
		return false;
	}

	it = tabla_sim.end();
	it--;
	(*it).emplace_back(tup);

	return true;
}

void liberar_tabla_sim()
{
	int i = 0;

	for(i; i < tabla_sim.size(); i++)
		eliminar_ambito();
}

void obtener_ambito()
{
	vector<vector<tupla > >::iterator it;
	vector<tupla >::iterator it2;

	it = tabla_sim.end();
	it--;

	for(it2 = (*it).begin(); it2 != (*it).end(); it2++)
		cout<<get<0>(*it2)<<get<1>(*it2)<<endl;
}

void yyerror(const char *s)
{
	cout<<"***ERROR: Mensaje: "<<s<<". Linea: "<<lineas<<"***"<<endl;
	exit(-1);
}

int main(int argc, char **argv)
{
	if(argc != 2)
	{
		cout<<"ERROR: Archivo invalido"<<endl;
		return -1;
	}

	FILE *archivo = fopen(argv[1],"r");

	if(!archivo)
	{
		printf("ERROR: No se puedo abrir el archivo");
		return -1;
	}

	yyin = archivo;

	cargar_reservada();
	cargar_reservada_tipo();
	agregar_ambito();

	yyparse();

	eliminar_reservada();
	eliminar_reservada_tipo();

	fclose(yyin);

	return 0;
}
