---
title: "functions"
weight: 40
draft: false
---

Bir fonksiyon, bazı mantığı gerçekleştiren bir kod birimidir. `fn` anahtar kelimesi kullanılarak tanımlanır.

Examples of functions are:

```rust {.codebox}
// This functions doesn't return anything.
fn main() {
    let x = 3;
}

// This function returns an u32.
fn inc(x: u32) -> u32 {
    x + 1
}
```

Cairo'nun kuralına göre, fonksiyonları 'snake_case' formunda adlandırılır. Yukarıdaki örnekte, fonksiyonun adı `inc_n`'dir.

Cairo'da fonksiyonlar her zaman bir değer döndürür. Fonksiyonun belirli bir dönüş değeri olmadığında, genellikle birim tipi (()) döndürmek yaygındır.
