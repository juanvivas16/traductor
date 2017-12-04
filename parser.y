%{
	#include <iostream>
	#include <cstdio>
	#include <list>
	#include <cctype>
	#include <cstring>
  #include <string>
	#include <cstdlib>

	using namespace std;

	int cantErrores = 0;
	extern int lineas;
	extern int yyparse();
	extern int yylex();
	extern FILE *yyin;
	extern list<char *> reservada_tipo;
	void yyerror(const char *);

	extern bool esta_reservada_tipo(char *);
	extern void cargar_reservada_tipo();
	extern void eliminar_reservada();
	extern bool esta_reservada(char *);
	extern void cargar_reservada();

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



%token INCLUDE
%token PRINT
%token SCAN
%token MAIN
%token RETURN
%token IF
%token ELSE
%token DO
%token WHILE
%token FOR
%token TEXTO
%token PUNTO
%token PTOCOMA
%token LLAVEABR
%token LLAVECERR
%token PARENTESISABR
%token PARENTESISCERR
%token MENOR
%token MAYOR
%token EXCL
%token IGUAL
%token SUMA
%token MENOS
%token MULTI
%token DIV
%token POTEN
%token DOSPTOS
%token NUMERAL
%token AMPERSAND
%token MENOR_I
%token MAYOR_I
%token OR
%token AND
%token COMILLAS
%token PORCENTAJE
%token COMA
%token<strval> TIPO
%token<strval> ID
%token<ival>	NUM


%right IGUAL
%left SUMA MENOS
%left MULTI
%left POTEN
%left COMILLAS
%left PARENTESISABR

%start programa

%%

programa:
	cabecera
	;

cabecera:
	cabecera NUMERAL INCLUDE COMILLAS ID PUNTO ID COMILLAS principal
	|
	cabecera NUMERAL INCLUDE MENOR ID PUNTO ID MAYOR principal
	|
	cabecera NUMERAL INCLUDE MENOR ID MAYOR principal
	|
	NUMERAL INCLUDE COMILLAS ID PUNTO ID COMILLAS principal
	|
	NUMERAL INCLUDE MENOR ID PUNTO ID MAYOR principal
	|
	NUMERAL INCLUDE MENOR ID MAYOR principal
	|
	principal
	;

principal:
	TIPO MAIN PARENTESISABR PARENTESISCERR LLAVEABR cuerpo LLAVECERR
	;

cuerpo:
	cuerpo declaracion retornar;
	|
	cuerpo asignacion retornar;
	|
	asignacion retornar;
	|
	declaracion retornar;
	|
	asignacion
	|
	declaracion
	|
	retornar
	|
	%empty
	;

retornar:
	RETURN NUM PTOCOMA
	|
	RETURN LLAVEABR NUM LLAVECERR PTOCOMA
	|
	RETURN ID PTOCOMA
	|
	RETURN LLAVEABR ID LLAVECERR PTOCOMA
;
declaracion:
	TIPO ID PTOCOMA
	;

asignacion:
	ID IGUAL ID PTOCOMA
	|
	ID IGUAL NUM PTOCOMA
	|
	ID SUMA IGUAL NUM PTOCOMA
	;
%%

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
	yyparse();
	cout<<"EXITO: Parsing Correcto."<<endl;
}

void yyerror(const char *s)
{
	cout<<"***ERROR: Mensaje: "<<s<<". Linea: "<<lineas<<"***"<<endl;
	exit(-1);
}
