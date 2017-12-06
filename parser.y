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
	|
	cabecera NUMERAL RESERVADA MENOR ID PUNTO ID MAYOR
	|
	NUMERAL RESERVADA MENOR ID PUNTO ID MAYOR
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
	declaracion
	|
	retornar cuerpo
	|
	retornar
	|
	scan cuerpo
	|
	scan
	|
	print cuerpo
	|
	print
	|
	estructura cuerpo
	|
	estructura
	|
	RESERVADA LLAVEABR cuerpo LLAVECERR estructura PTOCOMA cuerpo
	|
	RESERVADA LLAVEABR cuerpo LLAVECERR estructura PTOCOMA
	|
	estructura LLAVEABR cuerpo LLAVECERR cuerpo
	|
	estructura LLAVEABR cuerpo LLAVECERR
	|
	RESERVADA LLAVEABR cuerpo LLAVECERR cuerpo
	|
	RESERVADA LLAVEABR cuerpo LLAVECERR
	|
	RESERVADA cuerpo
	;

estructura:
	RESERVADA PARENTESISABR condicional PARENTESISCERR
	;

scan:
	RESERVADA PARENTESISABR COMILLAS PRCVAL COMILLAS COMA  AMPERSAND ID PARENTESISCERR PTOCOMA
	;

print:
	RESERVADA PARENTESISABR COMILLAS TEXTO COMILLAS PARENTESISCERR PTOCOMA
	|
	RESERVADA PARENTESISABR COMILLAS TEXTO PRCVAL TEXTO COMILLAS COMA ID PARENTESISCERR PTOCOMA
	|
	RESERVADA PARENTESISABR COMILLAS PRCVAL TEXTO COMILLAS COMA ID PARENTESISCERR PTOCOMA
	|
	RESERVADA PARENTESISABR COMILLAS TEXTO PRCVAL COMILLAS COMA ID PARENTESISCERR PTOCOMA
	|
	RESERVADA PARENTESISABR COMILLAS PRCVAL COMILLAS COMA ID PARENTESISCERR PTOCOMA
	|
	RESERVADA PARENTESISABR COMILLAS PRCVAL TEXTO PRCVAL COMILLAS COMA ID COMA ID PARENTESISCERR PTOCOMA
	|
	RESERVADA PARENTESISABR COMILLAS PRCVAL TEXTO PRCVAL TEXTO PRCVAL COMILLAS COMA ID COMA ID COMA ID PARENTESISCERR PTOCOMA
	;

condicional:
	ID IGUAL IGUAL ID
	|
	NUM IGUAL IGUAL ID
	|
	ID IGUAL IGUAL NUM
	|
	ID MAYOR ID
	|
	ID MAYOR_I ID
	|
	ID MENOR ID
	|
	ID MENOR_I ID
	|
	NUM MAYOR ID
	|
	NUM MAYOR_I ID
	|
	NUM MENOR ID
	|
	NUM MENOR_I ID
	|
	ID MAYOR NUM
	|
	ID MAYOR_I NUM
	|
	ID MENOR NUM
	|
	ID MENOR_I NUM
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
	|
	ID SUMA IGUAL ID PTOCOMA
	|
	ID SUMA IGUAL NUM PTOCOMA
	|
	ID MENOS IGUAL ID PTOCOMA
	|
	ID MENOS IGUAL NUM PTOCOMA
	|
	ID MULTI IGUAL ID PTOCOMA
	|
	ID MULTI IGUAL NUM PTOCOMA
	|
	ID IGUAL ID SUMA ID PTOCOMA
	|
	ID IGUAL NUM SUMA NUM PTOCOMA
	|
	ID IGUAL ID SUMA NUM PTOCOMA
	|
	ID IGUAL NUM SUMA ID PTOCOMA
	|
	ID IGUAL ID SUMA ID SUMA ID PTOCOMA
	|
	ID IGUAL ID MENOS ID PTOCOMA
	|
	ID IGUAL NUM MENOS NUM PTOCOMA
	|
	ID IGUAL ID MENOS NUM PTOCOMA
	|
	ID IGUAL NUM MENOS ID PTOCOMA
	|
	ID IGUAL ID MULTI ID PTOCOMA
	|
	ID IGUAL NUM MULTI NUM PTOCOMA
	|
	ID IGUAL ID MULTI NUM PTOCOMA
	|
	ID IGUAL NUM MULTI ID PTOCOMA
	|
	ID IGUAL ID DIV ID PTOCOMA
	|
	ID IGUAL NUM DIV NUM PTOCOMA
	|
	ID IGUAL ID DIV NUM PTOCOMA
	|
	ID IGUAL NUM DIV ID PTOCOMA
	|
	ID IGUAL ID PORCENTAJE ID PTOCOMA
	|
	ID IGUAL ID PORCENTAJE NUM PTOCOMA
	|
	ID IGUAL NUM PORCENTAJE ID PTOCOMA
	|
	ID IGUAL NUM PORCENTAJE NUM PTOCOMA
	|
	ID SUMA SUMA PTOCOMA
	|
	ID MENOS MENOS PTOCOMA
	|
	SUMA SUMA ID PTOCOMA
	|
	MENOS MENOS ID PTOCOMA
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
