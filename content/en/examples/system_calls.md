---
title: "system calls"
weight: 370
draft: false
---

#### System Calls (or syscalls, for short)

Writing smart contracts requires various associated operations, such as calling another contract or accessing the contract’s storage, that standalone programs do not require. The Starknet contract language supports these operations by using system calls. System calls enable a contract to require services from the Starknet OS. You can use system calls in a function to get information that depends on the broader state of Starknet, which would otherwise be inaccessible, rather than local variables that appear in the function’s scope.

You can find all the available syscalls in the [official documentation](https://docs.starknet.io/documentation/architecture_and_concepts/Contracts/system-calls-cairo1/), but here is an use case example:

```rust {.codebox}
mod Contract {
    // All the syscalls are under the `starknet::syscalls` module
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

