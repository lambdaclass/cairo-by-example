---
title: "dictionaries"
weight: 230
draft: false
---

Cairo'da, `Felt252Dict` adı verilen yerleşik bir sözlük (dictionary) tipi bulunur. Bu sözlük, `Felt252` türündeki anahtarları değerlere eşler. Sözlük, depolanan değerlerin türüne göre geneldir.  

Belirli bir anahtar için değerlere `[ ]` operatörü ile erişebilirsiniz. Varsayılan olarak, mevcut olmayan anahtarlar için değer olarak `0` döner:

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
