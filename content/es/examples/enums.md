---
title: "Enums"
weight: 200
draft: false
---

Un enum en Cairo funciona como una unión etiquetada, las variantes pueden contener valores en su interior, a los que puedes acceder mediante pattern matching.

Puedes trabajar con enums así:

```rust {.codebox}
use option::OptionTrait;
use debug::PrintTrait;

// Define an enum
enum MyEnum {
    A: u8,
    B: u16,
    C: u32,
    D: u64
}

// It will print 'Got something else'
fn main() {
    let x = my_enum_a();
    let y = my_enum_get_b(x);
    match y {
        Option::Some(x) => 'Got B'.print(),
        Option::None(()) => 'Got something else'.print(),
    } 
}

// Construct and return an enum variant.
fn my_enum_a() -> MyEnum {
    MyEnum::A(4_u8)
}

// Match the enum, the order must match the enum definition.
// Option is also an enum.
fn my_enum_get_b(x: MyEnum) -> Option::<u16> {
    match x {
        MyEnum::A(x) => Option::None(()),
        MyEnum::B(x) => Option::Some(x),
        MyEnum::C(x) => Option::None(()),
        MyEnum::D(x) => Option::None(()),
    }
}
```

[Abierto en Cairo Playground](<https://cairovm.codes/?codeType=Cairo&code=%27use%20optionkWTrait0use%20debugkPr!tTrait0ZDef!e5qenum%20YRAJu8LBJu16LCJu32LDJu64q)qZIKwill%20pr!KUqfn%20ma!XRleKx9VaX0~leKy9Vget_bF%7D0~mHyR~WkSomeFj%22GoKB%22.pr!tXL~*jU.pr!tXL)%20q)qZConstrucKand%20return5%20variant.qfnVaX%20-7YRYkA%7B4_u8%7Dq)qZMHtheQ%2C%20the%20order%20musKmHtheQ%20def!ition.ZW%20is%20also5.qfnVget_bFJY%7D%20-7Wk%3Cu16%3ERmHxR~YkAz~YkBFjWkSomeF%7DL~YkCz~YkDz)q)%27~%20%20%20%20zFj*%7DLq%5Cnk%3A%3Aj%7D97Zq%2F%2F%20YMyEnumX%7B%7DWOptionV%20my_enum_U%22GoKsometh!g%20else%22R%20(q~Q%20enumL%2Cq~Kt%20J%3A%20Hatch%20F%7Bx9%20%3D7%3E%205%20anQ0%3Bq*WkNone%7BX!in%01!*0579FHJKLQRUVWXYZjkqz~_>)

Para correr el ejemplo simplemente ejecute `cairo-run --single-file enums.cairo` en su terminal.
