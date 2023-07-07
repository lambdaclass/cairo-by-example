---
title: "generics"
weight: 300
draft: false
---

Generic types allow us to create definitions that may be used with different data types.

In Cairo, you can use generics when defining `functions`, `structs`, `enums`, `traits`, `implementations`, and `methods`.

Example of a generic function:

```rust {.codebox}
// We can use this function to compare any integer (e.g. u8, u32, u256)
fn largest<T>(t1: T, t2: T) -> T {
    if t1 > t2 {
        t1
    } else {
        t2
    }
}
```

If you tried to run the previous function, you might had a compiler error saying `Trait has no implementation in context ...`, this happens because the compiler requires that some traits must be implemented for various reasons.

In our example we must implement 3 traits:

- `PartialOrd`: For the comparison to work
- `Drop`: Since we are dropping the value that is not returned
- `Copy`: To move the function inputs

Fix for the previous example:

```rust {.codebox}
fn largest<
    T,
    impl TOrd: PartialOrd<T>,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>
    >(t1: T, t2: T) -> T {
    if t1 > t2 {
        t1
    } else {
        t2
    }
}
```

Here is a full example:

```rust {.codebox}
// We can use this function to compare any integer (e.g. u8, u32, u256)
fn largest<
    T,
    impl TOrd: PartialOrd<T>,
    impl TDrop: Drop<T>,
    impl TCopy: Copy<T>
    >(t1: T, t2: T) -> T {
    if t1 > t2 {
        t1
    } else {
        t2
    }
}

// You can check the result by running it
fn main() -> u8 {
    let a: u8 = 1;
    let b: u8 = 2;
    largest(a, b)
}
```
You can run the example by using `cairo-run generics.cairo`.
