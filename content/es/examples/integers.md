---
title: "integers"
date: 2023-06-22T12:26:00-06:00
draft: false
---

Aunque el tipo `felt252` es fundamental para el lenguaje Cairo, es altamente recomendable usar tipos `integer` siempre que sea posible.
Los tipos `integer` vienen con protección extra contra posibles vulnerabilidades en el código, como chequeos contra overflow.
Cada tipo tiene como sufijo el número de bits que ocupa la representación del número fijo.

He aquí un programa de ejemplo que declara una variable de cada tipo disponible, con el valor máximo de cada tipo:

```rust {.codebox}
fn main() {
    let a: u8 = 0xff;
    let b: u16 = 0xffff;
    let c: u32 = 0xffffffff;
    let c: usize = 0xffffffff; // same size as u32
    let d: u64 = 0xffffffffffffffff;
    let e: u128 = 0xffffffffffffffffffffffffffffffff;
    let f: u256 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
}
```

Nótese que todos ellos son **sin signo**, igual que `felt252`.
Pero, a diferencia de `felt252`, a estos tipos no se les puede asignar un literal negativo:

```rust {.codebox}
fn main() {
    let x: felt252 = -232; // This is OK
    let y: u32 = -232;     // This isn't
}
```

This program results in a compilation error:

```console
error: Trait has no implementation in context: core::traits::Neg::<core::integer::u32>
 --> test.cairo:3:18
    let y: u32 = -232;
                 ^**^
```
