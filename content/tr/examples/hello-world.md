---
title: "hello world"
weight: 10
draft: false
---

`use` anahtar kelimesi, bir bağımlılığı etki alanına dahil eder.

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    'Hello, world!'.print();
}
```

Şimdi, testleri `cairo-run hello_world.cairo` ile çalıştırın.

```bash
[DEBUG] Hello, world!                   (raw: 5735816763073854953388147237921)

Run completed successfully, returning []
```
