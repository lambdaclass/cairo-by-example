---
title: "assert"
weight: 20
draft: false
---
To make sure our tests work, we use assert.

```rust {.codebox}
fn main(x: felt252, y: felt252) {
    assert(x != y, 'error, x is equal to y');
}

#[test]
fn test_main() {
    main(1,2);
}
```

The first argument of assert is the condition we want to check, and the second is a message we will see on the console if the condition is false.

Run ```cairo-test file_name```

Try changing it so that the test fails.
