---
title: "structs"
date: 2023-06-22T12:40:00-06:00
draft: false
---

Una struct es una colección de campos con nombre. Es una de las formas de crear tipos personalizados definidos por el usuario.

Los campos de un struct, llamados miembros, pueden ser de cualquier tipo definido.

Por ejemplo:

```rust {.codebox}
struct Employee {
    age: u8,
    id: u32,
    role: felt252, // String
}
```

Los miembros de Struct pueden ser tipos definidos por el usuario:

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
