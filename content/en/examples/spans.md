---
title: "spans"
weight: 350
draft: false
---

`Span` is a struct that represents a snapshot of an `Array`.
All methods provided by `Array` can also be used with `Span`, with the exeption of the `append()` method.

To create a `Span` of an `Array`, simply call the `span()` method.

Modifying the example from the [snapshots](./snapshots.md) example

```rust {.codebox}
use array::ArrayTrait;
use array::SpanTrait;

// Receives a Span
fn sum_starting_two(data: Span<u32>) -> u32 {
    // data.append(5_u32); <- this fails
    *data[0] + *data[1]
}

fn main() -> u32 {
    let mut data: Array<u32> = ArrayTrait::new();
    data.append(1_u32);
    data.append(2_u32);
    data.append(3_u32);
    data.append(4_u32);
    data.get(0);
    sum_starting_two(data.span()) // Using a Span
}
```
