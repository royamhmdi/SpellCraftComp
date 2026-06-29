CC = gcc
CFLAGS = -Wall -Iinclude

LEX = flex
YACC = bison -d

SRC = src/main.c src/semantic.c src/symbol_table.c
OBJ = main.o semantic.o symbol_table.o parser.tab.o lex.yy.o

all: spell

spell: $(OBJ)
	$(CC) $(OBJ) -o spell

parser.tab.c parser.tab.h: src/parser.y
	$(YACC) src/parser.y

lex.yy.c: src/lexer.l parser.tab.h
	$(LEX) src/lexer.l

main.o: src/main.c
	$(CC) $(CFLAGS) -c src/main.c

semantic.o: src/semantic.c
	$(CC) $(CFLAGS) -c src/semantic.c

symbol_table.o: src/symbol_table.c
	$(CC) $(CFLAGS) -c src/symbol_table.c

parser.tab.o: parser.tab.c
	$(CC) $(CFLAGS) -c parser.tab.c

lex.yy.o: lex.yy.c
	$(CC) $(CFLAGS) -c lex.yy.c

clean:
	rm -f *.o parser.tab.c parser.tab.h lex.yy.c spell
