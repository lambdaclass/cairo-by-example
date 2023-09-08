---
title: "testing"
weight: 320
draft: false
---

Testler, kodun beklenildiği gibi çalıştığını doğrulayan işlevlerdir. Bu işlevler `#[test]` ile işaretlenmelidir.

Herhangi bir hata durumunda panikleyen kodlar testin başarısız olmasına neden olur. Genellikle bir test yazarken başlangıç durumunu ayarlayıp bir hesaplama yapar ve sonucun beklediğiniz gibi olduğunu doğrularsınız.

Örnek olarak:

```rust {.codebox}
#[test]
fn test_passes() {
    let result = 2 + 2;
    assert(result == 4, 'result is not 4'); 
}
```

Ayrıca başarısız olması beklenen testlere `#[should_panic]` ile işaretleyebilirsiniz:

```rust {.codebox}
#[test]
#[should_panic]
fn test_should_fail() {
    let a: u8 = 255;
    let b: u8 = a + 1; // taşma nedeniyle panik
}
```

Herhangi bir testi çalıştırmak için `cairo-test` komutunu kullanabilirsiniz.

```console
$ cairo-test .
running 2 tests
test test_crate::test_passes ... ok
test test_crate::test_should_fail ... ok
test result: ok. 2 passed; 0 failed; 0 ignored; 0 filtered out;
```

Not: Bu işlem için bir `cairo_project.toml` dosyasına ihtiyaç vardır. Bu, "vanilla" Cairo projeleri için yapılandırma dosyasıdır (yani Scarb tarafından yönetilmeyen projeler) ve crate'in kodunu çalıştırmak için `cairo-test` . komutunu çalıştırmak için gereklidir. Dosyanın içeriği şu şekildedir:

```toml
[crate_roots]
test_crate = "src"
```

Bu, "test_crate" adlı crate'in `src` dizininde olduğunu belirtir. Crate içindeki herhangi bir Cairo dosyası, `cairo-test` çalıştırdığınızda test edilir.
