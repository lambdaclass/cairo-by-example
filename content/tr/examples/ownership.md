---
title: "ownership"
weight: 280
draft: false
---

Cairo kodunda iki sahiplik kuralına uymak zorunludur:
    - Cairo'daki her değerin aynı anda yalnızca bir sahibi olur.
    - Sahip kapsamı dışına çıktığında, değer bırakılır (dropped).

```rust {.codebox}
use array::ArrayTrait;

fn foo(arr: Array<u128>) {
    // foo, dizinin sahipliğini alır.
    // Bu fonksiyon döndüğünde, arr düşer (dropped).
}

fn main() {
    // arr'ın yaratıcısı olarak, main fonksiyonu arrayin sahibidir.
    let arr = ArrayTrait::<u128>::new();

    foo(arr); // Arrayin sahipliği fonksiyon çağrısına geçer (ownership transfer).

    // foo(arr); <- artık başarısız olur, çünkü main artık arrayin sahibi değildir.
}
```
