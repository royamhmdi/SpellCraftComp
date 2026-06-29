# 🧙‍♂️ SpellCraft Compiler

A mini compiler for a custom magical programming language called **SpellCraft**, implemented using **Flex (Lex)** and **Bison (Yacc)** in C.

---

## 📌 Overview

SpellCraft is a domain-specific language inspired by magical spell casting systems.
This project demonstrates the full pipeline of a compiler including:

* Lexical Analysis (Tokenization)
* Syntax Analysis (Parsing)
* Semantic Analysis
* Symbol Table Management
* Scope Handling
* Type Checking & Type Promotion
* Error & Warning Handling

---

## ✨ Language Features

### 🔤 Data Types

* `mana` → integer type
* `elixir` → floating-point type

### 📌 Variables

All variables must start with `$`:

```spell
mana $hp~
elixir $potion~
```

---

### 🧠 Assignment

```spell
$hp => 10~
$potion => 3.5~
```

---

### ➕ Expressions

Supports:

* `+`
* `-`
* `*`
* `/`

With automatic type promotion:

```spell
$mix => 5 + 3.5~
```

---

### 🔀 Conditionals

```spell
cast_if ($hp == 10)
begin_spell
mana $x~
end_spell

cast_else
begin_spell
mana $y~
end_spell
```

---

### 🧱 Scopes

Blocks are defined using:

```spell
begin_spell
    mana $x~
end_spell
```

Variables are scoped and removed after block execution.

---

## ⚠️ Semantic Rules

### ❌ Duplicate Declaration

```
Error: Spell [$var] is already conjured!
```

### ⚠️ Type Mismatch

```
Warning: Alchemy error! Pours elixir into a mana vessel.
```

### 🔁 Type Promotion

Automatic conversion from `mana → elixir` when needed.

---

## 🏗️ Project Structure

```
SpellCraftComp/
│
├── include/          # Header files
├── src/              # Compiler implementation
│   ├── lexer.l
│   ├── parser.y
│   ├── semantic.c
│   ├── symbol_table.c
│   └── main.c
│
├── tests/            # Sample test programs
├── Makefile
└── README.md
```

---

## ⚙️ Build & Run

### Build

```bash
make clean
make
```

### Run

```bash
./spell tests/test1.spell
```

---

## 🧪 Sample Input

```spell
mana $dragons~
elixir $potion~

$dragons => 5~
$potion => 3.5 + $dragons~

cast_if ($dragons == 5)
begin_spell
$dragons => 12.5~
end_spell
```

---

## 🚀 Output Example

```
Error: Spell [$dragons] is already conjured!
Warning: Alchemy error! Pours elixir into a mana vessel.
Compilation successful!
```

---

## 🎯 Objectives

This project was developed as part of a **Compiler Design course** to demonstrate:

* Building a compiler using Flex & Bison
* Handling grammar and lexical rules
* Implementing semantic analysis
* Managing symbol tables and scopes
* Performing type checking and promotion

---

## 👨‍💻 Author

Developed as a university compiler design project.

---

## 📜 License

This project is for educational purposes only.
