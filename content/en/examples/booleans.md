---
title: "booleans"
weight: 85
draft: false
---

As with Boolean types in other programming languages, `bool`s have only two possible values: `true` and `false`.

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

As with other scalar types, they are one `felt252` in size.
