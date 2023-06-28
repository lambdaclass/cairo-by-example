---
title: "strings"
weight: 60
draft: false
---
In Cairo, a string is a collection of characters stored in a `felt252`. Strings can have a maximum length of 31 characters.

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

To run this example, first copy the code in a new file and then run ```cairo-run file_name``` in your terminal.
