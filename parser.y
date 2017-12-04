%{
#include<iostream>
#include<cstring>
#include<list>
#include<cstdlib>
#include<cstdio>

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

%}

%union
{
	char *strval;
	int	ival;
}

%token<strval> TIPO
%token<strval> ID
%token<ival>	NUM

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
%token PUNTO
%token PTOCOMA
%token LLAVEABR
%token LLAVECERR
%token PARENTESISABR
%token PARENTESISCERR
%token CORAABR
%token CORACERR
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
%token COMILLAS
%token PORCENTAJE
%token COMA


%right IGUAL
%left SUMA MENOS
%left MULTI
%left POTEN
%left COMILLAS
%left PARENTESISABR

%start programa

%%

programa:
	cabecera main
	;
cabecera:
	NUMERAL ID COMILLAS ID PUNTO ID COMILLAS
	|
	cabecera NUMERAL ID COMILLAS ID PUNTO ID COMILLAS
	;
main:
	TIPO MAIN PARENTESISABR parametros PARENTESISCERR llaves
	;
parametros:
	TIPO ID COMA TIPO MULTI MULTI ID
	|
	%empty
	;
llaves:
	LLAVEABR cuerpo LLAVECERR
	;
cuerpo:
	cuerpo declaracion
	|
	cuerpo estructura
	|
	cuerpo asignacion
	|
	%empty
	;
declaracion:
	TIPO ID IGUAL NUM PTOCOMA
	;
estructura:
	IF PARENTESISABR ID IGUAL IGUAL NUM PARENTESISCERR llaves
	|
	IF PARENTESISABR ID IGUAL IGUAL TIPO PARENTESISCERR llaves
	|
	IF PARENTESISABR ID IGUAL IGUAL NUM PARENTESISCERR ID IGUAL NUM PTOCOMA
	|
	IF PARENTESISABR ID IGUAL IGUAL TIPO PARENTESISCERR ID IGUAL NUM PTOCOMA
	|
	IF PARENTESISABR ID IGUAL IGUAL NUM PARENTESISCERR ID IGUAL TIPO PTOCOMA
	|
	IF PARENTESISABR ID IGUAL IGUAL TIPO PARENTESISCERR ID IGUAL TIPO PTOCOMA
	;
asignacion:
	ID IGUAL NUM PTOCOMA
	|
	ID IGUAL TIPO PTOCOMA
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
