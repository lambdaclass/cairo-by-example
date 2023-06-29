---
title: "felt252"
date: 2023-06-22T12:25:00-06:00
draft: false
---

El tipo de datos básico en Cairo es `felt252`, que significa *field element*. Son números enteros en el rango `0 <= x < P`, donde `P` es un número primo grande, actualmente igual a `P = 2^{251} + 17 * 2^{192}+1`. 
Los elementos de campo tienen la propiedad de *envolverse* intencionadamente cuando su valor cae fuera del rango especificado, utilizan aritmética modular.

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    let x: felt252 = 2;
    let y: felt252 = 5;
    (x + y).print();
}
```

Dado que `felt252` es el tipo de datos por defecto, en casos sencillos como éste no es realmente necesario especificar el tipo.
Esto significa que podemos simplemente escribir:

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    let x = 2;
    let y = 5;
    (x + y).print();
}
```
