---
title: "felt252"
weight: 70
draft: false
---

El tipo de datos básico en Cairo es `felt252`, que hace referencia a los *field element*. Son números enteros en el rango `0 <= x < P`, donde `P` es un número primo grande, actualmente igual a `P = 2^{251} + 17 * 2^{192}+1`.
Los field element tienen la propiedad de *envolverse* intencionadamente cuando su valor cae fuera del rango especificado, utilizan aritmética modular.

```rust {.codebox}
fn main() {
    // máximo valor de felt252
    let x: felt252 = 3618502788666131213697322783095070105623107215331596699973092056135872020480;
    let y: felt252 = 1;
    assert(x + y == 0, 'P == 0 (mod P)');
}
```

Dado que `felt252` es el tipo de datos por defecto, en casos sencillos como éste no es realmente necesario especificar el tipo.
Esto significa que podemos simplemente escribir:

```rust {.codebox}
fn main() {
    // máximo valor de felt252
    let x = 3618502788666131213697322783095070105623107215331596699973092056135872020480;
    let y = 1;
    assert(x + y == 0, 'P == 0 (mod P)');
}
```
