---
title: "booleans"
weight: 85
draft: false
---

Diğer programlama dillerinde olduğu gibi, `bool` tipi de yalnızca `true` ve `false` olmak üzere iki olası değere sahiptir.

```rust {.codebox}
fn main() {
    let t: bool = true;
    let true_expr = 5 == 5;
    assert(t == true_expr, 'this is true');

    let f: bool = false;
    let false_expr = 7 == 5;
    assert(f == false_expr, 'this is false');
}
```

Diğer skaler tipler gibi, `bool` tipi de bir `felt252` boyutundadır.
