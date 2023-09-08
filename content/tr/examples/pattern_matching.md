---
title: "pattern matching"
weight: 270
draft: false
---
[Enums](../enums) dışında, Cairo genel olarak desen eşleme kullanımını destekler. `Enum`'larda olduğu gibi desen eşlemesi yapabilirsiniz, ancak aynı zamanda `struct`'larda da kullanabilirsiniz. Şu anda, `struct`'ları desen eşlemesi için yalnızca `let` ifadesinde alanları çözme amacıyla kullanabilirsiniz:


```rust {.codebox}
struct MyStruct {
    a: u16,
    b: u16,
}

fn destructure_my_struct(s: MyStruct, t: MyStruct, u: MyStruct) -> u16 {
    // `_` veya `_name` kullanarak tek bir alanı yoksayabiliriz
    let MyStruct{a: a, b: _b} = u;
    let MyStruct{a: b, b: _} = s;
    // Veya sadece `..` kullanarak adlandırmadığımız her şeyi yoksayabiliriz
    let MyStruct{b: c, ..} = t;
    a + b + c
}
```

Tuples'ları da bu syntax ile çözebilirsiniz:

```rust {.codebox}
fn destructure_tuple(t: (u16, u16)) -> u16 {
    let (x, y) = t;
    x + y
}
```

Ancak, `struct`'ları `match` bloklarında şu anda derlenmeyecektir:

```rust {.codebox}
// Derlenmez
fn match_my_struct(s: MyStruct) -> u16 {
    match s {
        MyStruct{a: 0, b: _} =>  0,
        MyStruct{a: _, b: 0} =>  0,
        MyStruct{b: 1, ..} => 1,
    }
}
```
İşte tam örnek:
```rust {.codebox}
struct MyStruct {
    a: u16,
    b: u16,
}

fn destructure_my_struct(s: MyStruct, t: MyStruct, u: MyStruct) -> u16 {
    // `_` veya `_name` kullanarak tek bir alanı yoksayabiliriz
    let MyStruct{a: a, b: _b} = u;
    let MyStruct{a: b, b: _} = s;
    // Veya sadece `..` kullanarak adlandırmadığımız her şeyi yoksayabiliriz
    let MyStruct{b: c, ..} = t;
    a + b + c
}

fn destructure_tuple(t: (u16, u16)) -> u16 {
    let (x, y) = t;
    x + y
}

#[test]
fn test_destructure_struct(){
    let s = MyStruct{a: 1, b: 2};
    let t = MyStruct{a: 3, b: 4};
    let u = MyStruct{a: 5, b: 6};
    let sum = destructure_my_struct(s, t, u);
    assert(sum == 10, 'sum should be 10');
}

#[test]
fn test_destructure_tuple(){
    let t = (1, 2);
    let sum = destructure_tuple(t);
    assert(sum == 3, 'sum should be 3');
}
```
Bunu denemek için terminalinizde `cairo-test pattern_matching.cairo` komutunu çalıştırabilirsiniz.
