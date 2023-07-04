---
title: "named parameters"
weight: 45
draft: false
---

Named parameters allow you to specify the names of arguments when you call a function.
If you want to use named parameters, you need to specify the name of the parameter and the value you want to pass it.
Note that they still need to be in the same order as declared in the function.

```rust {.codebox}
fn foo(x: u8, y: u8) {
    // ...
}

fn main() {
    let first_arg = 3;
    let second_arg = 4;
    // parameter_name: value
    foo(x: first_arg, y: second_arg);
    // foo(y: second_arg, x: first_arg); <- this would produce an error
}
```

If you pass a variable with the same name as the parameter, you can use a shorter syntax:

```rust {.codebox}
fn foo(x: u8, y: u8) {
    // ...
}

fn main() {
    let x = 1;
    let y = 2;
    foo(:x, :y);
}
```
