---
title: "strings"
date: 2023-06-21
draft: false
---
In Cairo, a string is a collection of characters stored in a Felt252. Strings can have a maximum length of 31 characters.

Examples of strings:

```rust {.codebox}
use debug::PrintTrait;
fn main() {
    let x = 'Cairo is awesome';
    x.print();
    let c = 'A';
    c.print();
}
```

Run ```cairo-run file_name``` to test this example
