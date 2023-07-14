---
title: "Comentarios"
weight: 250
draft: false
---

En los programas Cairo, cualquier texto después de un par de barras inclinadas (`//`) y hasta el final de la línea será ignorado por el compilador.

Puedes usar esto para dejar comentarios explicativos en tu código.

```rust {.codebox}
fn main() -> felt252 {
    // start of the function
    1 + 4 // return the sum of 1 and 4
}
```
