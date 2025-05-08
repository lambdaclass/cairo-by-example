---
title: "naming convention"
weight: 330
draft: false
---

Cairo, diğer birçok dil gibi, net bir şekilde tanımlanmış bir isimlendirme kuralına sahiptir. Buna uymak önerilir çünkü hem kod yazanlar hem de okuyanlar için alıştıktan sonra yardımcı olacaktır.

```rust {.codebox}
use core::debug::PrintTrait;

// Modüller snake_case isimlendirme kullanır.
mod sample_module {}

// Türler PascalCase kullanır. Bu, enumlar, structlar, traitler ve trait
// uygulamalarını içerir.
type FeltAlias = felt252;

// Tür parametreleri de türdür, bu yüzden PascalCase kullanırlar,
// ancak genellikle tek harflerdir, burada kullanılan T gibi.
trait SomeAction<T> {
    fn trigger_action(self: T);
}

// Enum varyantları da PascalCase kullanır:
enum MyEnum {
    VariantA: felt252,
    VariantB: (),
}

// Bununla birlikte, struct alanları snake_case kullanır.
struct MyStruct {
    field_a: felt252,
    field_b: u32,
}

// Fonksiyon ve metod isimleri snake_case kullanır.
fn a_method() {
    // Aynı isimlendirme kuralı değişkenler için de geçerlidir.
    let local_variable = 1234;
}

impl MyStructImpl of SomeAction<MyStruct> {
    fn trigger_action(self: MyStruct) {
        self.field_a.print();
        self.field_b.print();
    }
}

// Son olarak, sabitler UPPER_CASE isimlendirme kullanır.
const A_CONSTANT: felt252 = 1234;
```

Genellikle tanımlayıcılar alt çizgi (`_`) ile başlamamalıdır, ancak kullanılmak istenmeyen durumlarda derleyicinin programcının niyetini anlamasını ve kullanılmayan öğe uyarılarının yayınlanmasını önlemek için `_` ile başlamalıdır.
