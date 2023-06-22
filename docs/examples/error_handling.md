---
title: "error_handling"
date: 2023-06-21T16:52:30-06:00
draft: false
---

# Unrecoverable errors

## Panic

Panics cause the program to abruptly end with an error code. They can be caused indirectly by the code itself, for example by unwrapping an Option, or by directly invoking the `panic` function, which takes an array of felts as error code.

```
use array::ArrayTrait;

fn main() {
    let mut data = ArrayTrait::new();
    data.append(7);
    panic(data)
}
```
The `panic_with_felt252` function can also be used if the error code is only one felt.

```
fn main() {
    panic_with_felt252(7)
}
```

Both of these examples will result in the output:

```
Run panicked with [7 (''), ].
```

A third way to cause panics is to use the `panic_with` macro. This macro can be used on functions that return either `Option` or `Result`. It takes an error code and a function name, and will create a wrapper for the original function given the function name that will panic with the given error code if the original function were to return `Option::None` or `Result::Err`

```
use option::OptionTrait;

#[panic_with('Zero Division Error', div)]
fn safe_div(a: u16, b: u16) -> Option<u16> {
    if b == 0 {
        Option::None(())
    } else {
        Option::Some(a/b)
    }
}

fn main() {
    safe_div(1, 0); // this returns None
    div(1, 0); // this panics with 'Zero Division Error'
}
```

## Assert

The assert function can be used to check that a boolean expression holds true during runtime, and panic if holds false. The assert function takes a boolean expression and a short string (the size of a felt) as error code.

```
fn main() {
    assert ( 2 == 1, 'Assertion Failed')
}
```
