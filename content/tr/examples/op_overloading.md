---
title: "operator overloading"
weight: 340
draft: false
---

Operator aşırı yüklemesi (operator overloading), Cairo'da `Add`, `Sub`, `Mul`, `Div` gibi belirli özelliklerin kullanımıyla mümkündür

Örneğin, `Vector2` türü için toplama (+) operatörünün aşırı yüklenmesi:

```rust {.codebox}
#[derive(PartialEq, Drop)]
struct Vector2 {
    x: felt252,
    y: felt252,
}

impl Vector2Add of Add<Vector2> {
    fn add(lhs: Vector2, rhs: Vector2) -> Vector2 {
            Vector2 { x: lhs.x + rhs.x, y: lhs.y + rhs.y }
        }
}

fn main() {
    let v = Vector2 { x: 1, y: 0 };
    let w = Vector2 { x: 0, y: 1 };
    
    assert(v + w == Vector2 { x: 1, y: 1 }, 'Should be equal.')
}
```

Aşırı yüklenebilir operatörlerin ve ilgili özelliklerin tam listesi [Cairo Kitap Ekinde B bölümünde](https://cairo-book.github.io/appendix-02-operators-and-symbols.html) bulunabilir.
 
