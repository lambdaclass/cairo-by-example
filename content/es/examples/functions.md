---
title: "Funciones"
weight: 40
draft: false
---

Una función es una unidad de código que realiza alguna lógica. Se define con la palabra clave `fn`.

Ejemplos de funciones son:

```rust {.codebox}
// This functions doesn't return anything.
fn main() {
    let x = 3;
}

// This function returns an u32.
fn inc(x: u32) -> u32 {
    x + 1
}
```

La convención de Cairo es nombrar las funciones utilizando la forma 'snake_case'. En el ejemplo anterior, el nombre de la función es `inc_n`.

Observe que en Cairo, las funciones siempre devuelven un valor. Cuando la función no tiene un valor de retorno particular, es común devolver el tipo de unidad (`()`).
