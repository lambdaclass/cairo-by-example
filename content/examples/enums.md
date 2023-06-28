---
title: "enums"
weight: 200
draft: false
---

An enum in Cairo works like a tagged union, variants can hold values inside, which you can access via pattern matching.

You can work with enums like this:

```rust {.codebox}
use option::Option;
use option::OptionTrait;

// Define an enum
enum MyEnum {
    A: u8,
    B: u16,
    C: u32,
    D: u64
}

// Construct and return an enum variant.
fn my_enum_a() -> MyEnum {
    MyEnum::A(4_u8)
}

// Match the enum, the order must match the enum definition.
// Option is also an enum.
fn my_enum_get_b(x: MyEnum) -> Option::<u16> {
    match x {
        MyEnum::A(x) => Option::None(()),
        MyEnum::B(x) => Option::Some(x),
        MyEnum::C(x) => Option::None(()),
        MyEnum::D(x) => Option::None(()),
    }
}
```
