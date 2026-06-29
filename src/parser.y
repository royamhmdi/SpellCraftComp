%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token MANA
%token ELIXIR
%token CAST_IF
%token BEGIN_SPELL
%token END_SPELL

%token ID
%token INTEGER
%token FLOAT

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
    | ELIXIR ID END_STATEMENT
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