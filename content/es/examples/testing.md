---
title: "Testing"
weight: 320
draft: false
---

Los tests son funciones que verifican que el código funciona como se espera. Estas funciones deben ser anotadas con `#[test]`.

Cualquier código que entre en pánico hará que una prueba falle. Como programador, normalmente quieres escribir una prueba estableciendo un estado inicial, realizando algún cálculo, y afirmando que el resultado es el esperado.

Por ejemplo:

```rust {.codebox}
#[test]
fn test_passes() {
    let result = 2 + 2;
    assert(result == 4, 'result is not 4'); 
}
```

También puede anotar las pruebas que se supone que deben fallar con `#[should_panic]`:

```rust {.codebox}
#[test]
#[should_panic]
fn test_should_fail() {
    let a: u8 = 255;
    let b: u8 = a + 1; // panics due to overflow
}
```

Para ejecutar cualquier test, puede utilizar el comando `cairo-test`.

```console
$ cairo-test .
running 2 tests
test test_crate::test_passes ... ok
test test_crate::test_should_fail ... ok
test result: ok. 2 passed; 0 failed; 0 ignored; 0 filtered out;
```

Note: For this to work there needs to be a`cairo_project.toml` file. This is the configuration file for "vanilla" Cairo projects (i.e. not managed by Scarb), which is required to run the `cairo-test .` command to run the code of the crate. The content of the file is:

```toml
[crate_roots]
test_crate = "src"
```

Lo que indica que el crate llamado "test_crate" está localizado en el directorio `src`. Cualquier archivo Cairo en el crate será probado cada vez que ejecutes `cairo-test`.
