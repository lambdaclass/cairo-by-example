---
title: "booleanos"
weight: 85
draft: false
---

Como los tipos booleanos de otros lenguajes de programación, los `bool`s tienen solo dos posibles valores: `true` (verdadero) y `false` (falso).

```rust {.codebox}
fn main() {
    let t: bool = true;
    let verdadero = 5 == 5;
    assert(t == verdadero, 'esto es verdadero');

    let f: bool = false;
    let falso = 7 == 5;
    assert(f == falso, 'esto es falso');
}
```

Como con otros tipos escalares, tienen el tamaño de un `felt252`.
