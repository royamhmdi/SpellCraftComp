%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../include/semantic.h"
#include "../include/symbol_table.h"

void yyerror(const char *s);
extern int yylex();
%}

%union {
    char* str;
    int ival;
    float fval;
}

%token <str> ID
%token <ival> INTEGER
%token <fval> FLOAT

%token MANA ELIXIR CAST_IF CAST_ELSE BEGIN_SPELL END_SPELL
%token PLUS MINUS MULTIPLY DIVIDE ASSIGN EQUAL END_STATEMENT

%type <ival> expression

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
    : declaration END_STATEMENT
    | assignment END_STATEMENT
    | conditional
    | block
    ;

declaration
    : MANA ID
      {
          check_duplicate_declaration($2, TYPE_MANA);
          
      }
    | ELIXIR ID
      {
          check_duplicate_declaration($2, TYPE_ELIXIR);
                }
    ;


assignment
    : ID ASSIGN expression
      {
          Symbol* sym = lookup_symbol($1);
          if (sym == NULL) {
              printf("Error: Spell %s is undeclared!\n", $1);
          } else {
              check_assignment($1, $3);
          }
      }
    ;

block
    : BEGIN_SPELL
      {
          enter_scope();
      }
      statements
      END_SPELL
      {
          exit_scope();
      }
    ;

conditional
    : CAST_IF '(' condition ')' block
    | CAST_IF '(' condition ')' block CAST_ELSE block
    ;

condition
    : expression EQUAL expression
    ;

expression
    : INTEGER
      {
          $$ = TYPE_MANA;
      }
    | FLOAT
      {
          $$ = TYPE_ELIXIR;
      }
    | ID
      {
          Symbol* sym = lookup_symbol($1);
          if (sym) {
              $$ = sym->type;
          } else {
              printf("Error: Spell %s is undeclared!\n", $1);
              $$ = TYPE_MANA;
          }
      }
    | expression PLUS expression
      {
          $$ = promote_type($1, $3);
      }
    | expression MINUS expression
      {
          $$ = promote_type($1, $3);
      }
    | expression MULTIPLY expression
      {
          $$ = promote_type($1, $3);
      }
    | expression DIVIDE expression
      {
          $$ = promote_type($1, $3);
      }
    ;

%%

void yyerror(const char *s)
{
    printf("Syntax Error: %s\n", s);
}
