---
title: "felt252"
date: 2023-06-21T11:45:31-07:00
draft: false
---

The basic data type in Cairo is `felt252`, which stands for *field element*. These are integers in the range `0 <= x < P`, where `P` is a large prime number, currently equal to `P = 2^{251} + 17 * 2^{192}+1`. 
Field elements have the property of intentionally overflowing when their value falls outside the specified range, they use modular arithmetic.

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    let x: felt252 = 2; 
    let y: felt252 = 5; 
    (x+y).print();
}

```

Since `felt252` is the default data type, in simple cases like these there is no real need to specify the type. This means we can simply write

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    let x = 2; 
    let y = 5; 
    (x+y).print();
}

```

