---
title: "operator overloading"
date: 2023-06-22T13:45:00-06:00
draft: false
---

La sobrecarga de operadores es posible en Cairo mediante el uso de traits particulares, como `Add`, `Sub`, `Mul`, `Div` y muchos otros.

Por ejemplo, para sobrecargar el operador de suma (+) de un tipo `Vector2`:

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

Encontrará una lista completa de los operadores sobrecargables y sus respectivos rasgos en el [Apéndice B del Cairo Book](https://cairo-book.github.io/appendix-02-operators-and-symbols.html)
