#include <stdio.h>
#include <string.h>

#include "symbol_table.h"

static Symbol symbol_table[MAX_SYMBOLS];
static int symbol_count = 0;
static int current_scope_level = 0;

void init_symbol_table(void)
{
    symbol_count = 0;
    current_scope_level = 0;
}

Symbol *lookup_symbol(const char *name)
{
    // از آخر به اول جستجو می‌کنیم تا نزدیک‌ترین Scope پیدا شود
    for (int i = symbol_count - 1; i >= 0; i--)
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
    // فقط در Scope فعلی بررسی می‌کنیم که متغیر تکراری نباشد
    for (int i = symbol_count - 1; i >= 0; i--)
    {
        if (symbol_table[i].scope != current_scope_level)
            continue;

        if (strcmp(symbol_table[i].name, name) == 0)
            return 0;
    }

    if (symbol_count >= MAX_SYMBOLS)
        return 0;

    strcpy(symbol_table[symbol_count].name, name);
    symbol_table[symbol_count].type = type;
    symbol_table[symbol_count].scope = current_scope_level;

    symbol_count++;

    return 1;
}

void enter_scope(void)
{
    current_scope_level++;
}

void exit_scope(void)
{
    while (symbol_count > 0 &&
           symbol_table[symbol_count - 1].scope == current_scope_level)
    {
        symbol_count--;
    }

    if (current_scope_level > 0)
        current_scope_level--;
}

int current_scope(void)
{
    return current_scope_level;
}

