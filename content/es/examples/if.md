---
title: "If"
weight: 50
draft: false
---

Una expresión `if` es una construcción de flujo de control que nos permite ejecutar condicionalmente un trozo de código dependiendo del valor de una condición booleana. Al ser una expresión, devuelve el valor de la última expresión de la rama.

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    let is_awesome = true;

    if is_awesome {
        'Cairo is awesome!'.print();
    }
}
```

Puede combinar varias condiciones utilizando operadores booleanos como `&&` (and), `||` (or), etc.
También puedes añadir una else-branch opcional como en muchos otros lenguajes de programación.

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
