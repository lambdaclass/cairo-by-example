---
title: "pattern matching"
weight: 270
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
Here is the full example:
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
To try it out you can run `cairo-test pattern_matching.cairo` on your terminal.
