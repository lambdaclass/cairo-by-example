---
title: "dictionaries"
date: 2023-06-22T12:51:00-06:00
draft: false
---

Cairo tiene un diccionario integrado llamado `Felt252Dict` que asigna claves de tipo `Felt252` a valores. El diccionario es genérico sobre el tipo de los valores almacenados.  

Puede acceder a los valores de una clave específica con el operador `[]`.
Por defecto, se devuelve el valor `0` para claves no existentes:

```rust {.codebox}
    use dict::Felt252DictTrait;

    fn test_dict() -> felt252 {
        let mut dict_u8 = felt252_dict_new::<u8>();
        let mut dict_felt = felt252_dict_new::<felt252>();
        dict_u8.insert(10, 110);

        let val10 = dict_u8[10]; // 110
        let val11 = dict_felt[11]; // 0
        dict_felt.insert(11, 1024);
        let val11 = dict_felt[11]; // 1024
    }
```
