---
title: "snapshots"
date: 2023-06-22T13:20:00-06:00
draft: false
---
Snapshots proporcionan instancias de sólo lectura de un objeto sin tomar propiedad cuando se pasan a una función. Cada tipo `T` tiene una versión snapshot `@T`, que siempre se puede soltar y duplicar.

Para crear una snapshot de un valor `x` de tipo `T`, basta con utilizar `@x`.

```rust {.codebox}
use array::Array;
use array::ArrayTrait;
use option::OptionTrait;
use box::BoxTrait;

// Receives an array snapshot
fn sum_starting_two(data: @Array<u32>) -> u32 {
    //data.append(5_u32); <- This will fail, asi data is read-only
    let first = *data.get(0).unwrap().unbox();
    let second = *data.get(1).unwrap().unbox();
    first + second

    //*data[0] + *data[1] <- also works
}

fn main() -> u32 {
    let mut data: Array<u32> = ArrayTrait::new();
    data.append(1_u32);
    data.append(2_u32);
    data.append(3_u32);
    data.append(4_u32);
    data.get(0);
    sum_starting_two(@data) // Using a snapshot instead of the mut variable
}
```
