%option noyywrap

%{
	#include <iostream>
	#include <cstdio>
	#include <list>
	#include <cctype>
	#include <cstring>
  #include <string>
	#include <cstdlib>

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

LETRA [a-zA-Z_]
DIGITO [0-9]

%%

{LETRA}({LETRA}|{DIGITO})* {

										if(esta_reservada_tipo(yytext))
											cout<<"tipo:"<<yytext<<endl;
										else if(esta_reservada(yytext))
											cout<<"reservada:"<<yytext<<endl;
                    else
										  cout<<"ID"<<endl;
				}


(-)?{DIGITO}+     { cout<<"constante3"<<endl; }
(-)?{DIGITO}*"."{DIGITO}+ { cout<<"constante6"<<endl; }

"."       	{cout<<"punto"<<endl;}
";"					{cout<<"ptcoma"<<endl;}
"{"					{cout<<"llaveabr"<<endl;}
"}"					{cout<<"llavecerr"<<endl;}
"("					{cout<<"parentesis abriendo"<<endl;}
")"					{cout<<"parentesis cerrando"<<endl;}
"<"					{cout<<"corchete angular abriendo"<<endl;}
">"					{cout<<"corchete angular cerrando"<<endl;}
"!"					{cout<<"exclamancion"<<endl;}
"="					{cout<<"igual"<<endl;}
"+"					{cout<<"suma"<<endl;}
"-"					{cout<<"menos"<<endl;}
"*"					{cout<<"multi"<<endl;}
"/"					{cout<<"division"<<endl;}
"^"					{cout<<"poten"<<endl;}
":"					{cout<<"dosptos"<<endl;}
"#"					{cout<<"numeral"<<endl;}
"&"					{cout<<"ampersand"<<endl;}
"<="				{cout<<"MENOR_I"<<endl;;}
">="				{cout<<"MAYOR_I"<<endl;}
"!="				{cout<<"DIST"<<endl;}
"||"				{cout<<"OR"<<endl;;}
"&&"				{cout<<"AND"<<endl;}
"\%"				{cout<<"porcentaje"<<endl;}
","					{cout<<"coma"<<endl;}
"\'"				{cout<<"COMISIMPLE"<<endl;}
"\""				{
							if(com == 0 )
							{
								com = -1;
								cout<<"COMILLAS"<<endl;
							}else
							{
							com = 1;
							yyless(0);
							BEGIN(secomillas);
						}}


[ \t]				{ }
"\n" 				{lineas++;}

"/*"  {BEGIN(comentario);}
			<comentario>"*/"	{BEGIN(INITIAL);}
			<comentario>[\n\t]	{lineas++;}
			<comentario>.	{ }

"//"	{BEGIN(comentariosimple);}
			<comentariosimple>"\n"	{lineas++; BEGIN(INITIAL);}
			<comentariosimple>.	{ }

			<secomillas>"\"" {if(com == 1)
												{
													com = 0;
													cout<<"COMILLAS"<<endl;
												}
												else{
													yyless(0);
													BEGIN(INITIAL);
													}}
				<secomillas>"\%"[dfc] {cout<<"PRCVAL"<<endl;}
				<secomillas>[A-Za-z0-9.-_, ]+ {cout<<"TEXTO"<<endl;}


.			{cout<<"Error Lexico en la linea:"<<lineas<<endl;}

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

bool esta_reservada_tipo(char *rt)
{
	list<char *>::iterator it = reservada_tipo.begin();

	for(it; it != reservada_tipo.end(); it++)
		if(!strcmp(rt,*it))
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
	int pos = 0;

	for(it; it != reservada.end(); it++)
	{
			if(strcmp(r, *it))
				return pos;

			pos++;
	}
	return 0;
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

int main(int argc, char** argv){
	if(argc != 2){
		cout<< "ERROR: argumentos invalidos"<<endl;
		return -1;
	}

	FILE *archivo = fopen(argv[1], "r");

	if(!archivo){
		cout<< "ERROR: no se pudo abrir el arhivo"<<endl;
		return -1;
	}
  cargar_reservada();
  cargar_reservada_tipo();
	yyin = archivo;
	yylex();
}
