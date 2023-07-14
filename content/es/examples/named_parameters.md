---
title: "Parametros nombrados"
weight: 45
draft: false
---

Los _parámetros nombrados_ (_named parameters_) le permiten especificar los nombres de los argumentos al llamar a una función.
Si quieres usar parámetros nombrados, tienes que especificar el nombre del parámetro y el valor que quieres pasarle.
Notar que aún se requiere que estén en el mismo orden en que fueron declarados.

```rust {.codebox}
fn foo(x: u8, y: u8) {
    // ...
}

fn main() {
    let first_arg = 3;
    let second_arg = 4;
    // parameter_name: value
    foo(x: first_arg, y: second_arg);
    // foo(y: second_arg, x: first_arg); <- this would produce an error
}
```

Si le pasas una variable con el mismo nombre que el parámetro, puedes usar una sintaxis más corta:

```rust {.codebox}
fn foo(x: u8, y: u8) {
    // ...
}

fn main() {
    let x = 1;
    let y = 2;
    foo(:x, :y);
}
```
