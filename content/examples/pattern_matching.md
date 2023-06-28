---
title: "pattern matching"
weight: 27
draft: false
---

Besides [enums](../enums), Cairo supports more general use of pattern matching. You can match on `enum`s but also `struct`s.
Currently you can use pattern matching on `struct`s only to destructure the fields in a `let` statement:

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

You can also destructure tuples with this syntax:

```rust {.codebox}
fn destructure_tuple(t: (u16, u16)) -> u16 {
    let (x, y) = t;
    x + y
}
```

However, using `struct`s for the `match` arms will currently fail to compile:

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
