---
title: "functions"
weight: 40
draft: false
---

<!-- !test program
cat > /tmp/program.cairo
cairo-run /tmp/program.cairo -->

A function is a unit of code that performs some logic. It is defined using the `fn` keyword.

Examples of functions are:

<!-- !test in functions -->
```rust {.codebox}
use debug::PrintTrait;

// This function doesn't return anything.
fn main() {
    let three = 3;
    let four = inc(three);

    four.print();
}

// This function returns an u32.
fn inc(x: u32) -> u32 {
    x + 1
}
```

<!-- !test out functions -->
```bash
[DEBUG]	                              	(raw: 4)

Run completed successfully, returning []
```

The Cairo convention is to name functions using the 'snake_case' form. In the example above, the function name is `inc_n`.

Note that in Cairo, functions always return a value. When the function has no particular return value, it is common to return the unit type (`()`).
