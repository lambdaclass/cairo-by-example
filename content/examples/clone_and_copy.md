---
title: "clone and copy"
date: 18
draft: false
---

Because of Cairo's ownership rules, it's necessary to specify how data can be duplicated. For this the `Clone` and `Copy` traits are used. `Clone` specifies how a type instance can be *cloned*, meaning its data duplicated and assigned a new owner. The behaviour specified by `Clone` can be **arbitrarily complicated**. Instead `Copy` requires `Clone` and it specifies that a type can be *bitwise-copied*, meaning that its cloning mechanism is simple and known, instead of arbitrary.

From the ownership example:

```rust {.codebox}
use array::ArrayTrait;

fn foo(arr: Array<u128>) {
    // foo takes ownership of the array.
    // when this function returns, arr is dropped.
}

fn main() {
    // as the creator of arr, the main function owns the array
    let arr = ArrayTrait::<u128>::new();

    foo(arr.clone()); // moves ownership of a clone of arr to function call

    foo(arr); // compiles because previously the array was duplicated
    
    // foo(arr); <- fails to compile, as main doesn't own the array anymore
}
```

An example of deriving the Copy trait:

```rust {.codebox}
#[derive(Copy, Clone)]
struct Vector2 {
    x: u32,
    y: u32,
}
// u32 derives Copy too

fn main() {
    let v = Vector2 { x: 1, y: 0 };
    let w = v;

    // now w is a copy of v, v is still accesible
}
```
