---
title: "hello world"
weight: 10
draft: false
---

<!-- !test program
cat > /tmp/program.cairo
cairo-run /tmp/program.cairo -->

the `use` keyword imports a dependency into scope

<!-- !test in hello_world -->
```rust {.codebox}
use debug::PrintTrait;

fn main() {
    'Hello, world!'.print();
}
```

now, run the tests with `cairo-run hello_world.cairo`

<!-- !test out hello_world -->
```bash
[DEBUG]	Hello, world!                  	(raw: 5735816763073854953388147237921)

Run completed successfully, returning []
```
