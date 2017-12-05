%option noyywrap

%{
	#include <iostream>
	#include <cstdio>
	#include <list>
	#include <cctype>
	#include <cstring>
  #include <string>
	#include <cstdlib>
	#include "parser.tab.h"

	using namespace std;

	int lineas = 1;
	int com = -1;
	list<char *> reservada_tipo;
	list<char *> reservada;

	void cargar_reservada_tipo();
	bool esta_reservada_tipo(char *rt);
	void imprimir_reservada_tipo();
	void eliminar_reservada_tipo();

	void cargar_reservada();
	bool esta_reservada(char *r);
	int posicion_reservada(char *r);
	void imprimir_reservada();
	void eliminar_reservada();

%}

%x comentario
%x comentariosimple
%x secomillas

DIGITO	[0-9]
NUMERO	{DIGITO}+

%%

[a-zA-Z_][a-zA-Z_0-9]*	{

										yylval.strval=strdup(yytext);

										if(esta_reservada_tipo(yytext))
											return TIPO;

										else if(esta_reservada(yytext))
										{
											return RESERVADA;
										}
										else
											return ID;
				}

{NUMERO}		{yylval.ival=atoi(yytext); return NUM;}

"."       	{return PUNTO;}
";"					{return PTOCOMA;}
"{"					{return LLAVEABR;}
"}"					{return LLAVECERR;}
"("					{return PARENTESISABR;}
")"					{return PARENTESISCERR;}
"<"					{return MENOR;}
">"					{return MAYOR;}
"!"					{return EXCL;}
"="					{return IGUAL;}
"+"					{return SUMA;}
"-"					{return MENOS;}
"*"					{return MULTI;}
"/"					{return DIV;}
"^"					{return POTEN;}
":"					{return DOSPTOS;}
"#"					{return NUMERAL;}
"&"					{return AMPERSAND;}
"<="				{return MENOR_I;}
">="				{return MAYOR_I;}
"!="				{return DIST;}
"||"				{return OR;}
"&&"				{return AND;}
"\%"				{return PORCENTAJE;}
","					{return COMA;}
"\'"				{return COMISIMPLE;}
"\""					{
							if(com ==0 )
							{
								com = -1;
								return COMILLAS;
							}
							com = 1;
							yyless(0);
							BEGIN(secomillas);
						}

[ \t]				{}
"\n" 				{lineas++;}

"/*"  {BEGIN(comentario);}
			<comentario>"*/"	{BEGIN(INITIAL);}
			<comentario>"\n"	{lineas++;}
			<comentario>.	{}

"//"	{BEGIN(comentariosimple);}
			<comentariosimple>"\n"	{lineas++; BEGIN(INITIAL);}
			<comentariosimple>.	{}

			<secomillas>"\"" {if(com == 1)
												{
													com = 0;
													return COMILLAS;
												}
												else{
													yyless(0);
													BEGIN(INITIAL);
													}}
				<secomillas>[A-Za-z0-9.-_, ]+ {yylval.strval=strdup(yytext); return TEXTO;}
				<secomillas>"%"[dfc] {yylval.strval=strdup(yytext); return PRCVAL;}
.

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

bool esta_reservada_tipo(char *r)
{
	list<char *>::iterator it = reservada_tipo.begin();

	for(it; it != reservada_tipo.end(); it++)
		if(!strcmp(r,*it))
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

	char *r3 = (char *)malloc(strlen("scanf"));
	strcpy(r3,"scanf");
	reservada.push_back(r3);

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

bool esta_reservada(char *r)
{
	list<char *>::iterator it = reservada.begin();

	for(it; it != reservada.end(); it++)
		if(!strcmp(r,*it))
			return true;

	return false;
}

int posicion_reservada(char *r)
{
	list<char *>::iterator it = reservada.begin();
	int pos = 257;

	for(it; it != reservada.end(); it++)
	{
			if(strcmp(r, *it))
				return pos;

			pos++;
	}
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
