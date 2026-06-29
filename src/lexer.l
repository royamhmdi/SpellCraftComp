%{
#include <stdio.h>
#include <stdlib.h>

int line = 1;
%}

/* ===== Definitions ===== */

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          \$({LETTER}|{DIGIT})+
INTEGER     {DIGIT}+
FLOAT       {DIGIT}+"."{DIGIT}+

%%

"mana"          { printf("KEYWORD: mana\n"); }
"elixir"        { printf("KEYWORD: elixir\n"); }
"cast_if"       { printf("KEYWORD: cast_if\n"); }
"begin_spell"   { printf("KEYWORD: begin_spell\n"); }
"end_spell"     { printf("KEYWORD: end_spell\n"); }

%%

int yywrap()
{
    return 1;
}