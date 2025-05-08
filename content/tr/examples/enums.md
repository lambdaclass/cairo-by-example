---
title: "enums"
weight: 200
draft: false
---

Cairo'da enum, etiketli bir birlik gibi çalışır ve varyantlar içinde değerler tutabilir. Bu değerlere desen eşleme (pattern matching) aracılığıyla erişebilirsiniz.

Enum'larla şu şekilde çalışabilirsiniz

```rust {.codebox}
use option::OptionTrait;
use debug::PrintTrait;

// Bir enum tanımlayın
enum MyEnum {
    A: u8,
    B: u16,
    C: u32,
    D: u64
}

// 'Got something else' yazdıracaktır
fn main(){
    let x = my_enum_a();
    let y = my_enum_get_b(x);
    match y {
        Option::Some(x) => 'Got B'.print(),
        Option::None(()) => 'Got something else'.print(),
    } 
}

// Bir enum varyantını oluşturup döndürün.
fn my_enum_a() -> MyEnum {
    MyEnum::A(4_u8)
}

// Enum e eşle, sıralama enum tanımıyla eşleşmelidir
// Option da bir enum dur.
fn my_enum_get_b(x: MyEnum) -> Option::<u16> {
    match x {
        MyEnum::A(x) => Option::None(()),
        MyEnum::B(x) => Option::Some(x),
        MyEnum::C(x) => Option::None(()),
        MyEnum::D(x) => Option::None(()),
    }
}
```
Örneği denemek için terminalde `cairo-run enums.cairo` komutunu çalıştırmanız yeterlidir.
