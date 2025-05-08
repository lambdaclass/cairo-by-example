---
title: "assert"
weight: 20
draft: false
---
Testlerimizin çalıştığını doğrulamak için `assert` kullanırız.

```rust {.codebox}
fn main(x: felt252, y: felt252) {
    assert(x != y, 'error, x is equal to y');
}

#[test]
fn test_main() {
    main(1,2);
}
```

Assert'in ilk argümanı, kontrol etmek istediğimiz koşuldur ve ikincisi, koşul yanlış olduğunda konsolda göreceğimiz bir mesajdır

```cairo-test dosya_adı``` çalıştırın

Testin başarısız olması için kodu değiştirmeyi deneyin.
