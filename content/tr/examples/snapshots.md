---
title: "snapshots"
weight: 310
draft: false
---

Snapshots, bir nesnenin sahipliğini almadan salt okunur bir örneği sağlar. Her `T` türü, her zaman bırakılabilir ve kopyalanabilir olan bir anlık sürüm `@T`'ye sahiptir.

Tür `T`'nin bir değeri `x`'in anlık bir sürümünü oluşturmak için, basitçe `@x` kullanılır.

```rust {.codebox}
use array::ArrayTrait;
use option::OptionTrait;
use box::BoxTrait;

// Bir dizi anlık sürümünü alır
fn sum_starting_two(data: @Array<u32>) -> u32 {
    //data.append(5_u32); <- data salt okunur olduğu için bu başarısız olur
    let first = *data.get(0).unwrap().unbox();
    let second = *data.get(1).unwrap().unbox();
    first + second

    //*data[0] + *data[1] <- aynı şekilde çalışır
}

fn main() -> u32 {
    let mut data: Array<u32> = ArrayTrait::new();
    data.append(1_u32);
    data.append(2_u32);
    data.append(3_u32);
    data.append(4_u32);
    data.get(0);
    sum_starting_two(@data) // Değişken yerine bir snapshot kullanma
}
```
