---
title: "felt252"
weight: 70
draft: false
---

The basic data type in Cairo is `felt252`, which stands for *field element*. These are integers in the range `0 <= x < P`, where `P` is a large prime number, currently equal to `P = 2^{251} + 17 * 2^{192}+1`.
Field elements have the property of intentionally *wrapping around* when their value falls outside the specified range. That is, they use modular arithmetic.

```rust {.codebox}
fn main() {
    // max value of felt252
    let x: felt252 = 3618502788666131213697322783095070105623107215331596699973092056135872020480;
    let y: felt252 = 1;
    assert(x + y == 0, 'P == 0 (mod P)');
}
```

Since `felt252` is the default data type, in simple cases like these there is no real need to specify the type.
This means we can simply write:

```rust {.codebox}
fn main() {
    // max value of felt252
    let x = 3618502788666131213697322783095070105623107215331596699973092056135872020480;
    let y = 1;
    assert(x + y == 0, 'P == 0 (mod P)');
}
```
