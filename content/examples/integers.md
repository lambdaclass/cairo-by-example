---
title: "integers"
weight: 80
draft: false
---

Even though the `felt252` type is fundamental for the Cairo language, it is highly recommended to use `integer` types where possible.
`integer` types come with extra protection against potential vulnerabilities in the code, such as overflow checks.
Each type is suffixed with the number of bits occupied by the fixed number representation.

Here's an example program that declares a variable of each available type, with each type's maximum value:

```rust {.codebox}
fn main() {
    let a: u8 = 0xff;
    let b: u16 = 0xffff;
    let c: u32 = 0xffffffff;
    let c: usize = 0xffffffff; // same size as u32
    let d: u64 = 0xffffffffffffffff;
    let e: u128 = 0xffffffffffffffffffffffffffffffff;
    let f: u256 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
}
```

Note that all of these are **unsigned**, same as `felt252`.
But, unlike `felt252`, these types cannot be assigned a negative literal:

```rust {.codebox}
fn main() {
    let x: felt252 = -232; // This is OK
    let y: u32 = -232;     // This isn't
}
```

This program results in a compilation error:

```console
error: Trait has no implementation in context: core::traits::Neg::<core::integer::u32>
 --> test.cairo:3:18
    let y: u32 = -232;
                 ^**^
```
