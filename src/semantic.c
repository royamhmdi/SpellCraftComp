#include <stdio.h>
#include "semantic.h"

void check_duplicate_declaration(const char *name, DataType type)
{
    if (!insert_symbol(name, type))
    {
        // [استنباط سازگار با جزوه] - اعمال قالب دقیق خواسته شده در صورت پروژه با براکت و علامت تعجب
        printf("Error: Spell [%s] is already conjured!\n", name);
    }
}

DataType get_identifier_type(const char *name)
{
    Symbol *symbol = lookup_symbol(name);

    if (symbol == NULL)
    {
        printf("Semantic Error: Variable %s is not declared\n", name);
        return TYPE_MANA;
    }

    return symbol->type;
}

DataType check_assignment(const char *name, DataType expr_type)
{
    Symbol *symbol = lookup_symbol(name);

    if (symbol == NULL)
    {
        printf("Semantic Error: Variable %s is not declared\n", name);
        return expr_type;
    }

    if (symbol->type == TYPE_MANA && expr_type == TYPE_ELIXIR)
    {
        // [استنباط سازگار با جزوه] - اضافه کردن نقطه در انتهای پیام برای مطابقت ۱۰۰٪ با صورت پروژه
        printf("Warning: Alchemy error! Pours elixir into a mana vessel.\n");
    }

    return symbol->type;
}

DataType promote_type(DataType left, DataType right)
{
    if (left == TYPE_ELIXIR || right == TYPE_ELIXIR)
        return TYPE_ELIXIR;

    return TYPE_MANA;
}
