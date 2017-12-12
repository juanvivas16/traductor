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
	vector<vector<tuple<char *, char *>>> tabla_sim;
	int cantErrores = 0;
	char *variable;
	char *varasig;
	char *varasig2;
	char *varasigop;
	char *dolarasig;
	char *estrutura_op;
	char *condi_1;
	char *condi_2;
	char *condi_3;
	char *condi_4;
	char *condi_5;
	extern int lineas;
	extern int yyparse();
	extern int yylex();
	extern FILE *yyin;
	extern list<char *> reservada_tipo;
	extern list<char *> reservada;
	void yyerror(const char *);

	void agregar_ambito();
	void eliminar_ambito();
	bool esta_tabla_sim(char *id);
	tupla obtener_tupla_por_id(char *id);
	void imprimir_tabla_sim();
	bool insertar_tabla_sim(tuple<char *, char *> const & );
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
	codigo
	{
		if(cantErrores > 0)
			cout<<endl<<endl<<"***ERROR: tipo - Semantico***"<<endl;
		else
			cout<<endl<<endl<<"Exito!"<<endl;
	}
	;

codigo:
	cabecera {fprintf(yysalida, "#!/bin/bash\n");} principal
	|
	principal
	;

cabecera:
	cabecera NUMERAL RESERVADA MENOR ID MAYOR
	{
		if(strcmp($3, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free($3);
	}
	|
	NUMERAL RESERVADA MENOR ID MAYOR
	{
		if(strcmp($2, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free($2);
	}
	|
	cabecera NUMERAL RESERVADA COMILLAS TEXTO COMILLAS
	{
		if(strcmp($3, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free($3);
	}
	|
	NUMERAL RESERVADA COMILLAS TEXTO COMILLAS
	{
		if(strcmp($2, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		free($2);
	}
	|
	cabecera NUMERAL RESERVADA MENOR ID PUNTO ID MAYOR
	{
		if(strcmp($3, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free($3);
	}
	|
	NUMERAL RESERVADA MENOR ID PUNTO ID MAYOR
	{
		if(strcmp($2, "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free($2);
	}
	;

principal:
	TIPO RESERVADA PARENTESISABR PARENTESISCERR LLAVEABR cuerpo LLAVECERR
	{
		if(strcmp($2, "main"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<". Quizo decir 'main'"<<endl;
			cantErrores++;
		}
		free($2);
	}
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
	RESERVADA LLAVEABR cuerpo LLAVECERR estructura finestructura cuerpo
	{
		if(strcmp($1, "do"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		estrutura_op = (char *)strdup($1);
		free($1);
	}	
	|
	RESERVADA LLAVEABR LLAVEABR cuerpo LLAVECERR estructura finestructura 
	{
		if(strcmp($1, "do"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		estrutura_op = (char *)strdup($1);
		free($1);
	}
	|
	estructura LLAVEABR cuerpo finestructura cuerpo
	|
	estructura LLAVEABR cuerpo finestructura
	|
	RESERVADA LLAVEABR cuerpo LLAVECERR cuerpo
	{
		if(strcmp($1, "else"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(cantErrores == 0)
			fprintf(yysalida, "else");

		free($1);
	}
	|
	RESERVADA LLAVEABR cuerpo LLAVECERR
	{
		if(strcmp($1, "else"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(cantErrores == 0)
			fprintf(yysalida, "else");

		free($1);
	}
	|
	RESERVADA cuerpo
	;

finestructura:
	LLAVECERR
	{
		fprintf(yysalida, "\nfi\n");
	}
	|
	PTOCOMA
	{
		fprintf(yysalida, "\ndone\n");
	}
	;



estructura:
	RESERVADA PARENTESISABR condicional PARENTESISCERR
	{
		if(strcmp($1, "while") && strcmp($1, "if"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp($1, "while") && cantErrores == 0)
		{
			fprintf(yysalida, $1);
			fprintf(yysalida, "\ndo\n");
			fprintf(yysalida, condi_1);
			fprintf(yysalida, condi_2);
			fprintf(yysalida, condi_3);
			fprintf(yysalida, condi_4);
			fprintf(yysalida, condi_5);
			fprintf(yysalida, "\n");
			condi_1 = "";
			condi_2 = "";
			condi_3 = "";
			condi_4 = "";
			condi_5 = "";
			estrutura_op = (char *)strdup($1);
		}
		else if(!strcmp($1, "if") && cantErrores == 0)
		{
			fprintf(yysalida, $1);
			fprintf(yysalida, condi_1);
			fprintf(yysalida, condi_2);
			fprintf(yysalida, condi_3);
			fprintf(yysalida, condi_4);
			fprintf(yysalida, condi_5);
			fprintf(yysalida, "\nthem\n");
			fprintf(yysalida, "\n");
			condi_1 = "";
			condi_2 = "";
			condi_3 = "";
			condi_4 = "";
			condi_5 = "";
			estrutura_op = (char *)strdup($1);			
		}


		free($1);
	}
	;

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
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$8<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "int")))
			{
			}
			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "char")))
			{
			}
			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
			fprintf(yysalida,"read %s\n", $8);

		free($1);
		free($8);
	}
	;

print:
	RESERVADA PARENTESISABR COMILLAS TEXTO COMILLAS PARENTESISCERR PTOCOMA
	{
		if(strcmp($1, "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo %s\n", $4);

		free($1);
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
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$9<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp($5,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "int")))
			{
			}
			else if(!(strcmp($5,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "char")))
			{
			}
			else if(!(strcmp($5,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo %s $%s %s\n",$4,$9,$6);

		free($1);
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
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$8<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "int")))
			{
			}
			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "char")))
			{
			}
			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO435 "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo $%s %s\n",$8,$5);

		free($1);
		free($4);
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
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$8<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp($5,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "int")))
			{
			}
			else if(!(strcmp($5,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "char")))
			{
			}
			else if(!(strcmp($5,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($8)), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo %s $%s\n",$4,$8);

		free($1);
		free($5);
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
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$7<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($7)), "int")))
			{
			}
			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($7)), "char")))
			{
			}
			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($7)), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo $%s\n",$7);

		free($1);
		free($4);
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
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$9<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($11))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$11<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "int")) && !(strcmp($6,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "int")) )
			{
			}
			else if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "int")) && !(strcmp($6,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "char")))
			{
			}
			else if(!(strcmp($4,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "int")) && !(strcmp($6,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "float")))
			{
			}
			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "char")) && !(strcmp($6,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "int")))
			{
			}
			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "char")) && !(strcmp($6,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "char")))
			{
			}
			else if(!(strcmp($4,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "char")) && !(strcmp($6,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "float")))
			{
			}
			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "float")) && !(strcmp($6,"%d")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "int")))
			{
			}
			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "float")) && !(strcmp($6,"%c")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "char")))
			{
			}
			else if(!(strcmp($4,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($9)), "float")) && !(strcmp($6,"%f")) && !(strcmp(get<0>(obtener_tupla_por_id($11)), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
		fprintf(yysalida, "echo $%s %s $%s\n",$9,$5,$11);

		free($1);
		free($4);
		free($6);
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
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$11<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($13))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$13<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($15))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$15<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo $%s %s $%s %s $%s\n",$11,$5,$13,$7,$15);

		free($1);
		free($11);
		free($13);
		free($15);
	}
	;

condicional:
	ID IGUALD ID
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			////imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup($1);
			condi_3 = " -eq ";
			condi_4 = (char *)strdup($3);
			condi_5 = " ]";
		}

		free($1);
		free($3);
	}
	|
	NUM IGUALD ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			string s = to_string($1);
      		char const* var= s.c_str();
			condi_2 = (char *)var;
			condi_3 = "-eq ";
			condi_4 = (char *)strdup($3);
			condi_5 = " ]";
		}

		free($3);
	}
	|
	ID IGUALD NUM
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup($1);
			condi_3 = " -eq ";
			string s = to_string($3);
      		char const* var= s.c_str();
			condi_4 = (char *)var;
			condi_5 = " ]";
		}

		free($1);
	}
	|
	ID MAYOR ID
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup($1);
			condi_3 = " -gt ";
			condi_4 = (char *)strdup($3);
			condi_5 = " ]";
		}

		free($1);
		free($3);
	}
	|
	ID MAYOR_I ID
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup($1);
			condi_3 = " -ge ";
			condi_4 = (char *)strdup($3);
			condi_5 = " ]";
		}

		free($1);
		free($3);
	}
	|
	ID MENOR ID
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup($1);
			condi_3 = " -lt ";
			condi_4 = (char *)strdup($3);
			condi_5 = " ]";
		}


		free($1);
		free($3);
	}
	|
	ID MENOR_I ID
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup($1);
			condi_3 = " -le ";
			condi_4 = (char *)strdup($3);
			condi_5 = " ]";
		}

		free($1);
		free($3);
	}
	|
	NUM MAYOR ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			string s = to_string($1);
      		char const* var= s.c_str();
			condi_2 = (char *)var;
			condi_3 = " -gt ";
			condi_4 = (char *)strdup($3);
			condi_5 = " ]";
		}

		free($3);
	}
	|
	NUM MAYOR_I ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			string s = to_string($1);
      		char const* var= s.c_str();
			condi_2 = (char *)var;
			condi_3 = " -ge ";
			condi_4 = (char *)strdup($3);
			condi_5 = " ]";
		}

		free($3);
	}
	|
	NUM MENOR ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			string s = to_string($1);
      		char const* var= s.c_str();
			condi_2 = (char *)var;
			condi_3 = " -lt ";
			condi_4 = (char *)strdup($3);
			condi_5 = " ]";
		}

		free($3);
	}
	|
	NUM MENOR_I ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			string s = to_string($1);
      		char const* var= s.c_str();
			condi_2 = (char *)var;
			condi_3 = " -le ";
			condi_4 = (char *)strdup($3);
			condi_5 = " ]";
		}

		free($3);
	}
	|
	ID MAYOR NUM
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup($1);
			condi_3 = " -gt ";
			string s = to_string($3);
      		char const* var= s.c_str();
			condi_4 = (char *)var;
			condi_5 = " ]";
		}

		free($1);
	}
	|
	ID MAYOR_I NUM
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup($1);
			condi_3 = " -ge ";
			string s = to_string($3);
      		char const* var= s.c_str();
			condi_4 = (char *)var;
			condi_5 = " ]";
		}

		free($1);
	}
	|
	ID MENOR NUM
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup($1);
			condi_3 = " -lt ";
			string s = to_string($3);
      		char const* var= s.c_str();
			condi_4 = (char *)var;
			condi_5 = " ]";
		}

		free($1);
	}
	|
	ID MENOR_I NUM
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup($1);
			condi_3 = " -le ";
			string s = to_string($3);
      		char const* var= s.c_str();
			condi_4 = (char *)var;
			condi_5 = " ]";
		}

		free($1);
	}
	;

retornar:
	RESERVADA NUM PTOCOMA
	{
		if(strcmp($1, "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free($1);
	}
	|
	RESERVADA ID PTOCOMA
	{
		if(!esta_tabla_sim($2))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}else if(strcmp($1, "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free($1);
		free($2);
	}
	|
	RESERVADA PARENTESISABR NUM PARENTESISCERR PTOCOMA
	{
		if(strcmp($1, "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free($1);
	}
	|
	RESERVADA PARENTESISABR ID PARENTESISCERR PTOCOMA
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}else if(strcmp($1, "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free($1);
		free($3);
	}
	;

declaracion:
	TIPO ID PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else
		{
			char *tipo = strdup($1);
			char *id = strdup($2);
			tupla aux = make_tuple(tipo,id);

			insertar_tabla_sim(aux);
			//imprimir_tabla_sim();
		}

		//No se traduce.

		free($1);
		free($2);
	}
	|
	TIPO ID IGUAL NUM PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp($1, "char"))
		{
			auto tipo = strdup($1);
			auto id = strdup($2);
			auto aux = make_tuple(tipo,id);

			insertar_tabla_sim(aux);
			//imprimir_tabla_sim();
		}
		else
		{
			cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=%d\n",$2,$4);

		free($1);
		free($2);
	}
	|
	TIPO ID IGUAL COMISIMPLE ID COMISIMPLE PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp($1,"int") && strcmp($1, "float"))
		{
			auto tipo = strdup($1);
			auto id = strdup($2);
			auto aux = make_tuple(tipo,id);

			insertar_tabla_sim(aux);
			//imprimir_tabla_sim();
		}
		else
		{
			cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s='$%s'\n",$2,$5);

		free($1);
		free($2);
	}
	|
	TIPO ID IGUAL COMISIMPLE NUM COMISIMPLE PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp($1,"int") && strcmp($1, "float"))
		{
			auto tipo = strdup($1);
			auto id = strdup($2);
			auto aux = make_tuple(tipo,id);

			insertar_tabla_sim(aux);
			//imprimir_tabla_sim();
		}
		else
		{
			cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s='%d'\n",$2,$5);

		free($1);
		free($2);
	}
	|
	TIPO ID IGUAL ID PTOCOMA
	{
		if(esta_tabla_sim($2))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($4))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$4<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp($1,get<0>(obtener_tupla_por_id($4))))
		{
			auto tipo = strdup($1);
			auto id = strdup($2);
			auto aux = make_tuple(tipo,id);

			insertar_tabla_sim(aux);
			//imprimir_tabla_sim();
		}
		else
		{
			cout<<endl<<"*ERROR: TIPO de dato INCORRECTO"<<" Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=$%s\n",$2,$4);

		free($1);
		free($2);
		free($4);
	}
	;

asignacion:
	ID IGUAL ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp(get<0>(obtener_tupla_por_id($1)),get<0>(obtener_tupla_por_id($3))))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variables ->"<<$1<< " "<< $3<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=$%s\n",$1,$3);

		free($1);
		free($3);
	}
	|
	ID IGUAL NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp(get<0>(obtener_tupla_por_id($1)), "char"))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=%d\n",$1,$3);

		free($1);
	}
	|
	ID SUM_ASSIGN ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp(get<0>(obtener_tupla_por_id($1)),get<0>(obtener_tupla_por_id($3))))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variables ->"<<$1<< " "<< $3<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s + $%s`\n",$1,$1,$3);

		free($1);
		free($3);
	}
	|
	ID SUM_ASSIGN NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp(get<0>(obtener_tupla_por_id($1)), "char"))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s + %d`\n",$1,$1,$3);

		free($1);
	}
	|
	ID SUB_ASSIGN ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp(get<0>(obtener_tupla_por_id($1)),get<0>(obtener_tupla_por_id($3))))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variables ->"<<$1<< " "<< $3<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s - $%s`\n",$1,$1,$3);


		free($1);
		free($3);
	}
	|
	ID SUB_ASSIGN NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp(get<0>(obtener_tupla_por_id($1)), "char"))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s - %d`\n",$1,$1,$3);


		free($1);
	}
	|
	ID MUL_ASSIGN ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp(get<0>(obtener_tupla_por_id($1)),get<0>(obtener_tupla_por_id($3))))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variables ->"<<$1<< " "<< $3<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s \\* $%s`\n",$1,$1,$3);


		free($1);
		free($3);
	}
	|
	ID MUL_ASSIGN NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp(get<0>(obtener_tupla_por_id($1)), "char"))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s \\* %d`\n",$1,$1,$3);

		free($1);
	}
	|
	ID IGUAL suma PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			fprintf(yysalida, "%s=`expr %s%s%s%s%s`\n", $1, dolarasig, varasig, varasigop, dolarasig, varasig2);

			varasig = (char*) "";
			varasigop = (char*) "";
			varasig2 = (char*) "";
			dolarasig = (char *) "";
		}

		free($1);
	}
	|
	ID IGUAL resta PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			fprintf(yysalida, "%s=`expr %s%s%s%s%s`\n", $1, dolarasig, varasig, varasigop, dolarasig, varasig2);

			varasig = (char*) "";
			varasigop = (char*) "";
			varasig2 = (char*) "";
			dolarasig = (char *) "";
		}

		free($1);
	}
	|
	ID IGUAL multi PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			fprintf(yysalida, "%s=`expr %s%s%s%s%s`\n", $1, dolarasig, varasig, varasigop, dolarasig, varasig2);

			varasig = (char*) "";
			varasigop = (char*) "";
			varasig2 = (char*) "";
			dolarasig = (char *) "";
		}

		free($1);
	}
	|
	ID IGUAL div PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			fprintf(yysalida, "%s=`expr %s%s%s%s%s`\n", $1, dolarasig, varasig, varasigop, dolarasig, varasig2);

			varasig = (char*) "";
			varasigop = (char*) "";
			varasig2 = (char*) "";
			dolarasig = (char *) "";
		}
		free($1);
	}
	|
	ID IGUAL ID PORCENTAJE ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($5))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$5<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s %% $%s`\n",$1,$3,$5);

		free($1);
		free($3);
		free($5);
	}
	|
	ID IGUAL ID PORCENTAJE NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s %% %d`\n",$1,$3,$5);

		free($1);
		free($3);
	}
	|
	ID IGUAL NUM PORCENTAJE ID PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($5))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$5<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr %d %% $%s`\n",$1,$3,$5);

		free($1);
		free($5);
	}
	|
	ID IGUAL NUM PORCENTAJE NUM PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr %d %% %d`\n",$1,$3,$5);

		free($1);
	}
	|
	ID INC PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s + 1`\n",$1,$1);

		free($1);
	}
	|
	ID DEC PTOCOMA
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s - 1`\n",$1,$1);

		free($1);
	}
	|
	INC ID PTOCOMA
	{
		if(!esta_tabla_sim($2))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s + 1`\n",$2,$2);

		free($2);
	}
	|
	DEC ID PTOCOMA
	{
		if(!esta_tabla_sim($2))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$2<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s - 1`\n",$2,$2);

		free($2);
	}
	;

suma:
	suma SUMA ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			varasigop = (char *)" + ";
			dolarasig = (char *)"$";
			varasig2 = strdup($3);
		}

		free($3);
	}
	|
	suma SUMA NUM
	|
	ID SUMA ID
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup($1);
			varasigop = (char *)" + ";
			varasig2 = strdup($3);
		}

		free($1);
		free($3);
	}
	|
	NUM SUMA NUM
	|
	ID SUMA NUM
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup($1);
			varasigop = (char *)" + ";
      string s = to_string($3);
      char const* var1= s.c_str();
			varasig2 = (char *)var1;
		}

		free($1);
	}
	|
	NUM SUMA ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			string s = to_string($1);
			char const* var1= s.c_str();
			varasig = (char *)var1;
			varasigop = (char *)" + ";
			dolarasig = (char *)"$";
			varasig2 = strdup($3);
		}

		free($3);
	}
	;

resta:
	resta MENOS ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			varasigop = (char *)" - ";
			dolarasig = (char *)"$";
			varasig2 = strdup($3);
		}

		free($3);
	}
	|
	resta MENOS NUM
	|
	ID MENOS ID
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup($1);
			varasigop = (char *)" - ";
			varasig2 = strdup($3);
		}

		free($1);
		free($3);
	}
	|
	NUM MENOS NUM
	|
	ID MENOS NUM
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup($1);
			varasigop = (char *)" - ";
      string s = to_string($3);
      char const* var1= s.c_str();
			varasig2 = (char *)var1;
		}

		free($1);
	}
	|
	NUM MENOS ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			string s = to_string($1);
			char const* var1= s.c_str();
			varasig = (char *)var1;
			varasigop = (char *)" - ";
			dolarasig = (char *)"$";
			varasig2 = strdup($3);
		}

		free($3);
	}
	;

multi:
	multi MULTI ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			varasigop = (char *)" \\* ";
			dolarasig = (char *)"$";
			varasig2 = strdup($3);
		}

		free($3);
	}
	|
	multi MULTI NUM
	|
	ID MULTI ID
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup($1);
			varasigop = (char *)" \\* ";
			varasig2 = strdup($3);
		}

		free($1);
		free($3);
	}
	|
	NUM MULTI NUM
	|
	ID MULTI NUM
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup($1);
			varasigop = (char *)" \\* ";
      string s = to_string($3);
      char const* var1= s.c_str();
			varasig2 = (char *)var1;
		}

		free($1);
	}
	|
	NUM MULTI ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			string s = to_string($1);
			char const* var1= s.c_str();
			varasig = (char *)var1;
			varasigop = (char *)" \\* ";
			dolarasig = (char *)"$";
			varasig2 = strdup($3);
		}

		free($3);
	}
	;

div:
	div DIV ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			varasigop = (char *)" / ";
			dolarasig = (char *)"$";
			varasig2 = strdup($3);
		}

		free($3);
	}
	|
	div DIV NUM
	|
	ID DIV ID
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup($1);
			varasigop = (char *)" / ";
			varasig2 = strdup($3);
		}

		free($1);
		free($3);
	}
	|
	NUM DIV NUM
	|
	ID DIV NUM
	{
		if(!esta_tabla_sim($1))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$1<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup($1);
			varasigop = (char *)" / ";
      string s = to_string($3);
      char const* var1= s.c_str();
			varasig2 = (char *)var1;
		}

		free($1);
	}
	|
	NUM DIV ID
	{
		if(!esta_tabla_sim($3))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<$3<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			string s = to_string($1);
			char const* var1= s.c_str();
			varasig = (char *)var1;
			varasigop = (char *)" / ";
			dolarasig = (char *)"$";
			varasig2 = strdup($3);
		}

		free($3);
	}
	;

%%

void agregar_ambito()
{
	vector<tuple<char *, char *> > lista_ambito;
	tabla_sim.emplace_back(lista_ambito);
}

void eliminar_ambito()
{
	vector<vector<tuple<char *,char *> > >::iterator it;
	vector<tuple<char *, char *> >::iterator it2;

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
	vector<vector<tuple<char *, char *> > >::iterator it;
	vector<tuple<char *, char *> >::iterator it2;

	it = tabla_sim.end();
	it--;
	it2 = (*it).begin();

	for(it2; it2!=(*it).end(); it2++)
	{
		//cout<<get<1>(*it2)<<" es igual a : "<<id<<endl;
		if(!strcmp(get<1>(*it2),id))
		{
			return true;
		}
	}

	return false;
}

tupla obtener_tupla_por_id(char *id)
{
	vector<vector<tuple<char *, char *> > >::iterator it;
	vector<tuple<char *, char *> >::iterator it2;

	it = tabla_sim.end();
	it--;
	it2 = (*it).begin();

	for(it2; it2!=(*it).end(); it2++)
	{
		if(!strcmp(get<1>(*it2),id))
			return *it2;
	}

}

void imprimir_tabla_sim()
{
	vector<vector<tuple<char *, char *> > >::iterator it;
	vector<tuple<char *, char *> >::iterator it2;
	int i = 0;

	it = tabla_sim.end();
	it--;


	for(i; i < tabla_sim.size(); i++)
	{
		cout<<"\nEn lista "<<i<<": ";
		it2 = (*it).begin();

		for(it2; it2 != (*it).end(); it2++)
		{
			cout<<"<"<<get<0>(*it2)<< "," <<get<1>(*it2)<<">";
		}
		it--;
	}
	cout<<endl;
}


bool insertar_tabla_sim(tuple<char *, char *> const & tup)
{
	vector<vector<tuple<char *, char *> > >::iterator it;

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
	vector<vector<tuple<char *, char *> > >::iterator it;
	vector<tuple<char *, char *> >::iterator it2;

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

	yysalida = fopen("salida.sh", "w");
	yyin = archivo;

	cargar_reservada();
	cargar_reservada_tipo();
	agregar_ambito();

	yyparse();

	eliminar_reservada();
	eliminar_reservada_tipo();

	fclose(yyin);
	fclose(yysalida);

	return 0;
}
