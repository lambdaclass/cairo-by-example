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

[Open in Cairo Playground](<https://cairovm.codes/?codeType=Cairo&code=%27use%20dSWFeltZDSTrait%3Bjjfn%20main%7B%7D%20-%3EQZ%20(bu8zu8XbqzqZX~yu8h0YUkjOUoyu8%5BU%5DP1UO11ogP0~yqh1Y024k~gxU24j)%27~jVVzoqZ_ynewW%3CydS_x%20%2F%2FQfeltp~leRo%20%3D%20k%7D%3Bj%5Cnh.insert%7B1gyq%5B11%5DbpmuRyZ252Y%2C%201X%3E%7BkW%3A%3AV%20%20U10SictRt%20Q%20qP%3BxOpval%01OPQRSUVWXYZbghjkopqxyz~_>)
