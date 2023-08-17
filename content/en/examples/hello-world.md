---
title: "hello world"
weight: 10
draft: false
run_command: "cairo-run"
---

the `use` keyword imports a dependency into scope

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    'Hello, world!'.print();
}
```
running this will yield:
```bash
[DEBUG] Hello, world!                   (raw: 5735816763073854953388147237921)

Run completed successfully, returning []
```
