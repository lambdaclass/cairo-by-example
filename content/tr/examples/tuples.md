---
title: "tuples"
weight: 210
draft: false
---

Cairo'da `tuple`, çeşitli tiplere sahip birden çok değeri tek bir öğe olarak gruplamamızı sağlar ve bildiriminden sonra değiştirilemez bir sabit uzunluğa sahiptir.

```rust {.codebox}
fn main() {
    // Tuple'ın her konumunu ve türünü açıkça belirtebilirsiniz
    let tup: (u32, u64, bool) = (8, 65, false);
    // Veya türleri belirtmeden de tanımlanabilir
    let tup = (false, 2, 70);

    // Tuple, tek bir öğe olarak kabul edildiği için
    // desen eşleme kullanarak tek tek öğeleri alabilirsiniz
    let (x, y, z) = tup; 
    // Tuple'ı bildirirken de bunu yapabilirsiniz
    let (x, y): (felt252, felt252) = (2, 3);
}
```

İşte bir tuple kullanarak bir dikdörtgenin kenar ölçüleriyle birlikte bildirildiği ve ardından hacmini hesaplayan bir örnek:

```rust {.codebox}
use debug::PrintTrait;
fn main() {
    let rectangle = (50, 20, 10); // W x L x H
    let v = volume(rectangle);
    v.print(); // Bu sonuç onaltılık olarak gösterilir (ör. 10000 = 0x2710)
}

fn volume(sides: (u64, u64, u64)) -> u64 {
    let (x, y, z) = sides;
    x * y * z
}
```
Programı çalıştırmak için `cairo-run filename.cairo` komutunu kullanın.

Bu konu hakkında daha fazla açıklama için[ Cairo Book](https://cairo-book.github.io/ch02-02-data-types.html?highlight=tuple#the-tuple-type)'a bakabilirsiniz.
