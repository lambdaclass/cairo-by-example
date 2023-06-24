---
title: "comments"
date: 2023-06-22T12:10:00-06:00
draft: false
---

In Cairo programs, any text after a pair of forward slashes (`//`) and until the end of the line will be ignored by the compiler.

You can use this to leave explanatory comments in your code.

```rust {.codebox}
fn main() -> felt252 {
    // start of the function
    1 + 4 // return the sum of 1 and 4
}
```
