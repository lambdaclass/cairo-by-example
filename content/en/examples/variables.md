---
title: "variables"
weight: 30
draft: false
---

<!-- !test program
cat > /tmp/program.cairo
cairo-test /tmp/program.cairo -->

To store data in variables with the let keyword but you will not be able to change the value of said variables.

if you need to change that data, it must be a mutable variable with let mut

<!-- !test in variables -->
```rust {.codebox}
fn main() {
    let immutable_var: felt252 = 17;
    // immutable_var = 38;  <-- fails to compile

    // but this is legal:
    let mut mutable_var: felt252 = immutable_var;
    mutable_var = 38;

    assert(mutable_var != immutable_var, 'mutable equals immutable');
}

#[test]
fn test_main() {
    main();
}
```

<!-- !test out variables -->
```bash
running 1 tests
test program::program::test_main ... ok
test result: ok. 1 passed; 0 failed; 0 ignored; 0 filtered out;
```
