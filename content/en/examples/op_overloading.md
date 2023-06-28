---
title: "operator overloading"
weight: 340
draft: false
---

Operator overloading is possible in Cairo through the use of particular traits, like `Add`, `Sub`, `Mul`, `Div` and many others.

For example, for overloading the addition (+) operator of a `Vector2` type:

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

A full list of overloadable operators and their respective traits can be found in [Appendix B of the Cairo Book](https://cairo-book.github.io/appendix-02-operators-and-symbols.html)
