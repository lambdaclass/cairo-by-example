---
title: "Strings"
weight: 60
draft: false
---
En Cairo, un string es una colección de caracteres almacenados en un Felt252. Pueden tener una longitud máxima de 31 caracteres.

Ejemplos de strings:

```rust {.codebox}
use debug::PrintTrait;
fn main() {
    let x = 'Cairo is awesome';
    x.print();
    let c = 'A';
    c.print();
}
```

Para ejecutar este ejemplo, primero copia el código en un nuevo archivo y luego ejecuta ```cairo-run nombre_archivo``` en tu terminal.
