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
%token<strval> TEXTO
%token<strval> PRCVAL
%token<strval> TIPO
%token<strval> RESERVADA
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
	codigo
	;

codigo:
	cabecera principal
	|
	principal
	;

cabecera:
	cabecera NUMERAL RESERVADA MENOR ID MAYOR
	|
	NUMERAL RESERVADA MENOR ID MAYOR
	|
	cabecera NUMERAL RESERVADA COMILLAS TEXTO COMILLAS
	|
	NUMERAL RESERVADA COMILLAS TEXTO COMILLAS
	;

principal:
	TIPO RESERVADA PARENTESISABR PARENTESISCERR LLAVEABR cuerpo LLAVECERR
	;

cuerpo:
	asignacion cuerpo
	|
	asignacion
	|
	declaracion cuerpo
	|
	retornar
	;

retornar:
	RESERVADA NUM PTOCOMA
	|
	RESERVADA ID PTOCOMA
	|
	RESERVADA PARENTESISABR NUM PARENTESISCERR PTOCOMA
	|
	RESERVADA PARENTESISABR ID PARENTESISCERR PTOCOMA
	;

declaracion:
	TIPO ID PTOCOMA
	|
	TIPO ID IGUAL NUM PTOCOMA
	|
	TIPO ID IGUAL ID PTOCOMA
	;

asignacion:
	ID IGUAL ID PTOCOMA
	|
	ID IGUAL NUM PTOCOMA
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
