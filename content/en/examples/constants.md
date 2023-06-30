---
title: "constants"
date: 2023-06-25T14:50:00-06:00
draft: false
---

Constants store data that cannot be modified, just like immutable variables.

Constants key differences are:
- They are defined at compile time.
- They are defined in the global scope.
- Use the keyword `const` instead of `let`.
- By convention, named in SCREAMING_SNAKE_CASE.
- Their type must be annotated.
- Currently they only can store literal constants

```rust {.codebox}
#[contract]
mod contract_example {

  const ONE_HOUR_IN_SECONDS: u32 = 3600;
  const TICKTACKTOE_PLAYER_COUNT: u8 = 2;
  const IS_COMPLETE: bool = 1;
  ...
  
```

