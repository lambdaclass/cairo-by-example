---
title: "recursion"
date: 2023-06-21T14:00:01+0000
draft: false
---

Cairo uses recursion as the principal method of iteration.

Here is how we can calculate the factorial using this method.

```rust {.codebox}

fn main() -> felt252 {
    factorial(9);
}

fn factorial(value: felt252) -> felt252 {
    match value {
        0 => 1,
        _ => value * factorial(value-1),
    }
}
```