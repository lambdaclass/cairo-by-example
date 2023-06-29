---
title: "pattern_matching"
date: 2023-06-22T13:25:00-06:00
draft: false
---

Además de [enums](../enums), Cairo soporta un uso más general de la concordancia de patrones. Puede coincidir con `enum`s pero también con `struct`s.
Actualmente puede usar la concordancia de patrones en `struct`s sólo para desestructurar los campos en una sentencia `let`:

```rust {.codebox}
struct MyStruct {
    a: u16,
    b: u16,
}

fn destructure_my_struct(s: MyStruct, t: MyStruct, u: MyStruct) -> u16 {
    // We can ignore a single field by using `_` or `_name`
    let MyStruct{a: a, b: _b} = u;
    let MyStruct{a: b, b: _} = s;
    // Or just ignore everything we didn't name by using `..` at the end
    let MyStruct{b: c, ..} = t;
    a + b + c
}
```

También puede desestructurar tuplas con esta sintaxis:

```rust {.codebox}
fn destructure_tuple(t: (u16, u16)) -> u16 {
    let (x, y) = t;
    x + y
}
```

Sin embargo, el uso de `struct`s para los casos de `match` actualmente falla al compilar:

```rust {.codebox}
// Doesn't compile
fn match_my_struct(s: MyStruct) -> u16 {
    match s {
        MyStruct{a: 0, b: _} =>  0,
        MyStruct{a: _, b: 0} =>  0,
        MyStruct{b: 1, ..} => 1,
    }
}
```
