---
title: "functions"
weight: 40
draft: false
---

A function is a unit of code that performs some logic. It is defined using the `fn` keyword.

Examples of functions are:

```rust {.codebox}
// This functions doesn't return anything.
fn main() {
    let x = 3;
}

// This function returns an u32.
fn inc(x: u32) -> u32 {
    x + 1
}
```

The Cairo convention is to name functions using the 'snake_case' form. In the example above, the function name is `inc_n`.

Note that in Cairo, functions always return a value. When the function has no particular return value, it is common to return the unit type (`()`).
