---
title: "naming convention"
weight: 330
draft: false
---

Cairo, like many other languages, has a clearly defined naming convention. It is
advised to follow it since it'll help both code writers and readers after
getting used to it.

```rust {.codebox}
use core::debug::PrintTrait;

// Modules use snake_case naming.
mod sample_module {}

// Types use PascalCase. This includes enums, structs and traits and trait
// implementations.
type FeltAlias = felt252;

// Type parameters are types too, so they also use PascalCase, although they are
// generally single letters, like the `T` used here.
trait SomeAction<T> {
    fn trigger_action(self: T);
}

// Enum variants use PascalCase too:
enum MyEnum {
    VariantA: felt252,
    VariantB: (),
}

// However struct fields use snake_case instead.
struct MyStruct {
    field_a: felt252,
    field_b: u32,
}

// Functions and methods's names use snake_case.
fn a_method() {
    // The same naming convention applies to variables too.
    let local_variable = 1234;
}

impl MyStructImpl of SomeAction<MyStruct> {
    fn trigger_action(self: MyStruct) {
        self.field_a.print();
        self.field_b.print();
    }
}

// Finally, constants are an exception as they use UPPER_CASE naming.
const A_CONSTANT: felt252 = 1234;
```

Usually, identifiers shouldn't start with an underscore (`_`), however when they
aren't intended to be used they should start with `_` so that the compiler
understands the programmer's intention and avoids emitting unused item warnings.
