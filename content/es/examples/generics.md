---
title: "Genericos"
weight: 300
draft: false
---

Los tipos genéricos nos permiten crear definiciones que pueden ser usadas con diferentes tipos de datos.

En Cairo, puedes usar genéricos cuando defines `functions`, `structs`, `enums`, `traits`, `implementations`, y `methods`.

Ejemplo de una función genérica:

```rust {.codebox}
// We can use this function to compare any integer (e.g. u8, u32, u256)
fn largest<T>(t1: T, t2: T) -> T {
    if t1 > t2 {
        t1
    } else {
        t2
    }
}
```

Si has intentado ejecutar la función anterior, es posible que hayas tenido un error del compilador diciendo `Trait has no implementation in context ...`, esto sucede porque el compilador requiere que algunos traits deben ser implementados por diversas razones.

En nuestro ejemplo debemos implementar 3 traits:

- `PartialOrd`: Para que la comparación funcione
- `Drop`: Ya que estamos descartando el valor que no se devuelve
- `Copy`: Para mover las entradas de la función

Solución para el ejemplo anterior:

```rust {.codebox}
fn largest<
    T,
    impl TOrd: PartialOrd<T>,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>
    >(t1: T, t2: T) -> T {
    if t1 > t2 {
        t1
    } else {
        t2
    }
}
```

Ejemplo completo para testear:

```rust {.codebox}
// We can use this function to compare any integer (e.g. u8, u32, u256)
fn largest<
    T,
    impl TOrd: PartialOrd<T>,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>
    >(t1: T, t2: T) -> T {
    if t1 > t2 {
        t1
    } else {
        t2
    }
}

// You can check the result by running it
fn main() -> u8 {
    let a: u8 = 1;
    let b: u8 = 2;
    largest(a, b)
}
```
