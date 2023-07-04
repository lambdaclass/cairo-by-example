---
title: "events"
date: 2023-06-22T15:39:00-06:00
draft: false
---

Events are a useful mechanism for logging activity of smart contracts
    - Require the `#[event]` attribute.
    - Designed to be consumed by off chain clients
    - Only emit events, but not read them.

```rust {.codebox}
# Declaring an event
#[event]
fn MyEvent(value: u8) {};

# Emmiting an event
#[external]
fn emitMyEvent(value: u8 ) {
  MyEvent(value);
}
```
