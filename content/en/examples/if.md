---
title: "if expression"
weight: 50
draft: false
---

An `if expression` is a control flow construct that allow us to conditionally execute a piece of code depending on the value of a boolean condition. Since it is an expression, it returns the value of the last expression in the branch.

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    let is_awesome = true;

    if is_awesome {
        'Cairo is awesome!'.print();
    }
}
```

You can combine several conditions using boolean operators like `&&` (and), `||` (or), etc.
You can also add an optional else-branch like in many other programming languages.

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    let version: u8 = 2;
    let is_awesome = true;

    if is_awesome && version > 0 {
        'Lets code!'.print();
    } else {
        'Great things are coming'.print();
    }
}
```
