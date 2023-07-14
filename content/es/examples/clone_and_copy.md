---
title: "clone y copy"
weight: 290
draft: false
---

Debido a las reglas de propiedad de Cairo, es necesario especificar cómo se pueden duplicar los datos. Para esto se usan los traits `Clone` y `Copy`. `Clone` especifica cómo una instancia de tipo puede ser *clonada*, es decir, sus datos son duplicados y asignados a un nuevo propietario. El comportamiento especificado por `Clone` puede ser **arbitrariamente complicado**. En cambio `Copy` requiere `Clone` y especifica que un tipo puede ser *bitwise-copiado*, lo que significa que su mecanismo de clonación es simple y conocido, en lugar de arbitrario.

Continuando con el ejemplo de "ownership":

```rust {.codebox}
use array::ArrayTrait;

fn foo(arr: Array<u128>) {
    // foo takes ownership of the array.
    // when this function returns, arr is dropped.
}

fn main() {
    // as the creator of arr, the main function owns the array
    let arr = ArrayTrait::<u128>::new();

    foo(arr.clone()); // moves ownership of a clone of arr to function call

    foo(arr); // compiles because previously the array was duplicated
    
    // foo(arr); <- fails to compile, as main doesn't own the array anymore
}
```
Para correr ejemplo ejecuta en tu terminal `cairo-run clone_copy.cairo --available-gas 20000`

Un ejemplo de derivación del trait Copy:

```rust {.codebox}
use clone::Clone;

#[derive(Copy, Clone, Drop)]
struct Vector2 {
    x: u32,
    y: u32,
}
// u32 derives Copy too

fn main() {
    let v = Vector2 { x: 1, y: 0 };
    let w = v;

    // now w is a copy of v, v is still accesible
}
```
Pruebalo corriendo `cairo-run clone_copy_2.cairo --available-gas 20000` en tu terminal.
