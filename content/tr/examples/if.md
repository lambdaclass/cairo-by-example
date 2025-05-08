---
title: "if expression"
weight: 50
draft: false
---

`if` ifadesi, bir boolean koşulun değerine bağlı olarak bir kod parçasını koşullu olarak yürütmeyi sağlayan bir kontrol akış yapısıdır. Bir ifade olduğundan, dallardaki son ifadenin değerini döndürür.

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    let is_awesome = true;

    if is_awesome {
        'Cairo is awesome!'.print();
    }
}
```

`&&` (ve), `||` (veya) gibi boolean operatörleri kullanarak birkaç koşulu birleştirebilirsiniz. 
Ayrıca birçok diğer programlama dilinde olduğu gibi isteğe bağlı bir else-dalı da ekleyebilirsiniz.

```rust {.codebox}
use debug::PrintTrait;

fn main() {
    let version: u8 = 2;
    let is_awesome = true;

    if is_awesome && version > 0 {
        'Lets code!'.print();
    } else {
        'Great things are coming'.print();
    }
}
```
