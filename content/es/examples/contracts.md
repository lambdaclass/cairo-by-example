---
title: "contracts"
weight: 360
draft: false
---

# Contratos

Los contratos pueden ser deplegados en Starknet.

Los modulos que son contratos se definen agregando el atributo `#[starknet::contract]` arriba de la definicion del mismo:

```rust {.codebox}
#[starknet::contract]
mod Contract {
}
```

# Almacenamiento

Dentro de la definicion de un contrato, se puede definir un almacenamiento usando el atributo `#[storage]`:

```rust {.codebox}
#[storage]
struct Storage {
    token_supply: felt252,
    decimals: u8
}
```

# Interfaces

Para interactuar con tu contrato querrás definir una interfaz, la cual acumula las funciones externas (modifican el almacenamiento) y las vistas (**no** modifican el almacenamiento) bajo un `trait`. Los `trait`s usan un argumento generico, generalmente refiriendose al estado del contrato. Las funciones estaticas que no tocan el almacenamiento ni emiten eventos no requerien del argumento adicional. Las interfaces se definen agregando el atributo `#[starknet::interface]`:

```rust {.codebox}
#[starknet::interface]
trait IContract<TContractState> {
   fn increase_token_supply(ref self: TContractState, amount: felt252);
   fn increase_decimals(ref self: TContractState, amount: u8);
   fn get_token_supply(self: @TContractState) -> felt252;
}
```
# Implementaciones

Una funcion que altera el estado del contrato usa una referencia mutable al mismo: `ref self: TContractState`; mientras que las funciones que no lo alteran usan: `self: @TContractState`.

Para implementar un `trait` en el contrato, se usa la palabra reservada `impl`, con un atributo `#[external(v0)]`:

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

## Interaccion con el almacenamiento

Para interactuar con el estado del contrato, se pueden usar las funciones `read` y `write`:

```rust {.codebox}
let current_balance = self.balance.read();
self.balance.write(current_balance + amount)
```

Pueden ser usadas dentro de funciones:

```rust {.codebox}
fn increase_token_supply(ref self: ContractState, amount: felt252) { 
    let current_token_supply = self.token_supply.read();
    self.token_supply.write(current_token_supply + amount)
}
```

## Constructores

Cuando despliegas un contrato, podras querer hacer una configuracion initial, estas son hechas usando un `constructor`, y se definen haciendo:

```rust {.codebox}
mod Contract {
    #[constructor]
    fn constructor(ref self: ContractState, initial_token_supply: felt252, initial_decimals: u8) { 
        self.token_supply.write(initial_token_supply);
        self.decimals.write(initial_decimals);
    }
}
```

## Definicion de Eventos

En Cairo2, todos los eventos de un contrato son unificados en una enumeracion llamada `Event`:

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

## Emision de Eventos

La emision de eventos se hace de la siguiente manera:

```rust .{codebox}
fn increase_token_supply(ref self: ContractState, amount: felt252) {
    ...
    self.emit(TokenSupplyIncreased { amount });
}
```
