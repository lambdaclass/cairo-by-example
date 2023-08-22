---
title: "datos-primitivos"
weight: 85
draft: false
---

- Tipos Escalares:
  - Enteros sin signo:
    - `u8`
    - `u16`
    - `u32`
    - `u64`
    - `u128`
    - `u256`
    - `usize`
  - `bool`
- Tipos compuestos:
  - Tuples `()`

```rust
fn main() {
    // Se puede declarar las variables especificando su tipo
    let logical: bool = true;

    let a: u64 = 1;  // Anotación regular
    let b = 5_u32; // Anotación con sufijo para aclarar el tipo

    // Se puede usar el tipo "default"
    let default_integer = 7;   // `felt252`

    // El tipo de dato se infiere por el contexto
    let mut inferred_type = 12; // Determina que es u64 porque lo infiere de la próxima línea
    inferred_type = 4294967296_u64;

    // Los valores de las variables mutables pueden ser modificados
    let mut mutable = 12_u32; // Variable mutable de `u32`
    mutable = 21;

    // Las tuplas pueden contener variables de diferentes tipos
    let tuple = (1_u32, true, 10000000_u64);

    // Pueden incluir también otras tupla
    let composed_tuple = (tuple, 1_u8, (true, false));

    // Las tuplas se pueden desarmar para crear "bindings"
    let (a, b, c) = tuple;
    assert(a == 1_u32, 'tuple unpack');
}
```
Un `Literal numérico` en Cairo se puede expresar como `Decimal`, `Hexadecimal`, `Octal` o `Binario`:
```rust
fn main() {
    let num_decimal = 171717_u32;
    let num_hex = 0x29ec5_u32;
    let num_octal = 0o517305;
    let num_binary = 0b101001111011000101;
    assert(num_decimal == num_hex, 'numeric literal cmp');
    assert(num_decimal == num_octal, 'numeric literal cmp');
    assert(num_decimal == num_binary, 'numeric literal cmp');
}
```
