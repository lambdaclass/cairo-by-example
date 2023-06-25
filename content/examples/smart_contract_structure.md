---
title: "Smart Contract Structure"
date: 2023-06-25T13:56:00-06:00
draft: false
---

Cairo smart contacts tend to following distribution according to convention
    -  Imports
    -  Constants
    -  Storage Structure
    -  Constructor
    -  View functions
    -  External functions
    -  Internal functions

```rust {.codebox}
mod contract_name {

    // 1. Imports
    use starknet::ContractAddress;
    use starknet::get_caller_address;

    // 2. Constants
    const CONSTANT_NAME: felt252 = 1234;

    // 3. Storage Structure
    struct Storage {
        storage_variable: u8,
        storage_mapping: LegacyMap::<u8, bool>,
    }

    // 4. Constructor
    #[constructor]
    fn constructor(storageVariable: u8) {
      storageVariable = storageVariable;
    }

    // 5. View Functions
    #[view]
    fn view_Function() -> (u8, u8) {
        return (0, 0);
    }

    // 6. External Functions
    #[external]
    fn external_function(vote: u8) {
    }

    // 7. Internal Functions
    fn internal_function(address: ContractAddress) {
    }
}
```
