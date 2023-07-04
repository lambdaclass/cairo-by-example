---
title: "dictionaries"
weight: 230
draft: false
---

Cairo has a built-in dictionary type called `Felt252Dict` which maps keys of type `Felt252` to values. The dictionary is generic over the type of the stored values.  

You can access the values for a specific key with the `[]` operator.
By default, the value `0` is returned for non-existing keys:

```rust {.codebox}
    use dict::Felt252DictTrait;

    fn main() -> felt252 {
        let mut dict_u8 = felt252_dict_new::<u8>();
        let mut dict_felt = felt252_dict_new::<felt252>();
        dict_u8.insert(10, 110);

        let val10 = dict_u8[10]; // 110
        let val11 = dict_felt[11]; // 0
        dict_felt.insert(11, 1024);
        dict_felt[11] // 1024
    }
```
