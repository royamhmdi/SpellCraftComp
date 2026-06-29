#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

#define MAX_SYMBOLS 100
#define MAX_NAME_LENGTH 50

typedef enum
{
    TYPE_MANA,
    TYPE_ELIXIR
} DataType;

typedef struct
{
    char name[MAX_NAME_LENGTH];
    DataType type;
} Symbol;

void init_symbol_table(void);

int insert_symbol(const char *name, DataType type);

Symbol *lookup_symbol(const char *name);

#endif