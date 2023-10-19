
#ifndef YYTOKENTYPE
#define YYTOKENTYPE
  enum yytokentype
  {
    DIGIT = 258,
    LETTER = 259,
    SIN = 260,
    ASIN = 261,
    SINH = 262,
    COS = 263,
    ACOS = 264,
    COSH = 265,
    TAN = 266,
    ATAN = 267,
    TANH = 268,
    LOG = 269,
    LN = 270,
    SQRT = 271,
    SQURE = 272,
    CUBE = 273,
    EXIT = 274,
    EXP = 275,
    CEIL = 276,
    FLOOR = 277,
    ROUND = 278
  };
#endif
union YYSTYPE
{
#line 39 "calc.yacc" 
    double num; 
    char var;

#line 83 "calc.h" 
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif
