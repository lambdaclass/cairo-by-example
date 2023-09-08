---
title: "clone and copy"
weight: 290
draft: false
---

Cairo'nun sahiplik kuralları nedeniyle, verilerin nasıl kopyalanabileceğini belirtmek önemlidir. Bunun için `Clone` ve `Copy` özellikleri kullanılır. `Clone`, bir tür örneğinin nasıl klonlanabileceğini belirtir, yani verileri kopyalar ve yeni bir sahiplik atar. `Clone` tarafından belirtilen davranış isteğe bağlı olarak karmaşık olabilir. Bunun yerine, `Copy` `Clone`'u gerektirir ve bir türün bit düzeyinde kopyalanabileceğini belirtir, yani klonlama mekanizması basit ve belirlidir, rastgele değildir.

Sahiplik örneğinden:

```rust {.codebox}
use array::ArrayTrait;
use clone::Clone;
use array::ArrayTCloneImpl;

fn foo(arr: Array<u128>) {
    // foo, dizinin sahipliğini alır.
    // Bu fonksiyon döndüğünde, arr düşer (dropped).
}

fn main() {
    // arr'ın yaratıcısı olarak, main fonksiyonu arrayin sahibidir.
    let arr = ArrayTrait::<u128>::new();

    foo(arr.clone()); // bir klonun sahipliğini fonksiyon çağrısına geçirir

    foo(arr); // daha önceden arrayin kopyası alındığı için derlenir
    
    // foo(arr); <- artık başarısız olur, çünkü main artık arrayin sahibi değildir
}
```
Denemek için terminalinizde `cairo-run clone_copy.cairo --available-gas 20000` komutunu çalıştırın.

Copy özelliği kullanarak bir örneğin türetilmesi örneği:

```rust {.codebox}
use clone::Clone;

#[derive(Copy, Clone, Drop)]
struct Vector2 {
    x: u32,
    y: u32,
}
// u32 da Copy türetilir

fn main() {
    let v = Vector2 { x: 1, y: 0 };
    let w = v;

    // şimdi w, v'nin bir kopyasıdır, v hala erişilebilirdir
}
```
Örneği terminalinizde `cairo-run clone_copy_2.cairo --available-gas 20000` komutuyla çalıştırın.
