---
title: "loop"
weight: 90
draft: false
---

`loop` anahtar kelimesi, Cairo'ya bir kod bloğunu sürekli olarak tekrar tekrar çalıştırmasını (gazı tükenene kadar) veya açıkça durmasını söylemenizi sağlar. Şu anda sadece bu tür bir döngü vardır.

```rust {.codebox}
use debug::PrintTrait;

fn main() -> u128 {
    let mut i: u128 = 0;
    loop {
        if i > 9 { // Döngüyü sonlandıracak koşul
            break ();
        }
        // Tekrarlanacak kod
        'hello'.print(); 
        i = i + 1;
    };
    i
}

#[test]
// Sonsuz tekrardan kaçınmak için 'available_gas' değerini açıkça belirtmek zorundayız
// (Program derlenmeyecek ve 'out_of_gas' hatası üretecektir)
#[available_gas(200000)] 
fn test_main() {
    let a = main();
    assert(a == 10, ' incorrect loop value ');
}
```

Testi çalıştırmak için `cairo-test filename.cairo` kullanabilir veya test yapmadan çalıştırmak için `cairo-run --available-gas 200000 filename.cairo` kullanabilirsiniz.

Bu konu hakkında daha fazla bilgi için [Cairo-Book](https://cairo-book.github.io/ch02-05-control-flow.html)'a bakabilirsiniz

