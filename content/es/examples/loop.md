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

Para ejecutar la prueba, use `cairo-test nombre-de-archivo.cairo` o simplemente para ejecutarla sin probar use `cairo-run --available-gas 200000 nombre-de-archivo.cairo`.

Para más información sobre este tema, consulte [Cairo-Book](https://cairo-book.github.io/ch02-05-control-flow.html).
