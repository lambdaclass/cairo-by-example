---
title: "testing"
weight: 320
draft: false
---

Tests are functions that verify that code is working as expected. These functions have to be annotated with `#[test]`

Any code that panics will cause a test to fail. As a programmer you usually want to write a test by setting up an initial state, performing some computation, and asserting the result is as you expected.

For example:

```rust {.codebox}
#[test]
fn test_passes() {
    let result = 2 + 2;
    assert(result == 4, 'result is not 4'); 
}
```

You can also annotate tests that are supposed to fail with `#[should_panic]`:

```rust {.codebox}
#[test]
#[should_panic]
fn test_should_fail() {
    let a: u8 = 255;
    let b: u8 = a + 1; // panics due to overflow
}
```

To run any test, you can use the `cairo-test` command.

```console
$ cairo-test .
running 2 tests
test test_crate::test_passes ... ok
test test_crate::test_should_fail ... ok
test result: ok. 2 passed; 0 failed; 0 ignored; 0 filtered out;
```

Note: For this to work there needs to be a`cairo_project.toml` file. This is the configuration file for "vanilla" Cairo projects (i.e. not managed by Scarb), which is required to run the `cairo-test .` command to run the code of the crate. The content of the file is:

```toml
[crate_roots]
test_crate = "src"
```

Which indicates that the crate named "test_crate" is located in the `src` directory. Any Cairo file in the crate will be tested any time you run `cairo-test`.
