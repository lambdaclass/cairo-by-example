---
title: "zeroable"
weight: 260
draft: false
---

Cairo std kütüphanesinde, sıfır olmayan değerleri işlemek için bazı yardımcı programlar bulunmaktadır.

İşte bir `felt252` değerinden `NonZero<T>` elde etmek için nasıl yapılacağına dair bir örnek:

```rust {.codebox}
//  IsZeroResult<T> enum, eşleştirme aracılığıyla NonZero<T> elde etmemizi sağlar.
use zeroable::IsZeroResult;
use zeroable::NonZeroIntoImpl;

fn main() -> felt252 {
    // NonZeroIntoImpl, NonZero<T>'yi iç değerine dönüştürür.
    NonZeroIntoImpl::into(felt_to_nonzero(1234))
}

fn felt_to_nonzero(value: felt252) -> NonZero<felt252> {
    // felt252_is_zero, felt252 için yerleşik bir yöntemdir
    match felt252_is_zero(value) {
        IsZeroResult::Zero(()) => panic(ArrayTrait::new()),
        IsZeroResult::NonZero(x) => x,
    }
}
```
