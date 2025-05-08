---
title: "felt252"
weight: 70
draft: false
---

Cairo'da temel veri tipi `felt252`'dir, bu "alan elemanı" anlamına gelir. Bu, `0 <= x < P` aralığındaki tam sayılardır. Burada `P`, büyük bir asal sayı olup şu anda `P = 2^{251} + 17 * 2^{192} + 1` olarak belirlenmiştir. Alan elemanları, değerleri belirtilen aralığın dışına çıktığında kasıtlı olarak sarılarak çalışırlar ve modüler aritmetik kullanırlar.

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    let x: felt252 = 2;
    let y: felt252 = 5;
    (x + y).print();
}
```

`felt252` varsayılan veri tipi olduğu için, bu gibi basit durumlarda tipi belirtmek gerçekten gerekli değildir. 
Bu nedenle şu şekilde yazabiliriz:

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    let x = 2;
    let y = 5;
    (x + y).print();
}
```
