---
title: "variables"
date: 2023-06-22T12:15:00-06:00
draft: false
---

Para almacenar datos en variables con la palabra clave let pero no podrás cambiar el valor de dichas variables.

Si necesitas cambiar esos datos, debe ser una variable mutable con let mut

```rust {.codebox}
fn main() {
    let immutable_var: felt252 = 17;
    // immutable_var = 38;  <-- fails to compile

    // but this is legal:
    let mut mutable_var: felt252 = immutable_var;
    mutable_var = 38;

    assert(mutable_var != immutable_var, 'mutable equals immutable');
}

#[test]
fn test_main() {
    main();
}
```
