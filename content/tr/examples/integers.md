---
title: "integers"
weight: 80
draft: false
---

Cairo dili için `felt252` tipi temel bir yapı taşı olmasına rağmen, mümkün olduğunda `integer` tiplerini kullanmanız şiddetle önerilir. `integer` tipleri, taşmalar gibi potansiyel güvenlik açıklarına karşı ek koruma sağlar. Her bir tipte, sabit sayı temsilinin işgal ettiği bit sayısı ile sonlandırılmıştır.

İşte her bir mevcut tipte bir değişkeni tanımlayan ve her bir tipin maksimum değerini içeren bir örnek program

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

Hepsi `felt252` gibi işaretsizdir. Ancak, `felt252`'nin aksine, bu tiplere negatif bir sayısal ifade atanamaz:

```rust {.codebox}
fn main() {
    let x: felt252 = -232; // Bu sorun değil
    let y: u32 = -232;     // Bu sorun yaratır
}
```

Bu program bir derleme hatasıyla sonuçlanır :

```console
error: Trait has no implementation in context: core::traits::Neg::<core::integer::u32>
 --> test.cairo:3:18
    let y: u32 = -232;
                 ^**^
```
