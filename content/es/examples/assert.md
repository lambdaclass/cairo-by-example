---
title: "Assert"
weight: 20
draft: false
---
Para asegurarnos de que nuestras pruebas funcionan, utilizamos assert.

```rust {.codebox}
fn main(x: felt252, y: felt252) {
    assert(x != y, 'error, x is equal to y');
}

#[test]
fn test_main() {
    main(1,2);
}
```

El primer argumento de assert es la condición que queremos comprobar, y el segundo es un mensaje que veremos en la consola si la condición es falsa.

Ejecuta ```cairo-test nombre_archivo```

Intenta cambiarlo para que la prueba falle.

