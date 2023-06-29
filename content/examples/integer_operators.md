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

List of symbols representing integer operations:

