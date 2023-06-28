---
title: "ownership"
weight: 280
draft: false
---

All Cairo code has to abide by two _ownership_ rules:
    - each value in Cairo has one and only one owner at a time,
    - when the owner goes out of scope, the value will be _dropped_

```rust {.codebox}
use array::ArrayTrait;

fn foo(arr: Array<u128>) {
    // foo takes ownership of the array.
    // when this function returns, arr is dropped.
}

fn main() {
    // as the creator of arr, the main function owns the array
    let arr = ArrayTrait::<u128>::new();

    foo(arr); // moves ownership of the array to function call

    // foo(arr); <- fails to compile, as main doesn't own the array anymore
}
```
