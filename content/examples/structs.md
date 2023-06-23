---
title: "structs"
date: 2023-06-21T10:29:31-06:00
draft: false
---

A struct is a collection of named fields. It is one of the ways to define custom user types.

The fields of a struct, called members, can be of any defined type.

For example:

```rust {.codebox}
struct Employee {
    age: u8,
    id: u32,
    role: String,
}
```

Struct members can be user-defined types:

```rust {.codebox}
struct Company {
    employees: Vec<Employee>,
    number_of_buildings: u32
}
```
