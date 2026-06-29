#include <stdio.h>
#include "symbol_table.h"

extern FILE *yyin;
int yyparse();

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("Cannot open file");
            return 1;
        }
    }

    init_symbol_table();

    if (yyparse() == 0) {
        printf("Compilation successful!\n");
    } else {
        printf("Compilation failed.\n");
    }

    return 0;
}
