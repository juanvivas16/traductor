/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "parser.y" /* yacc.c:339  */

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
	vector<vector<tupla>> tabla_sim;
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
	bool esta_tabla_sim(char *);
	tupla obtener_tupla_por_id(char *);
	void imprimir_tabla_sim();
	bool insertar_tabla_sim(tupla const & );
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


#line 126 "parser.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "parser.tab.h".  */
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
#line 62 "parser.y" /* yacc.c:355  */

	char *strval;
	int	ival;

#line 215 "parser.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 232 "parser.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  9
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   301

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  44
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  19
/* YYNRULES -- Number of rules.  */
#define YYNRULES  110
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  263

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   298

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   122,   122,   132,   132,   134,   138,   148,   158,   168,
     179,   189,   201,   213,   215,   217,   219,   221,   223,   225,
     227,   229,   231,   233,   235,   237,   249,   261,   263,   265,
     278,   291,   295,   300,   309,   357,   395,   409,   446,   483,
     520,   557,   620,   657,   684,   706,   728,   755,   782,   810,
     837,   859,   881,   903,   925,   947,   969,   991,  1015,  1025,
    1041,  1051,  1069,  1093,  1123,  1153,  1183,  1222,  1250,  1271,
    1299,  1320,  1349,  1371,  1400,  1421,  1443,  1464,  1485,  1505,
    1534,  1556,  1578,  1593,  1608,  1623,  1638,  1655,  1674,  1676,
    1703,  1705,  1727,  1751,  1770,  1772,  1799,  1801,  1822,  1846,
    1865,  1867,  1893,  1895,  1916,  1939,  1958,  1960,  1986,  1988,
    2009
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "TIPO", "RESERVADA", "ID", "NUM",
  "PUNTO", "PTOCOMA", "LLAVEABR", "LLAVECERR", "PARENTESISABR",
  "PARENTESISCERR", "MENOR", "MAYOR", "EXCL", "IGUAL", "SUMA", "MENOS",
  "MULTI", "DIV", "POTEN", "DOSPTOS", "NUMERAL", "AMPERSAND", "MENOR_I",
  "MAYOR_I", "DIST", "SUM_ASSIGN", "SUB_ASSIGN", "MUL_ASSIGN",
  "DIV_ASSIGN", "MOD_ASSIGN", "IGUALD", "OR", "AND", "INC", "DEC",
  "PORCENTAJE", "COMA", "COMISIMPLE", "COMILLAS", "PRCVAL", "TEXTO",
  "$accept", "programa", "codigo", "$@1", "cabecera", "principal",
  "cuerpo", "finestructura", "estructura", "scan", "print", "condicional",
  "retornar", "declaracion", "asignacion", "suma", "resta", "multi", "div", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298
};
# endif

#define YYPACT_NINF -151

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-151)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      45,     7,    52,    73,  -151,    67,  -151,    92,    -3,  -151,
     101,   116,   104,   129,   100,     5,  -151,   193,   121,   163,
     140,   160,    62,   178,  -151,  -151,   126,   165,   192,    17,
      84,   200,   202,   198,    38,    62,    62,    62,    62,    62,
     196,   204,  -151,  -151,    41,    81,   203,    55,    -2,  -151,
      64,   136,   142,   144,   205,   206,   207,   208,  -151,    62,
    -151,  -151,  -151,  -151,  -151,  -151,  -151,   209,  -151,     0,
    -151,  -151,    62,   210,    82,   111,   109,   212,    63,    68,
      76,     1,    53,     4,   211,   213,   214,   217,   218,   219,
    -151,  -151,  -151,  -151,    69,  -151,   220,   221,   148,   222,
      62,   223,   150,   152,   154,   156,   158,   225,   229,   230,
     231,   232,   233,    61,   124,  -151,  -151,   162,   164,   166,
     168,   170,  -151,   172,   174,   176,   180,   182,  -151,   184,
    -151,   186,  -151,   188,  -151,   190,  -151,  -151,  -151,  -151,
    -151,  -151,  -151,  -151,    62,  -151,  -151,   177,   199,   226,
    -151,    26,  -151,  -151,  -151,  -151,  -151,  -151,  -151,  -151,
    -151,  -151,  -151,  -151,  -151,  -151,  -151,  -151,  -151,   173,
     157,   228,    88,  -151,  -151,  -151,  -151,  -151,  -151,  -151,
    -151,   234,   235,  -151,  -151,  -151,  -151,  -151,  -151,  -151,
    -151,   236,   237,  -151,  -151,  -151,  -151,  -151,  -151,  -151,
    -151,  -151,   238,   239,   240,    69,    62,     3,   179,    89,
     241,   215,   216,  -151,  -151,  -151,  -151,  -151,  -151,   195,
    -151,  -151,   243,   245,   247,   224,   227,  -151,   248,   242,
      19,   113,   250,   244,   249,   254,   246,   252,   255,  -151,
     257,   258,   251,   253,   259,   256,  -151,  -151,   265,   266,
    -151,   264,   261,   260,  -151,   267,   269,  -151,   262,   271,
     268,   270,  -151
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     2,     3,     5,     0,     0,     1,
       0,     0,     0,     0,     0,     0,     4,     0,     0,     0,
       0,     0,     0,     0,     7,     9,     0,     0,     0,     0,
       0,     0,     0,     0,    24,    20,    22,    18,    16,    14,
       0,     0,     6,     8,     0,     0,     0,     0,     0,    31,
       0,     0,     0,     0,     0,     0,     0,     0,    12,     0,
      23,    19,    21,    17,    15,    13,    11,     0,    62,     0,
      59,    58,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      83,    84,    85,    86,     0,    10,     0,     0,     0,     0,
      30,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,    67,     0,     0,     0,
       0,     0,    68,     0,     0,     0,     0,     0,    75,     0,
      76,     0,    77,     0,    78,     0,    69,    70,    71,    72,
      73,    74,    33,    32,    28,    66,    63,     0,     0,     0,
      29,     0,    61,    48,    56,    46,    54,    49,    57,    47,
      55,    43,    45,    60,    52,    50,    53,    51,    44,     0,
       0,     0,     0,    89,    91,    95,    97,   101,   103,   107,
     109,     0,     0,    92,    90,    98,    96,   104,   102,   110,
     108,     0,     0,    87,    88,    93,    94,    99,   100,   105,
     106,    27,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,    80,    81,    82,    64,    65,     0,
      26,    25,     0,     0,     0,     0,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       0,     0,     0,     0,     0,     0,    35,    38,     0,     0,
      39,     0,     0,     0,    37,     0,     0,    41,     0,     0,
       0,     0,    42
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -151,  -151,  -151,  -151,  -151,   272,   -22,  -150,   -98,  -151,
    -151,  -151,  -151,  -151,  -151,  -151,  -151,  -151,  -151
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,     4,    11,     5,     6,    60,   144,    34,    35,
      36,    77,    37,    38,    39,    80,    81,    82,    83
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint16 yytable[] =
{
      33,   206,   151,    74,    75,    96,    97,    49,   222,   130,
      13,     7,   134,    61,    62,    63,    64,    65,    20,   131,
      28,    29,    45,    46,   135,    73,    47,   223,    48,    28,
      29,    30,   102,   103,   142,    59,   143,    94,    14,    76,
      98,    28,    29,    30,   104,   105,    21,    59,     1,    68,
      99,   205,   106,    31,    32,   220,     8,    69,    28,    29,
      30,   132,    31,    32,    72,    28,    29,    30,     2,    78,
      79,   116,   133,     9,    31,    32,   122,   142,   150,   143,
     117,   118,   119,   120,   128,   123,   124,   125,   126,    70,
      10,    31,    32,   129,   101,   102,   103,    50,    31,    32,
      50,   121,   169,    12,   170,    15,   127,   104,   105,    51,
      52,    53,    51,    52,    53,   106,    17,    54,    55,     1,
      54,    55,   201,   107,   108,   109,   108,   109,    23,   211,
     225,   212,   226,    41,    18,    24,   110,   111,   110,   111,
      42,    84,    85,    19,   112,    26,   112,    86,    87,    88,
      89,   113,   114,   147,   148,   153,   154,   155,   156,   157,
     158,   159,   160,   161,   162,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   181,   182,   183,   184,   185,
     186,   187,   188,    40,   221,   189,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,   200,    44,   208,   209,
     230,   231,    22,    27,    25,    56,    43,    57,    58,    67,
      66,    71,   207,    90,    91,    92,    93,   202,   224,   136,
     100,   137,   138,    95,   115,   139,   140,   141,   145,   146,
     204,   152,   149,   163,   164,   165,   166,   167,   168,   203,
     210,     0,   213,   214,   215,   216,   217,   218,     0,   227,
     233,   219,   234,   237,   228,   232,   240,   229,   239,   242,
     245,   241,     0,   235,   244,   246,   247,   250,   251,   236,
     252,   253,   254,   255,   258,   257,   260,     0,   262,     0,
     261,   238,     0,    16,     0,     0,     0,   243,     0,     0,
     248,     0,   249,     0,     0,     0,     0,     0,     0,   256,
       0,   259
};

static const yytype_int16 yycheck[] =
{
      22,   151,   100,     5,     6,     5,     6,    29,     5,     8,
      13,     4,     8,    35,    36,    37,    38,    39,    13,    18,
       3,     4,     5,     6,    20,    47,     9,    24,    11,     3,
       4,     5,    13,    14,     8,     9,    10,    59,    41,    41,
      40,     3,     4,     5,    25,    26,    41,     9,     3,     8,
      72,   149,    33,    36,    37,   205,     4,    16,     3,     4,
       5,     8,    36,    37,     9,     3,     4,     5,    23,     5,
       6,     8,    19,     0,    36,    37,     8,     8,   100,    10,
      17,    18,    19,    20,     8,    17,    18,    19,    20,     8,
      23,    36,    37,    17,    12,    13,    14,    16,    36,    37,
      16,    38,    41,    11,    43,     4,    38,    25,    26,    28,
      29,    30,    28,    29,    30,    33,    12,    36,    37,     3,
      36,    37,   144,    12,    13,    14,    13,    14,     7,    41,
      41,    43,    43,     7,     5,    14,    25,    26,    25,    26,
      14,     5,     6,    43,    33,     5,    33,     5,     6,     5,
       6,    42,    43,     5,     6,     5,     6,     5,     6,     5,
       6,     5,     6,     5,     6,    41,    42,     5,     6,     5,
       6,     5,     6,     5,     6,     5,     6,     5,     6,     5,
       6,     5,     6,     5,   206,     5,     6,     5,     6,     5,
       6,     5,     6,     5,     6,     5,     6,     5,    41,    42,
       5,     6,     9,    43,    41,     5,    41,     5,    10,     5,
      14,     8,    39,     8,     8,     8,     8,    40,    39,     8,
      10,     8,     8,    14,    12,     8,     8,     8,     8,     8,
       4,     8,    10,     8,     5,     5,     5,     5,     5,    40,
      12,    -1,     8,     8,     8,     8,     8,     8,    -1,     8,
       5,    11,     5,     5,    39,    12,    12,    41,     8,     5,
       5,    12,    -1,    39,    12,     8,     8,     8,    12,    42,
       5,     5,     8,    12,     5,     8,     5,    -1,     8,    -1,
      12,    39,    -1,    11,    -1,    -1,    -1,    41,    -1,    -1,
      39,    -1,    39,    -1,    -1,    -1,    -1,    -1,    -1,    39,
      -1,    39
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,    23,    45,    46,    48,    49,     4,     4,     0,
      23,    47,    11,    13,    41,     4,    49,    12,     5,    43,
      13,    41,     9,     7,    14,    41,     5,    43,     3,     4,
       5,    36,    37,    50,    52,    53,    54,    56,    57,    58,
       5,     7,    14,    41,     5,     5,     6,     9,    11,    50,
      16,    28,    29,    30,    36,    37,     5,     5,    10,     9,
      50,    50,    50,    50,    50,    50,    14,     5,     8,    16,
       8,     8,     9,    50,     5,     6,    41,    55,     5,     6,
      59,    60,    61,    62,     5,     6,     5,     6,     5,     6,
       8,     8,     8,     8,    50,    14,     5,     6,    40,    50,
      10,    12,    13,    14,    25,    26,    33,    12,    13,    14,
      25,    26,    33,    42,    43,    12,     8,    17,    18,    19,
      20,    38,     8,    17,    18,    19,    20,    38,     8,    17,
       8,    18,     8,    19,     8,    20,     8,     8,     8,     8,
       8,     8,     8,    10,    51,     8,     8,     5,     6,    10,
      50,    52,     8,     5,     6,     5,     6,     5,     6,     5,
       6,     5,     6,     8,     5,     5,     5,     5,     5,    41,
      43,    41,    42,     5,     6,     5,     6,     5,     6,     5,
       6,     5,     6,     5,     6,     5,     6,     5,     6,     5,
       6,     5,     6,     5,     6,     5,     6,     5,     6,     5,
       6,    50,    40,    40,     4,    52,    51,    39,    41,    42,
      12,    41,    43,     8,     8,     8,     8,     8,     8,    11,
      51,    50,     5,    24,    39,    41,    43,     8,    39,    41,
       5,     6,    12,     5,     5,    39,    42,     5,    39,     8,
      12,    12,     5,    41,    12,     5,     8,     8,    39,    39,
       8,    12,     5,     5,     8,    12,    39,     8,     5,    39,
       5,    12,     8
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    44,    45,    47,    46,    46,    48,    48,    48,    48,
      48,    48,    49,    50,    50,    50,    50,    50,    50,    50,
      50,    50,    50,    50,    50,    50,    50,    50,    50,    50,
      50,    50,    51,    51,    52,    53,    54,    54,    54,    54,
      54,    54,    54,    55,    55,    55,    55,    55,    55,    55,
      55,    55,    55,    55,    55,    55,    55,    55,    56,    56,
      56,    56,    57,    57,    57,    57,    57,    58,    58,    58,
      58,    58,    58,    58,    58,    58,    58,    58,    58,    58,
      58,    58,    58,    58,    58,    58,    58,    59,    59,    59,
      59,    59,    59,    60,    60,    60,    60,    60,    60,    61,
      61,    61,    61,    61,    61,    62,    62,    62,    62,    62,
      62
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     0,     3,     1,     6,     5,     6,     5,
       8,     7,     7,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     7,     7,     5,     4,     5,
       4,     2,     1,     1,     4,    10,     7,    11,    10,    10,
       9,    13,    17,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       5,     5,     3,     5,     7,     7,     5,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     4,     4,     4,     6,
       6,     6,     6,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 123 "parser.y" /* yacc.c:1646  */
    {
		if(cantErrores > 0)
			cout<<endl<<endl<<"***ERROR: tipo - Semantico***"<<endl;
		else
			cout<<endl<<endl<<"Exito!"<<endl;
	}
#line 1491 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 132 "parser.y" /* yacc.c:1646  */
    {fprintf(yysalida, "#!/bin/bash\n");}
#line 1497 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 139 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-3].strval), "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free((yyvsp[-3].strval));
	}
#line 1510 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 149 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-3].strval), "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free((yyvsp[-3].strval));
	}
#line 1523 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 159 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-3].strval), "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free((yyvsp[-3].strval));
	}
#line 1536 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 169 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-3].strval), "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		free((yyvsp[-3].strval));
	}
#line 1550 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 180 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-5].strval), "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free((yyvsp[-5].strval));
	}
#line 1563 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 190 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-5].strval), "include"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free((yyvsp[-5].strval));
	}
#line 1576 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 202 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-5].strval), "main"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<". Quizo decir 'main'"<<endl;
			cantErrores++;
		}
		free((yyvsp[-5].strval));
	}
#line 1589 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 238 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-6].strval), "do"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		estrutura_op = (char *)strdup((yyvsp[-6].strval));
		free((yyvsp[-6].strval));
	}
#line 1604 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 250 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-6].strval), "do"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		estrutura_op = (char *)strdup((yyvsp[-6].strval));
		free((yyvsp[-6].strval));
	}
#line 1619 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 266 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-4].strval), "else"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(cantErrores == 0)
			fprintf(yysalida, "else");

		free((yyvsp[-4].strval));
	}
#line 1635 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 279 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-3].strval), "else"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(cantErrores == 0)
			fprintf(yysalida, "else");

		free((yyvsp[-3].strval));
	}
#line 1651 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 296 "parser.y" /* yacc.c:1646  */
    {
		fprintf(yysalida, "\nfi\n");
	}
#line 1659 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 301 "parser.y" /* yacc.c:1646  */
    {
		fprintf(yysalida, "\ndone\n");
	}
#line 1667 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 310 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-3].strval), "while") && strcmp((yyvsp[-3].strval), "if"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp((yyvsp[-3].strval), "while") && cantErrores == 0)
		{
			fprintf(yysalida, (yyvsp[-3].strval));
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
			estrutura_op = (char *)strdup((yyvsp[-3].strval));
		}
		else if(!strcmp((yyvsp[-3].strval), "if") && cantErrores == 0)
		{
			fprintf(yysalida, (yyvsp[-3].strval));
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
			estrutura_op = (char *)strdup((yyvsp[-3].strval));			
		}


		free((yyvsp[-3].strval));
	}
#line 1716 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 358 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-9].strval), "scanf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp((yyvsp[-6].strval),"%d")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "int")))
			{
			}
			else if(!(strcmp((yyvsp[-6].strval),"%c")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "char")))
			{
			}
			else if(!(strcmp((yyvsp[-6].strval),"%f")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
			fprintf(yysalida,"read %s\n", (yyvsp[-2].strval));

		free((yyvsp[-9].strval));
		free((yyvsp[-2].strval));
	}
#line 1755 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 396 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-6].strval), "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo %s\n", (yyvsp[-3].strval));

		free((yyvsp[-6].strval));
	}
#line 1772 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 410 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-10].strval), "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp((yyvsp[-6].strval),"%d")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "int")))
			{
			}
			else if(!(strcmp((yyvsp[-6].strval),"%c")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "char")))
			{
			}
			else if(!(strcmp((yyvsp[-6].strval),"%f")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo %s $%s %s\n",(yyvsp[-7].strval),(yyvsp[-2].strval),(yyvsp[-5].strval));

		free((yyvsp[-10].strval));
		free((yyvsp[-6].strval));
		free((yyvsp[-2].strval));
	}
#line 1812 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 447 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-9].strval), "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp((yyvsp[-6].strval),"%d")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "int")))
			{
			}
			else if(!(strcmp((yyvsp[-6].strval),"%c")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "char")))
			{
			}
			else if(!(strcmp((yyvsp[-6].strval),"%f")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO435 "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo $%s %s\n",(yyvsp[-2].strval),(yyvsp[-5].strval));

		free((yyvsp[-9].strval));
		free((yyvsp[-6].strval));
		free((yyvsp[-2].strval));
	}
#line 1852 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 484 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-9].strval), "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp((yyvsp[-5].strval),"%d")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "int")))
			{
			}
			else if(!(strcmp((yyvsp[-5].strval),"%c")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "char")))
			{
			}
			else if(!(strcmp((yyvsp[-5].strval),"%f")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo %s $%s\n",(yyvsp[-6].strval),(yyvsp[-2].strval));

		free((yyvsp[-9].strval));
		free((yyvsp[-5].strval));
		free((yyvsp[-2].strval));
	}
#line 1892 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 521 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-8].strval), "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp((yyvsp[-5].strval),"%d")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "int")))
			{
			}
			else if(!(strcmp((yyvsp[-5].strval),"%c")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "char")))
			{
			}
			else if(!(strcmp((yyvsp[-5].strval),"%f")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo $%s\n",(yyvsp[-2].strval));

		free((yyvsp[-8].strval));
		free((yyvsp[-5].strval));
		free((yyvsp[-2].strval));
	}
#line 1932 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 558 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-12].strval), "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-4].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-4].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else{
			if(!(strcmp((yyvsp[-9].strval),"%d")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-4].strval))), "int")) && !(strcmp((yyvsp[-7].strval),"%d")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "int")) )
			{
			}
			else if(!(strcmp((yyvsp[-9].strval),"%d")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-4].strval))), "int")) && !(strcmp((yyvsp[-7].strval),"%c")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "char")))
			{
			}
			else if(!(strcmp((yyvsp[-9].strval),"%d")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-4].strval))), "int")) && !(strcmp((yyvsp[-7].strval),"%f")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "float")))
			{
			}
			else if(!(strcmp((yyvsp[-9].strval),"%c")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-4].strval))), "char")) && !(strcmp((yyvsp[-7].strval),"%d")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "int")))
			{
			}
			else if(!(strcmp((yyvsp[-9].strval),"%c")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-4].strval))), "char")) && !(strcmp((yyvsp[-7].strval),"%c")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "char")))
			{
			}
			else if(!(strcmp((yyvsp[-9].strval),"%c")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-4].strval))), "char")) && !(strcmp((yyvsp[-7].strval),"%f")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "float")))
			{
			}
			else if(!(strcmp((yyvsp[-9].strval),"%f")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-4].strval))), "float")) && !(strcmp((yyvsp[-7].strval),"%d")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "int")))
			{
			}
			else if(!(strcmp((yyvsp[-9].strval),"%f")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-4].strval))), "float")) && !(strcmp((yyvsp[-7].strval),"%c")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "char")))
			{
			}
			else if(!(strcmp((yyvsp[-9].strval),"%f")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-4].strval))), "float")) && !(strcmp((yyvsp[-7].strval),"%f")) && !(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-2].strval))), "float")))
			{
			}
			else{
				cout<<endl<<"*ERROR: TIPO de dato INCORRECTO "<<"Linea: "<<lineas<<"*"<<endl;
				cantErrores++;
			}
		}

		if(cantErrores == 0)
		fprintf(yysalida, "echo $%s %s $%s\n",(yyvsp[-4].strval),(yyvsp[-8].strval),(yyvsp[-2].strval));

		free((yyvsp[-12].strval));
		free((yyvsp[-9].strval));
		free((yyvsp[-7].strval));
		free((yyvsp[-4].strval));
		free((yyvsp[-2].strval));
	}
#line 1998 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 621 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-16].strval), "printf"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-6].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-6].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-4].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-4].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida, "echo $%s %s $%s %s $%s\n",(yyvsp[-6].strval),(yyvsp[-12].strval),(yyvsp[-4].strval),(yyvsp[-10].strval),(yyvsp[-2].strval));

		free((yyvsp[-16].strval));
		free((yyvsp[-6].strval));
		free((yyvsp[-4].strval));
		free((yyvsp[-2].strval));
	}
#line 2036 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 658 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			////imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup((yyvsp[-2].strval));
			condi_3 = " -eq ";
			condi_4 = (char *)strdup((yyvsp[0].strval));
			condi_5 = " ]";
		}

		free((yyvsp[-2].strval));
		free((yyvsp[0].strval));
	}
#line 2066 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 685 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			string s = to_string((yyvsp[-2].ival));
      		char const* var= s.c_str();
			condi_2 = (char *)var;
			condi_3 = "-eq ";
			condi_4 = (char *)strdup((yyvsp[0].strval));
			condi_5 = " ]";
		}

		free((yyvsp[0].strval));
	}
#line 2091 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 707 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup((yyvsp[-2].strval));
			condi_3 = " -eq ";
			string s = to_string((yyvsp[0].ival));
      		char const* var= s.c_str();
			condi_4 = (char *)var;
			condi_5 = " ]";
		}

		free((yyvsp[-2].strval));
	}
#line 2116 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 729 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup((yyvsp[-2].strval));
			condi_3 = " -gt ";
			condi_4 = (char *)strdup((yyvsp[0].strval));
			condi_5 = " ]";
		}

		free((yyvsp[-2].strval));
		free((yyvsp[0].strval));
	}
#line 2146 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 756 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup((yyvsp[-2].strval));
			condi_3 = " -ge ";
			condi_4 = (char *)strdup((yyvsp[0].strval));
			condi_5 = " ]";
		}

		free((yyvsp[-2].strval));
		free((yyvsp[0].strval));
	}
#line 2176 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 783 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup((yyvsp[-2].strval));
			condi_3 = " -lt ";
			condi_4 = (char *)strdup((yyvsp[0].strval));
			condi_5 = " ]";
		}


		free((yyvsp[-2].strval));
		free((yyvsp[0].strval));
	}
#line 2207 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 811 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup((yyvsp[-2].strval));
			condi_3 = " -le ";
			condi_4 = (char *)strdup((yyvsp[0].strval));
			condi_5 = " ]";
		}

		free((yyvsp[-2].strval));
		free((yyvsp[0].strval));
	}
#line 2237 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 838 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			string s = to_string((yyvsp[-2].ival));
      		char const* var= s.c_str();
			condi_2 = (char *)var;
			condi_3 = " -gt ";
			condi_4 = (char *)strdup((yyvsp[0].strval));
			condi_5 = " ]";
		}

		free((yyvsp[0].strval));
	}
#line 2262 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 860 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			string s = to_string((yyvsp[-2].ival));
      		char const* var= s.c_str();
			condi_2 = (char *)var;
			condi_3 = " -ge ";
			condi_4 = (char *)strdup((yyvsp[0].strval));
			condi_5 = " ]";
		}

		free((yyvsp[0].strval));
	}
#line 2287 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 882 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			string s = to_string((yyvsp[-2].ival));
      		char const* var= s.c_str();
			condi_2 = (char *)var;
			condi_3 = " -lt ";
			condi_4 = (char *)strdup((yyvsp[0].strval));
			condi_5 = " ]";
		}

		free((yyvsp[0].strval));
	}
#line 2312 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 904 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			string s = to_string((yyvsp[-2].ival));
      		char const* var= s.c_str();
			condi_2 = (char *)var;
			condi_3 = " -le ";
			condi_4 = (char *)strdup((yyvsp[0].strval));
			condi_5 = " ]";
		}

		free((yyvsp[0].strval));
	}
#line 2337 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 926 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup((yyvsp[-2].strval));
			condi_3 = " -gt ";
			string s = to_string((yyvsp[0].ival));
      		char const* var= s.c_str();
			condi_4 = (char *)var;
			condi_5 = " ]";
		}

		free((yyvsp[-2].strval));
	}
#line 2362 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 948 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup((yyvsp[-2].strval));
			condi_3 = " -ge ";
			string s = to_string((yyvsp[0].ival));
      		char const* var= s.c_str();
			condi_4 = (char *)var;
			condi_5 = " ]";
		}

		free((yyvsp[-2].strval));
	}
#line 2387 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 970 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup((yyvsp[-2].strval));
			condi_3 = " -lt ";
			string s = to_string((yyvsp[0].ival));
      		char const* var= s.c_str();
			condi_4 = (char *)var;
			condi_5 = " ]";
		}

		free((yyvsp[-2].strval));
	}
#line 2412 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 992 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0){
			condi_1 = "[ $";
			condi_2 = (char *)strdup((yyvsp[-2].strval));
			condi_3 = " -le ";
			string s = to_string((yyvsp[0].ival));
      		char const* var= s.c_str();
			condi_4 = (char *)var;
			condi_5 = " ]";
		}

		free((yyvsp[-2].strval));
	}
#line 2437 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 1016 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-2].strval), "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free((yyvsp[-2].strval));
	}
#line 2450 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 1026 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-1].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-1].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}else if(strcmp((yyvsp[-2].strval), "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free((yyvsp[-2].strval));
		free((yyvsp[-1].strval));
	}
#line 2469 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 1042 "parser.y" /* yacc.c:1646  */
    {
		if(strcmp((yyvsp[-4].strval), "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free((yyvsp[-4].strval));
	}
#line 2482 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 1052 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}else if(strcmp((yyvsp[-4].strval), "return"))
		{
			cout<<"Error en palabra reservada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		free((yyvsp[-4].strval));
		free((yyvsp[-2].strval));
	}
#line 2501 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 1070 "parser.y" /* yacc.c:1646  */
    {
		if(esta_tabla_sim((yyvsp[-1].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-1].strval)<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else
		{
			char *tipo = strdup((yyvsp[-2].strval));
			char *id = strdup((yyvsp[-1].strval));
			tupla aux = make_tuple(tipo,id);

			insertar_tabla_sim(aux);
			//imprimir_tabla_sim();
		}

		//No se traduce.

		free((yyvsp[-2].strval));
		free((yyvsp[-1].strval));
	}
#line 2528 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 1094 "parser.y" /* yacc.c:1646  */
    {
		if(esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp((yyvsp[-4].strval), "char"))
		{
			auto tipo = strdup((yyvsp[-4].strval));
			auto id = strdup((yyvsp[-3].strval));
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
			fprintf(yysalida,"%s=%d\n",(yyvsp[-3].strval),(yyvsp[-1].ival));

		free((yyvsp[-4].strval));
		free((yyvsp[-3].strval));
	}
#line 2561 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 1124 "parser.y" /* yacc.c:1646  */
    {
		if(esta_tabla_sim((yyvsp[-5].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-5].strval)<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp((yyvsp[-6].strval),"int") && strcmp((yyvsp[-6].strval), "float"))
		{
			auto tipo = strdup((yyvsp[-6].strval));
			auto id = strdup((yyvsp[-5].strval));
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
			fprintf(yysalida,"%s='$%s'\n",(yyvsp[-5].strval),(yyvsp[-2].strval));

		free((yyvsp[-6].strval));
		free((yyvsp[-5].strval));
	}
#line 2594 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 1154 "parser.y" /* yacc.c:1646  */
    {
		if(esta_tabla_sim((yyvsp[-5].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-5].strval)<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp((yyvsp[-6].strval),"int") && strcmp((yyvsp[-6].strval), "float"))
		{
			auto tipo = strdup((yyvsp[-6].strval));
			auto id = strdup((yyvsp[-5].strval));
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
			fprintf(yysalida,"%s='%d'\n",(yyvsp[-5].strval),(yyvsp[-2].ival));

		free((yyvsp[-6].strval));
		free((yyvsp[-5].strval));
	}
#line 2627 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 1184 "parser.y" /* yacc.c:1646  */
    {
		if(esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- YA declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-1].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-1].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp((yyvsp[-4].strval),get<0>(obtener_tupla_por_id((yyvsp[-1].strval)))))
		{
			auto tipo = strdup((yyvsp[-4].strval));
			auto id = strdup((yyvsp[-3].strval));
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
			fprintf(yysalida,"%s=$%s\n",(yyvsp[-3].strval),(yyvsp[-1].strval));

		free((yyvsp[-4].strval));
		free((yyvsp[-3].strval));
		free((yyvsp[-1].strval));
	}
#line 2667 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 1223 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-1].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-1].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-3].strval))),get<0>(obtener_tupla_por_id((yyvsp[-1].strval)))))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variables ->"<<(yyvsp[-3].strval)<< " "<< (yyvsp[-1].strval)<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=$%s\n",(yyvsp[-3].strval),(yyvsp[-1].strval));

		free((yyvsp[-3].strval));
		free((yyvsp[-1].strval));
	}
#line 2698 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 1251 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp(get<0>(obtener_tupla_por_id((yyvsp[-3].strval))), "char"))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=%d\n",(yyvsp[-3].strval),(yyvsp[-1].ival));

		free((yyvsp[-3].strval));
	}
#line 2722 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 1272 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-1].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-1].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-3].strval))),get<0>(obtener_tupla_por_id((yyvsp[-1].strval)))))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variables ->"<<(yyvsp[-3].strval)<< " "<< (yyvsp[-1].strval)<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s + $%s`\n",(yyvsp[-3].strval),(yyvsp[-3].strval),(yyvsp[-1].strval));

		free((yyvsp[-3].strval));
		free((yyvsp[-1].strval));
	}
#line 2753 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 1300 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp(get<0>(obtener_tupla_por_id((yyvsp[-3].strval))), "char"))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s + %d`\n",(yyvsp[-3].strval),(yyvsp[-3].strval),(yyvsp[-1].ival));

		free((yyvsp[-3].strval));
	}
#line 2777 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 1321 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-1].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-1].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-3].strval))),get<0>(obtener_tupla_por_id((yyvsp[-1].strval)))))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variables ->"<<(yyvsp[-3].strval)<< " "<< (yyvsp[-1].strval)<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s - $%s`\n",(yyvsp[-3].strval),(yyvsp[-3].strval),(yyvsp[-1].strval));


		free((yyvsp[-3].strval));
		free((yyvsp[-1].strval));
	}
#line 2809 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 1350 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp(get<0>(obtener_tupla_por_id((yyvsp[-3].strval))), "char"))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s - %d`\n",(yyvsp[-3].strval),(yyvsp[-3].strval),(yyvsp[-1].ival));


		free((yyvsp[-3].strval));
	}
#line 2834 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 1372 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-1].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-1].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(strcmp(get<0>(obtener_tupla_por_id((yyvsp[-3].strval))),get<0>(obtener_tupla_por_id((yyvsp[-1].strval)))))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variables ->"<<(yyvsp[-3].strval)<< " "<< (yyvsp[-1].strval)<<"<-"" TIPOS difieren. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s \\* $%s`\n",(yyvsp[-3].strval),(yyvsp[-3].strval),(yyvsp[-1].strval));


		free((yyvsp[-3].strval));
		free((yyvsp[-1].strval));
	}
#line 2866 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 1401 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!strcmp(get<0>(obtener_tupla_por_id((yyvsp[-3].strval))), "char"))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- TIPO incorrecto. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s \\* %d`\n",(yyvsp[-3].strval),(yyvsp[-3].strval),(yyvsp[-1].ival));

		free((yyvsp[-3].strval));
	}
#line 2890 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 1422 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			fprintf(yysalida, "%s=`expr %s%s%s%s%s`\n", (yyvsp[-3].strval), dolarasig, varasig, varasigop, dolarasig, varasig2);

			varasig = (char*) "";
			varasigop = (char*) "";
			varasig2 = (char*) "";
			dolarasig = (char *) "";
		}

		free((yyvsp[-3].strval));
	}
#line 2915 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 1444 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			fprintf(yysalida, "%s=`expr %s%s%s%s%s`\n", (yyvsp[-3].strval), dolarasig, varasig, varasigop, dolarasig, varasig2);

			varasig = (char*) "";
			varasigop = (char*) "";
			varasig2 = (char*) "";
			dolarasig = (char *) "";
		}

		free((yyvsp[-3].strval));
	}
#line 2939 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 1465 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			fprintf(yysalida, "%s=`expr %s%s%s%s%s`\n", (yyvsp[-3].strval), dolarasig, varasig, varasigop, dolarasig, varasig2);

			varasig = (char*) "";
			varasigop = (char*) "";
			varasig2 = (char*) "";
			dolarasig = (char *) "";
		}

		free((yyvsp[-3].strval));
	}
#line 2963 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 1486 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			fprintf(yysalida, "%s=`expr %s%s%s%s%s`\n", (yyvsp[-3].strval), dolarasig, varasig, varasigop, dolarasig, varasig2);

			varasig = (char*) "";
			varasigop = (char*) "";
			varasig2 = (char*) "";
			dolarasig = (char *) "";
		}
		free((yyvsp[-3].strval));
	}
#line 2986 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 1506 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-5].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-5].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-1].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-1].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s %% $%s`\n",(yyvsp[-5].strval),(yyvsp[-3].strval),(yyvsp[-1].strval));

		free((yyvsp[-5].strval));
		free((yyvsp[-3].strval));
		free((yyvsp[-1].strval));
	}
#line 3018 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 1535 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-5].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-5].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-3].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-3].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s %% %d`\n",(yyvsp[-5].strval),(yyvsp[-3].strval),(yyvsp[-1].ival));

		free((yyvsp[-5].strval));
		free((yyvsp[-3].strval));
	}
#line 3043 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 1557 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-5].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-5].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[-1].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-1].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr %d %% $%s`\n",(yyvsp[-5].strval),(yyvsp[-3].ival),(yyvsp[-1].strval));

		free((yyvsp[-5].strval));
		free((yyvsp[-1].strval));
	}
#line 3068 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 1579 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-5].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-5].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr %d %% %d`\n",(yyvsp[-5].strval),(yyvsp[-3].ival),(yyvsp[-1].ival));

		free((yyvsp[-5].strval));
	}
#line 3086 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 1594 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s + 1`\n",(yyvsp[-2].strval),(yyvsp[-2].strval));

		free((yyvsp[-2].strval));
	}
#line 3104 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 1609 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s - 1`\n",(yyvsp[-2].strval),(yyvsp[-2].strval));

		free((yyvsp[-2].strval));
	}
#line 3122 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 1624 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-1].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-1].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s + 1`\n",(yyvsp[-1].strval),(yyvsp[-1].strval));

		free((yyvsp[-1].strval));
	}
#line 3140 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 86:
#line 1639 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-1].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-1].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
			fprintf(yysalida,"%s=`expr $%s - 1`\n",(yyvsp[-1].strval),(yyvsp[-1].strval));

		free((yyvsp[-1].strval));
	}
#line 3158 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 87:
#line 1656 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			varasigop = (char *)" + ";
			dolarasig = (char *)"$";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[0].strval));
	}
#line 3180 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 89:
#line 1677 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup((yyvsp[-2].strval));
			varasigop = (char *)" + ";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[-2].strval));
		free((yyvsp[0].strval));
	}
#line 3210 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 91:
#line 1706 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup((yyvsp[-2].strval));
			varasigop = (char *)" + ";
      string s = to_string((yyvsp[0].ival));
      char const* var1= s.c_str();
			varasig2 = (char *)var1;
		}

		free((yyvsp[-2].strval));
	}
#line 3235 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 92:
#line 1728 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			string s = to_string((yyvsp[-2].ival));
			char const* var1= s.c_str();
			varasig = (char *)var1;
			varasigop = (char *)" + ";
			dolarasig = (char *)"$";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[0].strval));
	}
#line 3260 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 93:
#line 1752 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			varasigop = (char *)" - ";
			dolarasig = (char *)"$";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[0].strval));
	}
#line 3282 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 95:
#line 1773 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup((yyvsp[-2].strval));
			varasigop = (char *)" - ";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[-2].strval));
		free((yyvsp[0].strval));
	}
#line 3312 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 97:
#line 1802 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup((yyvsp[-2].strval));
			varasigop = (char *)" - ";
      string s = to_string((yyvsp[0].ival));
      char const* var1= s.c_str();
			varasig2 = (char *)var1;
		}

		free((yyvsp[-2].strval));
	}
#line 3336 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 98:
#line 1823 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			string s = to_string((yyvsp[-2].ival));
			char const* var1= s.c_str();
			varasig = (char *)var1;
			varasigop = (char *)" - ";
			dolarasig = (char *)"$";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[0].strval));
	}
#line 3361 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 99:
#line 1847 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			varasigop = (char *)" \\* ";
			dolarasig = (char *)"$";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[0].strval));
	}
#line 3383 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 101:
#line 1868 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup((yyvsp[-2].strval));
			varasigop = (char *)" \\* ";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[-2].strval));
		free((yyvsp[0].strval));
	}
#line 3412 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 103:
#line 1896 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup((yyvsp[-2].strval));
			varasigop = (char *)" \\* ";
      string s = to_string((yyvsp[0].ival));
      char const* var1= s.c_str();
			varasig2 = (char *)var1;
		}

		free((yyvsp[-2].strval));
	}
#line 3436 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 104:
#line 1917 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			string s = to_string((yyvsp[-2].ival));
			char const* var1= s.c_str();
			varasig = (char *)var1;
			varasigop = (char *)" \\* ";
			dolarasig = (char *)"$";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[0].strval));
	}
#line 3460 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 105:
#line 1940 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}

		if(cantErrores == 0)
		{
			varasigop = (char *)" / ";
			dolarasig = (char *)"$";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[0].strval));
	}
#line 3482 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 107:
#line 1961 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		else if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup((yyvsp[-2].strval));
			varasigop = (char *)" / ";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[-2].strval));
		free((yyvsp[0].strval));
	}
#line 3511 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 109:
#line 1989 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[-2].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[-2].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			dolarasig = (char *)"$";
			varasig = strdup((yyvsp[-2].strval));
			varasigop = (char *)" / ";
      string s = to_string((yyvsp[0].ival));
      char const* var1= s.c_str();
			varasig2 = (char *)var1;
		}

		free((yyvsp[-2].strval));
	}
#line 3535 "parser.tab.c" /* yacc.c:1646  */
    break;

  case 110:
#line 2010 "parser.y" /* yacc.c:1646  */
    {
		if(!esta_tabla_sim((yyvsp[0].strval)))
		{
			//imprimir_tabla_sim();
			cout<<endl<<"*ERROR: variable ->"<<(yyvsp[0].strval)<<"<- NO declarada. Linea: "<<lineas<<"*"<<endl;
			cantErrores++;
		}
		if(cantErrores == 0)
		{
			string s = to_string((yyvsp[-2].ival));
			char const* var1= s.c_str();
			varasig = (char *)var1;
			varasigop = (char *)" / ";
			dolarasig = (char *)"$";
			varasig2 = strdup((yyvsp[0].strval));
		}

		free((yyvsp[0].strval));
	}
#line 3559 "parser.tab.c" /* yacc.c:1646  */
    break;


#line 3563 "parser.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 2031 "parser.y" /* yacc.c:1906  */


void agregar_ambito()
{
	vector<tupla > lista_ambito;
	tabla_sim.emplace_back(lista_ambito);
}

void eliminar_ambito()
{
	vector<vector<tuple<char *,char *> > >::iterator it;
	vector<tupla >::iterator it2;

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
	vector<vector<tupla > >::iterator it;
	vector<tupla >::iterator it2;

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
	vector<vector<tupla > >::iterator it;
	vector<tupla >::iterator it2;

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
	vector<vector<tupla > >::iterator it;
	vector<tupla >::iterator it2;
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


bool insertar_tabla_sim(tupla const & tup)
{
	vector<vector<tupla > >::iterator it;

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
	vector<vector<tupla > >::iterator it;
	vector<tupla >::iterator it2;

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
