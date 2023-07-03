---
title: "naming convention"
date: 2023-06-22T12:20:00-06:00
draft: false
---

Cairo, como muchos otros idiomas, tiene una convención de nomenclatura claramente definida. Se aconseja seguirla ya que ayudará tanto a los escritores de código como a los lectores después de
acostumbrarse a ella.

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

Por lo general, los identificadores no deben comenzar con un guión bajo (`_`), cuando no están destinados a ser utilizados deben comenzar con `_` para que el compilador entienda la intención del programador y evite emitir advertencias de elementos no utilizados.
