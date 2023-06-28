---
title: "zeroable"
weight: 260
draft: false
---

The Cairo std library has some utilities for handling non zero values.

Here is how to get a `NonZero<T>` out of a felt252.

```rust {.codebox}
// The IsZeroResult<T> enum allows us to obtain a NonZero<T> via matching.
use zeroable::IsZeroResult;
use zeroable::NonZeroIntoImpl;

fn main() -> felt252 {
    // NonZeroIntoImpl converts a NonZero<T> into its inner value.
    NonZeroIntoImpl::into(felt_to_nonzero(1234))
}

fn felt_to_nonzero(value: felt252) -> NonZero<felt252> {
    // felt252_is_zero is a builtin method for felt252.
    match felt252_is_zero(value) {
        IsZeroResult::Zero(()) => panic(ArrayTrait::new()),
        IsZeroResult::NonZero(x) => x,
    }
}
```
