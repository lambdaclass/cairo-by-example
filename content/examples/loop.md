---
title: "loop"
weight: 90
draft: false
---

The `loop` keyword tells Cairo to execute a block of code over and over again forever (until it runs out of gas) or until you explicitly tell it to stop. 
This is the only kind of loop for now.

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

To run the test, use `cairo-test filename.cairo` or just to run it without testing use `cairo-run --available-gas 200000 filename.cairo`.

For further information about this topic, check [Cairo-Book](https://cairo-book.github.io/ch02-05-control-flow.html).
