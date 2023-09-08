---
title: "spans"
date: 2023-06-21T11:05:00-03:00
draft: false
---

`Span`, bir `Array`'in anlık bir görüntüsünü temsil eden bir yapıdır. `Array` tarafından sağlanan tüm yöntemler, `append()` yöntemi hariç olmak üzere `Span` ile de kullanılabilir.

Bir `Array`'in `Span`'ını oluşturmak için `span()` yöntemini kullanmanız yeterlidir.

[Snapshots](./snapshots.md) örneğindeki örneği değiştirme:


```rust {.codebox}
use array::ArrayTrait;
use array::SpanTrait;

// Bir Span alır
fn sum_starting_two(data: Span<u32>) -> u32 {
    // data.append(5_u32); <- bu başarısız olur
    *data[0] + *data[1]
}

fn main() -> u32 {
    let mut data: Array<u32> = ArrayTrait::new();
    data.append(1_u32);
    data.append(2_u32);
    data.append(3_u32);
    data.append(4_u32);
    data.get(0);
    sum_starting_two(data.span()) // Bir Span kullanma
}
```
