---
title: "named parameters"
weight: 45
draft: false
---

İsimlendirilmiş parametreler, bir fonksiyonu çağırırken argümanların isimlerini belirtmenizi sağlar.
İsimlendirilmiş parametreleri kullanmak isterseniz, parametrenin adını ve geçmek istediğiniz değeri belirtmeniz gerekir. Ancak unutmayın, bunlar hâlâ fonksiyonda bildirildikleri sırayla olmalıdır.

```rust {.codebox}
fn foo(x: u8, y: u8) {
    // ...
}

fn main() {
    let first_arg = 3;
    let second_arg = 4;
    //  parametre_adı: değer
    foo(x: first_arg, y: second_arg);
    // foo(y: second_arg, x: first_arg); <- bu hatayı üretecektir
}
```

Eğer bir değişkeni parametreyle aynı isme sahip olarak geçirirseniz, daha kısa bir sözdizimi kullanabilirsiniz:

```rust {.codebox}
fn foo(x: u8, y: u8) {
    // ...
}

fn main() {
    let x = 1;
    let y = 2;
    foo(:x, :y);
}
```
