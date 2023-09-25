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
[DEBUG]	Hello, world!                  	(raw: 0x48656c6c6f2c20776f726c6421

Run completed successfully, returning []
```
