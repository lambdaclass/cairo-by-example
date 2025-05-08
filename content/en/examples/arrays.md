---
title: "arrays"
weight: 220
draft: false
---

# Arrays

You can create arrays in cairo with `ArrayTrait::new()` and add elements with the method `append`:

```rust {.codebox}
use array::ArrayTrait;

fn get_array() -> Array<felt252> {
    let mut numbers = ArrayTrait::new();
    numbers.append(444);
    numbers.append(555);

    numbers
}
```

You can get the length of an array with `len`:

```rust {.codebox}
#[test]
fn test_array_len() {
    let array = get_array();
    let len = array.len();
    assert(len == 2, 'wrong array length');
}
```

You can get an element from an array with `get` or `at`:

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

The difference between `get` and `at` is that `at` will cause an error if there is no element at the specified index while `get` returns an `Option` that is `None` in that case.

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

    // array.get(2) will return None
    // array.at(2) will cause an error
}
```

[Open in Cairo Playground](<https://cairovm.codes/?codeType=Cairo&code=%27hagqAgvhoptionqOptionvhboxqBoxvkfn%20main%7B%7D%20-%3EY%3Cfelt252%3E%20(~let%20mut%20j%20%3DYZqnew%7Bz444z555_k~jk)%27~kccz_~j.append%7BvZ%3Bkq%3A%3Ak%5Cnjnumbershuse%20grrayc%20%20_%7D%3BZTraitY%20Ag%01YZ_cghjkqvz~_>)
