---
title: "Tuplas"
weight: 210
draft: false
---

Una `tupla` en Cairo nos permite agrupar múltiples valores con una variedad de tipos en un único elemento con una longitud fija que no puede ser cambiada después de su declaración.

```rust {.codebox}
fn main() {
    // You can explicitly declare each position in the tuple and its type
    let tup: (u32, u64, bool) = (8, 65, false);
    // Or it can also be declared without specifying the types
    let tup = (false, 2, 70);

    // Because a tuple is considered a single element, you can
    // use pattern matching to retrieve individual items
    let (x, y, z) = tup; 
    // You can do this while declaring the tuple as well
    let (x, y): (felt252, felt252) = (2, 3);
}
```

He aquí un ejemplo utilizando tuplas en el que declaramos un rectángulo con sus dimensiones laterales como elementos de la tupla y luego calculamos su volumen.

```rust {.codebox}
use debug::PrintTrait;
fn main() {
    let rectangle = (50, 20, 10); // W x L x H
    let v = volume(rectangle);
    v.print(); // This result is shown in hexadecimal (e.g 10000 = 0x2710)
}

fn volume(sides: (u64, u64, u64)) -> u64 {
    let (x, y, z) = sides;
    x * y * z
}
```
Para ejecutar el programa, utilice `cairo-run filename.cairo`.

Para más explicaciones sobre este tema, [consulte el Cairo Book](https://cairo-book.github.io/ch02-02-data-types.html?highlight=tuple#the-tuple-type).
