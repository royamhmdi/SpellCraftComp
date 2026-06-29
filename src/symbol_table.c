#include <stdio.h>
#include <string.h>

#include "symbol_table.h"

static Symbol symbol_table[MAX_SYMBOLS];
static int symbol_count = 0;

void init_symbol_table(void)
{
    symbol_count = 0;
}

Symbol *lookup_symbol(const char *name)
{
    for (int i = 0; i < symbol_count; i++)
    {
        if (strcmp(symbol_table[i].name, name) == 0)
        {
            return &symbol_table[i];
        }
    }

    return NULL;
}

int insert_symbol(const char *name, DataType type)
{
    if (lookup_symbol(name) != NULL)
    {
        return 0;
    }

    strcpy(symbol_table[symbol_count].name, name);
    symbol_table[symbol_count].type = type;

    symbol_count++;

    return 1;
}