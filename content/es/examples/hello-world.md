---
title: "hola mundo"
date: 2023-06-22T12:00:00-06:00
draft: false
---

La palabra reservada `use` importa una dependencia en el alcance (scope).

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    'Hello, world!'.print();
}
```

Ahora, corré el test con `cairo-run hola_mundo.cairo`

```bash
[DEBUG] Hello, world!                   (raw: 5735816763073854953388147237921)

Run completed successfully, returning []
```
