%{
#include <stdio.h>
#include <stdlib.h>

#include "parser.tab.h"

int line = 1;
%}
/* ===== Definitions ===== */

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          \$({LETTER}|{DIGIT})+
INTEGER     {DIGIT}+
FLOAT       {DIGIT}+"."{DIGIT}+

%%

"mana"          { return MANA; }
"elixir"        { return ELIXIR; }
"cast_if"       { return CAST_IF; }
"begin_spell"   { return BEGIN_SPELL; }
"end_spell"     { return END_SPELL; }

{FLOAT}         { return FLOAT; }
{INTEGER}       { return INTEGER; }
{ID}            { return ID; }

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MULTIPLY; }
"/"             { return DIVIDE; }

">="            { return ASSIGN; }
"=="            { return EQUAL; }

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