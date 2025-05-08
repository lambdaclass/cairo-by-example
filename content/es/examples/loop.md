---
title: "Loop"
weight: 90
draft: false
---

La palabra clave `loop` le dice a Cairo que ejecute un bloque de código una y otra vez para siempre (hasta que se quede sin gas) o hasta que le digas explícitamente que pare. 
Este es el único tipo de bucle por ahora.

```rust {.codebox}
use debug::PrintTrait;

fn main() -> u128 {
    let mut i: u128 = 0;
    loop {
        if i > 9 { // Break condition
            break ();
        }
        // Repeating code
        'hello'.print(); 
        i = i + 1;
    };
    i
}

#[test]
// In order to prevent infinite iteration, we have to explicitly declare the 'available_gas' value
// (The program wont compile and will generate 'out_of_gas' error)
#[available_gas(200000)] 
fn test_main() {
    let a = main();
    assert(a == 10, ' incorrect loop value ');
}
```

[Abierto en Cairo Playground](<https://cairovm.codes/?codeType=Cairo&code=%27use%20debug%3A%3APrintTraityzfn%20mainx%20-%3Ew(z~let%20mutj%3Aw%3D%200WloopXqif_%3E%209X%20vBZconditionq~bZxW~)qvRepeating%20codeq%22hello%22.printx%3B%20qi%20%3D_%2B%201W)Wiz)%27~YYz%5Cny%3Bzx%7B%7Dw%20u128%20v%2F%2F%20qz~~_i_j%20Zreak%20Y%20%20X%20(Wy~%01WXYZ_jqvwxyz~_>)

Para ejecutar la prueba, use `cairo-test nombre-de-archivo.cairo` o simplemente para ejecutarla sin probar use `cairo-run --single-file --available-gas 200000 nombre-de-archivo.cairo`.

Para más información sobre este tema, consulte [Cairo-Book](https://cairo-book.github.io/ch02-05-control-flow.html).
