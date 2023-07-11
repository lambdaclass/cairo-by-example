---
title: "field arithmetic"
weight: 72
draft: false
---

Because they use modular arithmetic, some operations of the `felt252` type may seem unusual.
Some things to consider:

### A `felt252` must be less than the Cairo prime

The following code:

```rust {.codebox}
fn main() {
    let cairo_prime: felt252 = 3618502788666131213697322783095070105623107215331596699973092056135872020481;
}
```

fails to compile with:

```bash
error: The value does not fit within the range of type core::felt252.
```

### Operations are done modulo the *Cairo prime*

Expanding on the `felt252` example:

```rust {.codebox}
fn main() {
    // max value of felt252 (P - 1)
    let x = 3618502788666131213697322783095070105623107215331596699973092056135872020480;
    assert(x + 1 == 0, '(P - 1) + 1 == 0 (mod P)');
    // assert(x == -1, 'negation is modular'); <- still not supported
    assert(x == 0 - 1, 'subtraction is modular');
    assert(x * x == 1, 'multiplication is modular');
}
```

### Division is **not** *floored division* (it's **field** division)

This means that `a / b = c` if and only if `a = c * b`, which can lead to unexpected results:

```rust {.codebox}
use traits::TryInto;
use option::OptionTrait;

fn main() {
    let two = TryInto::try_into(2).unwrap();

    assert(felt252_div(2, two) == 1, '2 == 1 * 2');

    // (P + 1) / 2
    let half_prime_plus_one = 1809251394333065606848661391547535052811553607665798349986546028067936010241;
    assert(felt252_div(1, two) == half_prime_plus_one, '1 == ((P + 1) / 2) * 2 (mod P)');
}
```

**Note**: currently, `felt252` division has to be done explicitly via the external `felt252_div` function
