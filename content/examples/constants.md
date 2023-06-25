---
title: "constants"
date: 2023-06-25T14:50:00-06:00
draft: false
---

Constants store data that cannot be modified, just like inmutable variables.

The key differece are that constants are defined ad deploytime and
- Defined with the keyworkd `const` and named in SCREAMING_SNAKE_CASE
- Are only declared in the global scope.
- Never defined at runtime, they are defined at deployment.
- Type must be annotated.
- Currently they only can store literal constants

```rust {.codebox}
const ONE_HOUR_IN_SECONDS: u32 = 3600;
const TICKTACKTOE_PLAYER_COUNT: u8 = 2;
const IS_COMPLETE: bool = 1;
```

