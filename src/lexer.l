%option noinput
%option nounput

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"

extern YYSTYPE yylval;

int line = 1;
%}

/* ===== Definitions ===== */

DIGIT       [0-9]
LETTER      [a-zA-Z]

ID          \$[a-zA-Z0-9_]+
INTEGER     {DIGIT}+
FLOAT       {DIGIT}+"."{DIGIT}+

%%

"mana"          { return MANA; }
"elixir"        { return ELIXIR; }
"cast_if"       { return CAST_IF; }
"cast_else"     { return CAST_ELSE; }
"begin_spell"   { return BEGIN_SPELL; }
"end_spell"     { return END_SPELL; }

{FLOAT} {
    yylval.fval = atof(yytext);
    return FLOAT;
}

{INTEGER} {
    yylval.ival = atoi(yytext);
    return INTEGER;
}

{ID} {
    yylval.str = strdup(yytext);
    return ID;
}

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MULTIPLY; }
"/"             { return DIVIDE; }

"=>"            { return ASSIGN; }
"=="            { return EQUAL; }

"("             { return '('; }
")"             { return ')'; }

"~"             { return END_STATEMENT; }

[ \t\r]+        ;

\n              { line++; }

.               {
    printf("Unknown character '%s' at line %d\n", yytext, line);
}

%%

int yywrap()
{
    return 1;
}
