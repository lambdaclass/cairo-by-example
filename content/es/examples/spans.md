---
title: "Spans"
weight: 245
draft: false
---

La estructura `Span` es una instantánea (o snapshot) de un `arreglo`
Todos los métodos para arreglos pueden usarse para esta estructura, con la excepción del método `append()`.

Para crear el `Span` de un `arreglo`, use el método `span()`.

Modificación del ejemplo [snapshots](./snapshots.md):

```rust {.codebox}
use array::ArrayTrait;
use array::SpanTrait;

// Recibe un span
fn sum_starting_two(dato: Span<u32>) -> u32 {
    // dato.append(5_u32); <- Esto falla!
    *dato[0] + *dato[1]
}

fn main() -> u32 {
    let mut dato: Array<u32> = ArrayTrait::new();
    dato.append(1_u32);
    dato.append(2_u32);
    dato.append(3_u32);
    dato.append(4_u32);
    dato.get(0);
    sum_starting_two(dato.span()) // Usando el span
}
```
