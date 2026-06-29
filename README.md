SpellCraft Compiler

A simple compiler for the SpellCraft programming language implemented using Flex and Bison in C.

The project includes lexical analysis, syntax analysis, semantic checking, symbol table management, scope handling, and basic type checking.

## Language Features

- Data types: mana (int), elixir (float)
- Variables start with $
- Assignment using =>
- Arithmetic operations: + - * /
- Conditional statements using cast_if / cast_else
- Block scope using begin_spell / end_spell
- Automatic type promotion between mana and elixir

## Semantic Rules

- Duplicate declaration is detected
- Type mismatch warnings are generated
- Undeclared variables are reported
- Basic type promotion is supported

## Build

make clean
make

## Run

./spell tests/test1.spell

## Project Structure

src/        source files
include/    header files
tests/      sample inputs
Makefile

## Author

Compiler Design Course Project
