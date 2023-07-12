---
title: "zeroable"
date: 2023-06-22T13:50:00-06:00
draft: false
---

La biblioteca std de Cairo tiene algunas utilidades para manejar valores distintos de cero.

He aquí cómo obtener un `NonZero<T>` de un felt252.

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
