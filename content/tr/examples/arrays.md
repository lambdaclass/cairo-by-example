---
title: "arrays"
weight: 220
draft: false
---


Cairo'da, `ArrayTrait::new()` ile arrayler oluşturabilir ve `append` yöntemiyle öğeleri ekleyebilirsiniz.

```rust {.codebox}
use array::ArrayTrait;

fn get_array() -> Array<felt252> {
    let mut numbers = ArrayTrait::new();
    numbers.append(444);
    numbers.append(555);

    numbers
}
```

Array in uzunluğunu `len` ile alabilirsiniz:

```rust {.codebox}
#[test]
fn test_array_len() {
    let array = get_array();
    let len = array.len();
    assert(len == 2, 'wrong array length');
}
```

Arrayden bir öğeyi `get` veya `at` ile alabilirsiniz:

```rust {.codebox}
#[test]
fn test_array_get() {
    let array = get_array();
    let first_element = *array.get(0).unwrap().unbox();
    let second_element = *array.at(1);

    assert(first_element == 444, 'wrong first element');
    assert(second_element == 555, 'wrong second element');
}
```

`get` ve `at` arasındaki fark, belirtilen indekste öğe olmaması durumunda `at`'ın hata vermesidir, `get` ise bu durumda `None` dönen bir `Option` döndürür.

Full example:

```rust {.codebox}
use array::ArrayTrait;
use option::OptionTrait;
use box::BoxTrait;

fn get_array() -> Array<felt252> {
    let mut numbers = ArrayTrait::new();
    numbers.append(444);
    numbers.append(555);

    numbers
}

#[test]
fn test_array_len() {
    let array = get_array();
    let len = array.len();

    assert(len == 2, 'wrong array length');
}

#[test]
fn test_array_retrieve_elements() {
    let array = get_array();
    let first_element = *array.get(0).unwrap().unbox();
    let second_element = *array.at(1);

    assert(first_element == 444, 'wrong first element');
    assert(second_element == 555, 'wrong second element');

    // array.get(2) None döndürecek
    // array.at(2) hata verecektir
}
```
