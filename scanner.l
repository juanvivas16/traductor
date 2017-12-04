%option noyywrap

%{
	#include <iostream>
	#include <cstdio>
	#include <list>
	#include "parser.tab.h"

	using namespace std;

	int lineas = 1;
	list<char *> reservada_tipo;
	list<char *> reservada();

	void cargar_reservada_tipo();
	bool esta_reservada_tipo(char *f);
	void imprimir_reservada_tipo();
	void eliminar_reservada_tipo();

	void cargar_reservada();
	bool esta_reservada(char *f);
	void imprimir_reservada();
	void eliminar_reservada();

%}

%x comentario
%x comentariosimple

DIGITO	[0-9]
NUMERO	{DIGITO}+

%%

"/*"  {BEGIN(comentario);}
			<comentario>"*/"	{BEGIN(INITIAL);}
			<comentario>"\n"	{lineas++;}
			<comentario>.	{}

"//"	{BEGIN(comentariosimple);}
			<comentariosimple>"\n"	{lineas++; BEGIN(INITIAL);}
			<comentariosimple>.	{}

[a-zA-Z_][a-zA-Z_0-9]*	{

										yylval.strval=strdup(yytext);

										if(esta_reservada_tipo(yytext))
											return TIPO;
										else if(esta_reservada(yytext))
											return RESERVADA;

										return ID;
				}

{NUMERO}		{cout<<"Numero"<<endl; yylval.ival=atoi(yytext); return NUM;}

"."       	{cout<<"punto"<<endl; return PUNTO;}
";"					{cout<<"ptcoma"<<endl; return PTOCOMA;}
"{"					{cout<<"llaveabr"<<endl; return LLAVEABR;}
"}"					{cout<<"llavecerr"<<endl; return LLAVECERR;}
"("					{cout<<"parentesis abriendo"<<endl; return PARENTESISABR;}
")"					{cout<<"parentesis cerrando"<<endl; return PARENTESISCERR;}
"<"					{cout<<"corchete angular abriendo"<<endl; return CORAABR;}
">"					{cout<<"corchete angular cerrando"<<endl; return CORACERR;}
"!"					{cout<<"exclamancion"<<endl; return EXCL;}
"="					{cout<<"igual"<<endl; return IGUAL;}
"+"					{cout<<"suma"<<endl; return SUMA;}
"-"					{cout<<"menos"<<endl; return MENOS;}
"*"					{cout<<"multi"<<endl; return MULTI;}
"/"					{cout<<"division"<<endl; return DIV;}
"^"					{cout<<"poten"<<endl; return POTEN;}
":"					{cout<<"dosptos"<<endl; return DOSPTOS;}
"#"					{cout<<"numeral"<<endl; return NUMERAL;}
"&"					{cout<<"ampersand"<<endl; return AMPERSAND;}
\" 				  {cout<<"comillas"<<endl; return COMILLAS;}
\%				  {cout<<"porcentaje"<<endl; return PORCENTAJE;}
","					{cout<<"coma"<<endl; return COMA;}
[ \t]				{}
"\n" 				lineas++;
.						{cout<<"Error Lexico en la linea:"<<lineas<<endl;}

%%

void cargar_reservada_tipo()
{
	char *rt1 = (char *)malloc(strlen("int"));
	strcpy(rt1,"int");
	reservada_tipo.push_back(rt1);

	char *rt2 = (char *)malloc(strlen("float"));
	strcpy(rt2,"float");
	reservada_tipo.push_back(rt2);

	char *rt3 = (char *)malloc(strlen("char"));
	strcpy(rt3,"char");
	reservada_tipo.push_back(rt3);
}

bool esta_reservada_tipo(char *f)
{
	list<char *>::iterator it = reservada_tipo.begin();

	for(it; it != reservada_tipo.end(); it++)
		if(!strcmp(f,*it))
			return true;

	return false;
}

void imprimir_reservada_tipo()
{
	list<char *>::iterator it = reservada_tipo.begin();

	for(it; it != reservada_tipo.end(); it++)
		cout<<*it<<endl;
}

void eliminar_reservada_tipo()
{
	list<char *>::iterator it = reservada_tipo.begin();

	for(it; it != reservada_tipo.end(); it++)
		free(*it);
}

void cargar_reservada()
{
	char *r1 = (char *)malloc(strlen("include"));
	strcpy(r1,"include");
	reservada.push_back(r1);

	char *r2 = (char *)malloc(strlen("printf"));
	strcpy(r2,"printf");
	reservada.push_back(r2);

	char *r4 = (char *)malloc(strlen("main"));
	strcpy(r4,"main");
	reservada.push_back(r4);

	char *r5 = (char *)malloc(strlen("return"));
	strcpy(r5,"return");
	reservada.push_back(r5);

	char *r6 = (char *)malloc(strlen("if"));
	strcpy(r6,"if");
	reservada.push_back(r6);

	char *r7 = (char *)malloc(strlen("else"));
	strcpy(r7,"else");
	reservada.push_back(r7);

	char *r8 = (char *)malloc(strlen("do"));
	strcpy(r8,"do");
	reservada.push_back(r8);

	char *r9 = (char *)malloc(strlen("while"));
	strcpy(r9,"while");
	reservada.push_back(r9);

	char *r10 = (char *)malloc(strlen("for"));
	strcpy(r10,"for");
	reservada.push_back(r10);
}

bool esta_reservada(char *f)
{
	list<char *>::iterator it = reservada.begin();

	for(it; it != reservada.end(); it++)
		if(!strcmp(f,*it))
			return true;

	return false;
}

void imprimir_reservada()
{
	list<char *>::iterator it = reservada.begin();

	for(it; it != reservada.end(); it++)
		cout<<*it<<endl;
}


void eliminar_reservada()
{
	list<char *>::iterator it = reservada.begin();

	for(it; it != reservada.end(); it++)
		free(*it);
}
