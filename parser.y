%{
	#include <iostream>
	#include <cstdio>
	#include <list>
	#include <cctype>
	#include <cstring>
  #include <string>
	#include <cstdlib>
	#include <typeinfo>

	using namespace std;

	list<list<char *>> tabla_sim;
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
	bool esta_tabla_sim(char *p);
	void imprimir_tabla_sim();
	bool insertar_tabla_sim(char *p);
	void liberar_tabla_sim();
	void obtener_ambito();
	int obtener_tamano_ambito();

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
	float	ival;
}


%token<strval> TIPO
%token<strval> RESERVADA
%token<strval> ID
%token<ival>	NUM
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
%token SUM_ASSIGN
%token SUB_ASSIGN
%token MUL_ASSIGN
%token DIV_ASSIGN
%token MOD_ASSIGN
%token IGUALD
%token OR
%token AND
%token INC
%token DEC
%token PORCENTAJE
%token COMA
%token COMISIMPLE
%token COMILLAS
%token<strval> PRCVAL
%token<strval> TEXTO

%right IGUAL
%left SUMA MENOS
%left MULTI
%left POTEN
%left COMILLAS
%left PARENTESISABR

%start programa

%%

programa:
	codigo {
		if(cantErrores>0)
			cout<<endl<<endl<<"***ERROR: tipo - Semantico***"<<endl;
		else
			cout<<endl<<endl<<"Exito!"<<endl;

	}
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
	TIPO RESERVADA PARENTESISABR PARENTESISCERR LLAVEABR {agregar_ambito(); } cuerpo LLAVECERR{eliminar_ambito(); }
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
	ID IGUALD ID
	|
	NUM IGUALD ID
	|
	ID IGUALD NUM
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
	{
		if(esta_tabla_sim($2))
		{
			imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else
		{
			insertar_tabla_sim($2);
			imprimir_tabla_sim();
		}

		free($1);
		free($2);
	}
	|
	TIPO ID IGUAL NUM PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp($1, "char"))
		{
			insertar_tabla_sim($2);
			imprimir_tabla_sim();
		}
		else
		{
			cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		free($1);
		free($2);
	}
	|
	TIPO ID IGUAL ID PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if( (typeid($2) == typeid($4)) && esta_tabla_sim($4))
		{
			insertar_tabla_sim($2);
			imprimir_tabla_sim();
			cout << "Base vs *pbase: ";
			cout<<(typeid($2) == typeid($4))<<endl;
		}
		else if(!esta_tabla_sim($4))
		{
			imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$4<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else
		{
			cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
			cantErrores++;

		}

		free($1);
		free($2);
		free($4);
	}
	;

asignacion:
	ID IGUAL ID PTOCOMA
	|
	ID IGUAL NUM PTOCOMA
	|
	ID SUM_ASSIGN ID PTOCOMA
	|
	ID SUM_ASSIGN NUM PTOCOMA
	|
	ID SUB_ASSIGN ID PTOCOMA
	|
	ID SUB_ASSIGN NUM PTOCOMA
	|
	ID MUL_ASSIGN ID PTOCOMA
	|
	ID MUL_ASSIGN NUM PTOCOMA
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
	ID INC PTOCOMA
	|
	ID DEC PTOCOMA
	|
	INC ID PTOCOMA
	|
	DEC ID PTOCOMA
	;

%%

void agregar_ambito()
{
	list<char *> lista_ambito;
	tabla_sim.push_back(lista_ambito);
}

void eliminar_ambito()
{
	list<list<char *>>::iterator it;
	list<char *>::iterator it2;

	it = tabla_sim.end();
	it--;
	it2 = (*it).begin();

	for(it2; it2!=(*it).end() ;it2++)
		free(*it2);

	tabla_sim.pop_back();
}

bool esta_tabla_sim(char *p)
{
	list<list<char *>>::iterator it;
	list<char *>::iterator it2;

	it = tabla_sim.end();
	it--;
	it2 = (*it).begin();

	for(it2; it2!=(*it).end(); it2++)
	{
		if(!strcmp(*it2,p))
		{
			return true;
		}
	}

	return false;
}

void imprimir_tabla_sim()
{
	list<list<char *>>::iterator it;
	list<char *>::iterator it2;
	int i = 0;

	it = tabla_sim.end();
	it--;

	for(i; i < tabla_sim.size(); i++)
	{
		cout<<"\nEn lista "<<i<<": ";

		it2 = (*it).begin();

		for(it2; it2 != (*it).end(); it2++)
			cout<<*it2<<" ";

		it--;
	}
	cout<<endl;
}


bool insertar_tabla_sim(char *p)
{
	char *aux = strdup(p);
	list<list<char *>>::iterator it;

	if(esta_tabla_sim(aux))
		return false;


	it = tabla_sim.end();
	it--;
	(*it).push_back(aux);

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
	list<list<char *>>::iterator it;
	list<char *>::iterator it2;

	it = tabla_sim.end();
	it--;

	for(it2 = (*it).begin(); it2 != (*it).end(); it2++)
		cout<<*it2<<endl;
}

int obtener_tamano_ambito()
{
	list<list<char *>>::iterator it;

	it = tabla_sim.end();
	it--;

	return (*it).size();
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

}
