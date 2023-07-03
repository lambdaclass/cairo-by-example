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
    role: String,
}
```

Los miembros de Struct pueden ser tipos definidos por el usuario:

```rust {.codebox}
struct Company {
    employees: Vec<Employee>,
    number_of_buildings: u32
}
```
