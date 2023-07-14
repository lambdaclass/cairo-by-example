---
title: "Pattern matching"
weight: 270
draft: false
---

Además de [enums](../enums), Cairo soporta un uso más general de pattern matching. Puede coincidir con `enum`s pero también con `struct`s.
Actualmente puede usar pattern matching en `struct`s sólo para desestructurar los campos en una sentencia `let`:

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
Ejemplo completo:
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

fn destructure_tuple(t: (u16, u16)) -> u16 {
    let (x, y) = t;
    x + y
}

#[test]
fn test_destructure_struct(){
    let s = MyStruct{a: 1, b: 2};
    let t = MyStruct{a: 3, b: 4};
    let u = MyStruct{a: 5, b: 6};
    let sum = destructure_my_struct(s, t, u);
    assert(sum == 10, 'sum should be 10');
}

#[test]
fn test_destructure_tuple(){
    let t = (1, 2);
    let sum = destructure_tuple(t);
    assert(sum == 3, 'sum should be 3');
}
```
Para correrlo puedes ejecutar `cairo-test pattern_matching.cairo` en tu terminal
