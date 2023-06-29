---
title: "snapshots"
weight: 310
draft: false
---

Snapshots provide read-only instances of an object without taking ownership when passed to a function. Every type `T` has a snapshot version `@T`, which is always droppable and duplicatable.

To create a snapshot of a value `x` of type `T`, simply use `@x`.

```rust {.codebox}
use array::ArrayTrait;
use option::OptionTrait;
use box::BoxTrait;

// Receives an array snapshot
fn sum_starting_two(data: @Array<u32>) -> u32 {
    //data.append(5_u32); <- This will fail, as data is read-only
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
