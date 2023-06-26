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

To wrap up the topic of panics, the `nonpanic` notation can be used to indicate that a function will never panic. In order to use this notation, not only should the function not panic, but also the functions called by it must also be annotated with `nonpanic`

For example, this will compile:
```
fn get_number() -> u16 nopanic {
    17
}
```

But this will not:

```
fn get_number() -> u16 nopanic {
    panic_with_felt252('Unable to provide number')
}
```

With the following error:

```
error: Function is declared as nopanic but calls a function that may panic.
```

## Assert

The assert function can be used to check that a boolean expression holds true during runtime, and panic if holds false. The assert function takes a boolean expression and a short string (the size of a felt) as error code.

```
fn main() {
    assert ( 2 == 1, 'Assertion Failed')
}
```

# Recoverable errors with Result

Result is an enum with the variants `Ok` and `Err`, which behaves as any other enum

```
enum Result<T, E> {
    Ok: T,
    Err: E,
}
```

It also has specific behaviour added by the `ResultTrait`

```
trait ResultTrait<T, E> {
    /// If `val` is `Result::Ok(x)`, returns `x`. Otherwise, panics with `err`.
    fn expect<impl EDrop: Drop<E>>(self: Result<T, E>, err: felt252) -> T;
    /// If `val` is `Result::Ok(x)`, returns `x`. Otherwise, panics.
    fn unwrap<impl EDrop: Drop<E>>(self: Result<T, E>) -> T;
    /// If `val` is `Result::Err(x)`, returns `x`. Otherwise, panics with `err`.
    fn expect_err<impl TDrop: Drop<T>>(self: Result<T, E>, err: felt252) -> E;
    /// If `val` is `Result::Err(x)`, returns `x`. Otherwise, panics.
    fn unwrap_err<impl TDrop: Drop<T>>(self: Result<T, E>) -> E;
    /// Returns `true` if the `Result` is `Result::Ok`.
    fn is_ok(self: @Result<T, E>) -> bool;
    /// Returns `true` if the `Result` is `Result::Err`.
    fn is_err(self: @Result<T, E>) -> bool;
    /// Returns `true` if the `Result` is `Result::Ok`, and consumes the value.
    fn into_is_err<impl TDrop: Drop<T>, impl EDrop: Drop<E>>(self: Result<T, E>) -> bool;
    /// Returns `true` if the `Result` is `Result::Err`, and consumes the value.
    fn into_is_ok<impl TDrop: Drop<T>, impl EDrop: Drop<E>>(self: Result<T, E>) -> bool;
}
```

Usage example:

```
use result::ResultTrait;

fn safe_div(a: u16, b: u16) -> Result<u16, felt252> {
    if b == 0 {
        Result::Err('Zero Division Error')
    } else {
        Result::Ok(a/b)
    }
}


fn main() {
    safe_div(4, 0) // this returns Result::Err('Zero Division Error')
    safe_div(4, 2); // this returns Result::Ok(2)

    safe_div(4, 0).expect('Unexpected Error'); // This panics with "Unexpected Error"
    safe_div(4, 2).expect('Unexpected Error') // This returns 2

    safe_div(4, 0).unwrap(); // This panics with "Result::unwrap failed"
    safe_div(4, 2).unwrap(); // This returns 2

    safe_div(4, 0).expect_err('Unexpected Error'); // This returns 'Zero Division Error' as a felt252 (2015904348648541445689960557934493454709190514)
    safe_div(4, 2).expect_err('Unexpected Error'); // This panics with "Unexpected Error"

    safe_div(4, 0).unwrap_err(); // This returns 'Zero Division Error' as a felt252 (2015904348648541445689960557934493454709190514)
    safe_div(4, 2).unwrap_err(); // This panics with "Result::unwrap_err failed"

    safe_div(4, 0).is_ok() // This returns false
    safe_div(4, 2).is_ok() // This returns true

    safe_div(4, 0).is_err() // This returns true
    safe_div(4, 2).is_err() // This returns false
}
```

## The '?' Operator

If you need something as simple as `unwrap` without worrying about panics, then the `?` operator is the perfect tool for the job. The `?` operator can be used on functions that return either `Result` or `Option` to inmediately propagate the `Err` and `None` variants and return from the function. Using the `?` operator on `Ok` and `Some` variants will instead unwrap their inner values.

For example in `average_speed_as_felt`, if `safe_div` returns a `Result::Ok`, the `?` will just unwrap the inner value, but if it returns `Result::Err` then the function will end and that result will be returned.

```

use result::ResultTrait;

fn safe_div(a: u16, b: u16) -> Result<u16, felt252> {
    if b == 0 {
        Result::Err('Zero Division Error')
    } else {
        Result::Ok(a/b)
    }
}

fn average_speed_as_felt(time: u16, distance: u16) -> Result<felt252, felt252> {
    let average_speed = safe_div(distance, time)?; // Propagate the error
    Result::Ok(u16_to_felt252(average_speed))
}

fn main() {
    let average_speed = average_speed_as_felt(0, 20); // This will return Result::Err('Zero Division Error')
    let average_speed = average_speed_as_felt(2, 20); // This will return Result::Ok(10)
}
```
