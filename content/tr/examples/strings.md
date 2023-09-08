---
title: "strings"
weight: 60
draft: false
---
Cairo'da, bir string bir felt252'de saklanan karakterlerin bir koleksiyonudur. Stringlerin maksimum uzunluğu 31 karakter olabilir.

String örnekleri:

```rust {.codebox}
use debug::PrintTrait;
fn main() {
    let x = 'Cairo is awesome';
    x.print();
    let c = 'A';
    c.print();
}
```

Bu örneği çalıştırmak için önce kodu yeni bir dosyaya kopyalayın, ardından terminalinizde ```cairo-run dosya_adı``` komutunu çalıştırın.
