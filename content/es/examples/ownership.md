---
title: "Ownership"
weight: 280
draft: false
---

Todo el código de Cairo tiene que cumplir dos reglas de _ownership_:
    - Cada valor en Cairo tiene un único owner a la vez,
    - Cuando el owner sale del scope, el valor será _dropped_.

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
