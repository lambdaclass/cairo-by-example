---
title: "hello world"
weight: 10
draft: false
run_command: "cairo-run --single-file"
---

<!-- !test program
cat > /tmp/program.cairo
cairo-run --single-file /tmp/program.cairo -->

the `use` keyword imports a dependency into scope

<!-- !test in hello_world -->
```rust {.codebox}
use debug::PrintTrait;

fn main() {
    'Hello, world!'.print();
}
```

now, run the tests with `cairo-run --single-file hello_world.cairo`. Running this will yield:

<!-- !test out hello_world -->
```bash
[DEBUG]	Hello, world!                  	(raw: 5735816763073854953388147237921)

Run completed successfully, returning []
```
