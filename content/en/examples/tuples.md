---
title: "tuples"
weight: 210
draft: false
---

A `tuple` in Cairo allows us to group multiple values with a variety of types into a single element with a fixed length that can't be changed after its declaration.

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

Here is an example using tuples where we declare a rectangular prism with its side dimensions as items of the tuple and then calculate its volume.

```rust {.codebox}
use debug::PrintTrait;
fn main() {
    let rectangular_prism = (50, 20, 10); // W x L x H
    let v = volume(rectangular_prism);
    v.print(); // This result is shown in hexadecimal (e.g 10000 = 0x2710)
}

fn volume(sides: (u64, u64, u64)) -> u64 {
    let (x, y, z) = sides;
    x * y * z
}
```
To run the program, use `cairo-run filename.cairo`.

For further explanation about this topic, [check the Cairo Book](https://cairo-book.github.io/ch02-02-data-types.html?highlight=tuple#the-tuple-type).
