%{
	#include <iostream>
	#include <cstdio>
	#include <list>
	#include <cctype>
	#include <cstring>
  #include <string>
	#include <cstdlib>

	using namespace std;

	extern int lineas;
	extern int yyparse();
	extern int yylex();
	extern FILE *yyin;
	extern list<char *> reservada_tipo;
	extern list<char *> reservada;
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



%token<strval> INCLUDE
%token<strval> PRINT
%token<strval> SCAN
%token<strval> MAIN
%token<strval> RETURN
%token<strval> IF
%token<strval> ELSE
%token<strval> DO
%token<strval> WHILE
%token<strval> FOR
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
%token DIST
%token OR
%token AND
%token PORCENTAJE
%token COMA
%token COMISIMPLE
%token COMILLAS
%token<strval> PRCVAL
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
	codigo{
		imprimir_reservada();
	}
	;

codigo:
	cabecera principal
	|
	principal
	|
	TIPO INCLUDE
	;

cabecera:
	cabecera NUMERAL INCLUDE COMILLAS ID COMILLAS
	|
	cabecera NUMERAL INCLUDE MENOR ID PUNTO ID MAYOR
	|
	cabecera NUMERAL INCLUDE MENOR ID MAYOR
	|
	NUMERAL INCLUDE COMILLAS ID COMILLAS
	|
	NUMERAL INCLUDE MENOR ID PUNTO ID MAYOR
	|
	NUMERAL INCLUDE MENOR ID MAYOR
	;

principal:
	TIPO MAIN PARENTESISABR PARENTESISCERR LLAVEABR cuerpo LLAVECERR
	;

cuerpo:
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
	RETURN PARENTESISABR NUM PARENTESISCERR PTOCOMA
	|
	RETURN ID PTOCOMA
	|
	RETURN PARENTESISABR ID PARENTESISCERR PTOCOMA
	;

declaracion:
	declaracion TIPO ID PTOCOMA
	|
	TIPO ID PTOCOMA
	;

asignacion:
	asignacion ID IGUAL ID PTOCOMA
	|
	asignacion ID IGUAL NUM PTOCOMA
	|
	asignacion ID SUMA IGUAL NUM PTOCOMA
	|
	ID IGUAL ID PTOCOMA
	|
	ID IGUAL NUM PTOCOMA
	|
	ID SUMA IGUAL NUM PTOCOMA
	;
%%

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
	yyparse();

	cout<<"EXITO: Parsing Correcto."<<endl;
}
