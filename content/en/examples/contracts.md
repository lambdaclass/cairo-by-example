---
title: "contracts"
weight: 360
draft: false
---

#### Contracts

Contracts can be deployed to Starknet.

The contract modules are defined by adding a `#[starknet::contract]` attribute above the module definition:

```rust {.codebox}
#[starknet::contract]
mod Contract {
}
```

#### Storage

Inside a contract definition, you can define a storage, using the `#[storage]` attribute:

```rust {.codebox}
#[storage]
struct Storage {
    token_supply: felt252,
    decimals: u8
}
```

#### Interfaces

In order to interact with your contract, you'll want to define an interface, which gathers external (functions that mutate the storage) and view (functions that don't mutate the storage) function signatures under a trait. Traits use a generic argument, generally referring to the contract state. Static functions that do not use the storage or emit events do not require an additional argument. Interfaces are defined by adding a `#[starknet::interface]` attribute:

```rust {.codebox}
#[starknet::interface]
trait IContract<TContractState> {
   fn increase_token_supply(ref self: TContractState, amount: felt252);
   fn increase_decimals(ref self: TContractState, amount: u8);
   fn get_token_supply(self: @TContractState) -> felt252;
}
```
#### Implementations

Functions that affect the contract state use a mutable reference to the `ContractState`: `ref self: TContractState `; while the functions that don't affect the state use: `self: @TContractState`.

And to implement this trait inside the contract, we use the `impl` keyword, with a `#[external(v0)]` attribute:

```rust {.codebox}
mod Contract {
    #[storage]
    struct Storage {
        token_supply: felt252,
        decimals: u8
    }

    #[external(v0)]
    impl Contract of super::IContract<ContractState> {
        fn increase_token_supply(ref self: ContractState, amount: felt252) { ... }
        fn increase_decimals(ref self: ContractState, amount: u8) { ... }
        fn get_token_supply(self: @ContractState) -> felt252 { ... }
    }
}
```

#### Storage Access

In order to interact with the contract state, you can use `read` and `write` functions:

```rust {.codebox}
let current_balance = self.balance.read();
self.balance.write(current_balance + amount)
```

That can be used inside functions:

```rust {.codebox}
fn increase_token_supply(ref self: ContractState, amount: felt252) { 
    let current_token_supply = self.token_supply.read();
    self.token_supply.write(current_token_supply + amount)
}
```

#### Constructors

When you deploy a contract, you can set its initial values using a constructor:

```rust {.codebox}
mod Contract {
    #[constructor]
    fn constructor(ref self: ContractState, initial_token_supply: felt252, initial_decimals: u8) { 
        self.token_supply.write(initial_token_supply);
        self.decimals.write(initial_decimals);
    }
}
```

#### Events definition

In Cairo2 all the contract events are unified under the `Event` enum:

```rust {.codebox}
#[event]
#[derive(Drop, starknet::Event)]
enum Event {
    TokenSupplyIncreased: TokenSupplyIncreased,
    DecimalsIncreased: DecimalsIncreased
}

#[derive(Drop, starknet::Event)]
struct TokenSupplyIncreased {
    amount: felt252
}

#[derive(Drop, starknet::Event)]
struct DecimalsIncreased {
    amount: u8
}
```

#### Emitting Events

In order to emit events, you can do the following:

```rust {.codebox}
fn increase_token_supply(ref self: ContractState, amount: felt252) {
    ...
    self.emit(TokenSupplyIncreased { amount });
}
```
