/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TIPO = 258,
    RESERVADA = 259,
    ID = 260,
    NUM = 261,
    PUNTO = 262,
    PTOCOMA = 263,
    LLAVEABR = 264,
    LLAVECERR = 265,
    PARENTESISABR = 266,
    PARENTESISCERR = 267,
    MENOR = 268,
    MAYOR = 269,
    EXCL = 270,
    IGUAL = 271,
    SUMA = 272,
    MENOS = 273,
    MULTI = 274,
    DIV = 275,
    POTEN = 276,
    DOSPTOS = 277,
    NUMERAL = 278,
    AMPERSAND = 279,
    MENOR_I = 280,
    MAYOR_I = 281,
    DIST = 282,
    SUM_ASSIGN = 283,
    SUB_ASSIGN = 284,
    MUL_ASSIGN = 285,
    DIV_ASSIGN = 286,
    MOD_ASSIGN = 287,
    IGUALD = 288,
    OR = 289,
    AND = 290,
    INC = 291,
    DEC = 292,
    PORCENTAJE = 293,
    COMA = 294,
    COMISIMPLE = 295,
    COMILLAS = 296,
    PRCVAL = 297,
    TEXTO = 298
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 62 "parser.y" /* yacc.c:1909  */

	char *strval;
	int	ival;

#line 103 "parser.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
