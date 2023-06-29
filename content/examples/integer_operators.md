---
title: "integer-operators"
date: 2023-06-27T16:52:30-06:00
draft: false
---
# Integer Operators

Operators are symbols that represent mathematical and logical operations. Some of them can be overloaded by implementing their trait.

Operator overloading example:

```rust
struct MyFelt {
    val: felt252
}

impl MyFeltAdd of Add<MyFelt> {
    fn add(lhs: MyFelt, rhs: MyFelt) -> MyFelt {
        MyFelt { val: lhs.val + rhs.val }
    }
}

fn main() {
    // By implementing the `Add` trait for my custom type I was alble to overload the `+` operator
    let sum = MyFelt {val: 5} + MyFelt { val: 2 };
    assert( sum.val == 7, 'Operator Overload');
}
```

Examples of operator usage:

```rust
fn main() {
    // Operator `!` represents `Not`
    // Not overloadable & only implemented for `bool`
    let not_true = !true;
    assert( not_true == false, 'Operator !');

    // Operator `!=` represents Nonequality Comparison
    // Supported on all primitive types
    // Can be overloaded by implementing `PartialEq`
    assert( 17 != 15, 'Operator !=');

    // Operator `==` represents Equality Comparison
    // Supported on all primitive types
    // Can be overloaded by implementing `PartialEq`
    assert( 17 == 17, 'Operator ==');

    // Operator `%` represents Arithmetic Remainder
    // Supported on all unsigned integer primitives except `felt252`
    // Can be overloaded by implementing `Rem`
    assert( (17_u16 % 5_u16) == 2_u16, 'Operator %');

    // Operator `%` represents Arithmetic Remainder and Assignement
    // Supported on all unsigned integer primitives except `felt252`
    // Can be overloaded by implementing `RemEq`
    let mut num = 17_u8;
    num %= 5_u8;
    assert( num == 2_u8, 'Operator %=');

    // Operator `&` represents Bitwise And
    // Only implemented for `bool`
    // Can be overloaded by implementing `BitAnd`
    assert( true & true, 'Operator &');
}
```
