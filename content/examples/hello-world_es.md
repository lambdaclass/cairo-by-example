---
title: "Hola, mundo!"
date: 2023-06-22T12:00:00-06:00
draft: false
---


La palabra reservada `use` importa una dependencia en el alcance (scope).

```rust {.codebox}

use debug::PrintTrait;

fn main() {
    'Hola, Mundo!'.print();
}

```
Ahora, corré el test con `cairo-run hola_mundo.cairo`

```bash
[DEBUG] Hola, Mundo!                    (raw: 0x486f6c612c204d756e646f21

Run completed successfully, returning []
```