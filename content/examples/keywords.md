---
title: "keywords"
date: 2023-06-22T
draft: false
---

There are three keyword categories:

## Strict

These keywords can only be used in their correct contexts. They cannot be used as names of any items.

- `break`
- `const`
- `continue`
- `else`
- `enum`
- `false`
- `for`
- `fn`
- `hint`
- `if`
- `impl`
- `in`
- `match`
- `pub`
- `return`
- `struct`
- `trait`
- `true`
- `type`
- `use`

## Reserved

These keywords aren’t used yet, but they are reserved for future use. They have the same restrictions as strict keywords. The reasoning behind this is to make current programs forward compatible with future versions of Cairo by forbidding them to use these keywords.

- `as`
- `assert`
- `do`
- `dyn`
- `extern`
- `let`
- `macro`
- `mod`
- `move`
- `ref`
- `Self`
- `self`
- `static_assert`
- `static`
- `super`
- `try`
- `typeof`
- `unsafe`
- `where`
- `while`
- `with`
- `yield`

## Contextual

Some grammar productions may make use of new keywords not listed here. Such keywords have special meaning only in these certain contexts. Outside these places, these character sequences are treated as regular identifiers, thus it is possible to declare a function or variable with such names.
