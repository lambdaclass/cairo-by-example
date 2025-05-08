---
title: "generics"
weight: 300
draft: false
---

Generic tipler, farklı veri tipleriyle kullanılabilecek tanımlamalar oluşturmamıza olanak tanır.

Cairo'da, fonksiyonlar, `struct`'lar, `enum`'lar, `trait`'ler, `implementation`'lar ve `method`'lar tanımlanırken `generic`'lerden yararlanabilirsiniz

Generic bir fonksiyon örneği:

```rust {.codebox}
// Bu fonksiyonu herhangi bir tamsayıyla (ör. u8, u32, u256) karşılaştırmak için   kullanabiliriz
fn largest<T>(t1: T, t2: T) -> T {
    if t1 > t2 {
        t1
    } else {
        t2
    }
}
```

Önceki fonksiyonu çalıştırmaya çalıştığınızda, `Trait has no implementation in context ...` gibi bir derleyici hatası alabilirsiniz, bunun nedeni, çeşitli nedenlerle bazı trait'lerin uygulanması gerektiğini derleyicinin talep etmesidir.

Örneğimizde 3 trait uygulamamız gerekiyor:

- `PartialOrd`: Karşılaştırma işlemi için
- `Drop`: Döndürülmeyen değeri bıraktığımız için
- `Copy`: Fonksiyon girdilerini taşımak için

Önceki örneğin düzeltilmiş hali:

```rust {.codebox}
fn largest<
    T,
    impl TOrd: PartialOrd<T>,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>
    >(t1: T, t2: T) -> T {
    if t1 > t2 {
        t1
    } else {
        t2
    }
}
```

İşte tam bir örnek:

```rust {.codebox}
// Bu fonksiyonu herhangi bir tamsayıyla (ör. u8, u32, u256) karşılaştırmak için kullanabiliriz
fn largest<
    T,
    impl TOrd: PartialOrd<T>,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>
    >(t1: T, t2: T) -> T {
    if t1 > t2 {
        t1
    } else {
        t2
    }
}

//  Sonucu kontrol etmek için çalıştırabilirsiniz
fn main() -> u8 {
    let a: u8 = 1;
    let b: u8 = 2;
    largest(a, b)
}
```
Örneği `cairo-run generics.cairo` komutunu kullanarak çalıştırabilirsiniz
