---
title: "Llamadas al sistema"
weight: 370
draft: false
---

#### Llamadas al Sistema (o syscalls)

Escribir contratos requiere varias operaciones asociadas, como llamar a otro contrato o acceder al almacenamiento del contrato, que los programas no necesitan. El lenguaje de contratos de Starknet soporta estas operaciones usando llamadas al sistema (syscalls). Las syscalls permiten a un contrato de usar los servicios de Starknet OS. Se pueden usar las syscalls en una funcion para obtener mas informacion que dependa de una vista mas amplia del estado de Starknet, que de otra manera seria inaccesible, en vez de usar variables locales que aparecen en el alcance de una funcion.

Se puede encontrar todas las syscalls disponible en la [documentacion oficial](https://docs.starknet.io/documentation/architecture_and_concepts/Contracts/system-calls-cairo1/), pero aqui hay un ejemplo de uso:

```rust {.codebox}
mod Contract {
    // Todas las llamadas al sistema estan definidas en el modulo `starknet::syscalls`.
    use starknet::syscalls::deploy_syscall;
    use core::result::ResultTrait;
    use starknet::class_hash::ClassHash;
    use starknet::class_hash::Felt252TryIntoClassHash;
    use option::OptionTrait;
    use traits::TryInto;

    fn functions_that_deploys_a_contract(self: @ContractState, class_hash: felt252, contract_address_salt: felt252, calldata: Span<felt252>) {
        let (address0, _) = deploy_syscall(class_hash.try_into().unwrap(), contract_address_salt, calldata, false).unwrap();
    }
}
```

