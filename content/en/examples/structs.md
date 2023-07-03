---
title: "structs"
weight: 240
draft: false
---

A struct is a collection of named fields. It is one of the ways to define custom user types.

The fields of a struct, called members, can be of any defined type.

For example:

```rust {.codebox}
struct Employee {
    age: u8,
    id: u32,
    role: felt252, // String
}
```

Struct members can be user-defined types:

```rust {.codebox}
struct Company {
    employees: Vec<Employee>,
    number_of_buildings: u32
}
```

You can instantiate structs via the following syntax:

```rust {.codebox}
let employee = Employee {
    age: 53,
    id: 1616,
    role: 'engineer',
};
```

If you have variables named the same as the members, you can use a shorter syntax:

```rust {.codebox}
let age = 53;
let id = 1616;
let role = 'engineer';

let employee = Employee {
    age,
    id,
    role,
};
```

The full example:

```rust {.codebox}
use array::ArrayTrait;

#[derive(Copy, Drop)]
struct Employee {
    age: u8,
    id: u32,
    role: felt252,
}

#[derive(Drop)]
struct Company {
    employees: Array<Employee>,
    number_of_buildings: u32
}

fn main() {
    let employee = Employee {
        age: 53,
        id: 1616,
        role: 'engineer',
    };
    let mut employees = ArrayTrait::new();
    employees.append(employee);

    let number_of_buildings = 53;

    let company = Company {
        number_of_buildings,
        employees,
    };
}
```
