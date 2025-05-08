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

[Abierto en Cairo Playground](<https://cairovm.codes/?codeType=Cairo&code=%27uskdebug%3A%3APWTraitXqfn%20mainY%20(~letj%3A%20u8%20%3D%202Vletx%3D%20trueX~ifx%26%26j%20%3E%200%20ZLets%20code%27%3Ay%20elskZGreat%20things%20arkcomingyq)%27~qzzz%20%20y%22.pWYV)x%20is_awesomkq%5Cnke%20j%20versionZ(~zz%22Y%7B%7DX%3BqWrintV%3B~%01VWXYZjkqxyz~_>)
