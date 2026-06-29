%{
#include <stdio.h>
#include <stdlib.h>
#include "symbol_table.h"

void yyerror(const char *s);
int yylex(void);
%}

%union {
    char *str;
    int ival;
    float fval;
}

%token MANA
%token ELIXIR
%token CAST_IF
%token BEGIN_SPELL
%token END_SPELL

%token <str> ID
%token <ival> INTEGER
%token <fval> FLOAT

%token PLUS
%token MINUS
%token MULTIPLY
%token DIVIDE

%token ASSIGN
%token EQUAL
%token END_STATEMENT

%left PLUS MINUS
%left MULTIPLY DIVIDE

%%

program
    : statements
    ;

statements
    : statement
    | statements statement
    ;

statement
    : declaration
    | assignment
    | if_statement
    ;

declaration
    : MANA ID END_STATEMENT
      {
          if (!insert_symbol($2, TYPE_MANA))
          {
              printf("Semantic Error: Duplicate declaration of %s\n", $2);
          }
      }
    | ELIXIR ID END_STATEMENT
      {
          if (!insert_symbol($2, TYPE_ELIXIR))
          {
              printf("Semantic Error: Duplicate declaration of %s\n", $2);
          }
      }
    ;

assignment
    : ID ASSIGN expression END_STATEMENT
    ;

if_statement
    : CAST_IF condition BEGIN_SPELL block END_SPELL
    ;

block
    :
    | statements
    ;

condition
    : expression EQUAL expression
    ;

expression
    : INTEGER
    | FLOAT
    | ID
    | expression PLUS expression
    | expression MINUS expression
    | expression MULTIPLY expression
    | expression DIVIDE expression
    ;

%%

void yyerror(const char *s)
{
    printf("Syntax Error: %s\n", s);
}

int main()
{
    return yyparse();
}