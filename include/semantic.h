#ifndef SEMANTIC_H
#define SEMANTIC_H

#include "symbol_table.h"

void check_duplicate_declaration(const char *name, DataType type);

DataType check_assignment(const char *name, DataType expr_type);

DataType get_identifier_type(const char *name);

DataType promote_type(DataType left, DataType right);

#endif