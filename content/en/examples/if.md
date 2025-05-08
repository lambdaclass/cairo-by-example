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

[Open in Cairo Playground](<https://cairovm.codes/?codeType=Cairo&code=%27uskdebug%3A%3APWTraitXqfn%20mainY%20(~letj%3A%20u8%20%3D%202Vletx%3D%20trueX~ifx%26%26j%20%3E%200%20ZLets%20code%27%3Ay%20elskZGreat%20things%20arkcomingyq)%27~qzzz%20%20y%22.pWYV)x%20is_awesomkq%5Cnke%20j%20versionZ(~zz%22Y%7B%7DX%3BqWrintV%3B~%01VWXYZjkqxyz~_>)
