---
title: "structs"
weight: 240
draft: false
---

`Struct`, isimlendirilmiş alanların bir koleksiyonudur. Özel kullanıcı tiplerini tanımlamanın yollarından biridir..

Bir struct'ın alanlarına üyeler denir ve tanımlanmış herhangi bir tipte olabilirler.

Örneğin:

```rust {.codebox}
struct Employee {
    age: u8,
    id: u32,
    role: felt252, // String
}
```

Struct üyeleri, kullanıcı tanımlı tipler de olabilir:

```rust {.codebox}
struct Company {
    employees: Vec<Employee>,
    number_of_buildings: u32
}
```

Aşağıdaki sözdizimiyle struct'ları örneklendirebilirsiniz:

```rust {.codebox}
let employee = Employee {
    age: 53,
    id: 1616,
    role: 'engineer',
};
```

Eğer değişkenlerinizin ismi üyelerle aynıysa, daha kısa bir sözdizimi kullanabilirsiniz:

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

Tam örnek:

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
