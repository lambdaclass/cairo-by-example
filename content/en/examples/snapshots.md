---
title: "snapshots"
weight: 310
draft: false
---

Snapshots provide read-only instances of an object without taking ownership when passed to a function. Every type `T` has a snapshot version `@T`, which is always droppable and duplicatable.

To create a snapshot of a value `x` of type `T`, simply use `@x`.

```rust {.codebox}
use array::ArrayTrait;
use option::OptionTrait;
use box::BoxTrait;

// Receives an array snapshot
fn sum_starting_two(data: @Array<u32>) -> u32 {
    //data.append(5_u32); <- This will fail, as data is read-only
    let first = *data.get(0).unwrap().unbox();
    let second = *data.get(1).unwrap().unbox();
    first + second

    //*data[0] + *data[1] <- also works
}

fn main() -> u32 {
    let mut data: Array<u32> = ArrayTrait::new();
    data.append(1_u32);
    data.append(2_u32);
    data.append(3_u32);
    data.append(4_u32);
    data.get(0);
    sum_starting_two(@data) // Using a snapshot instead of the mut variable
}
```

[Open in Cairo Playground](<https://cairovm.codes/?codeType=Cairo&code=%27useQMPAMSusFoptionPOptionSusFboxPBoxSjN%20ReceivesQnQMHt6VC%40GWNI5!XD%20ThiEwill%20fail%2CQEZ%20iEread-only~leYfirsYJ*K0qleYsecond%20J*K1qfirsY%2B%20secondj~N*Z%5B0%5D%20%2B%20*Z%5B1%5DDQlso%20worksj)j6main%7BWleYmuYCG%20JAMTraitPnew%7Bz1!z2!z3!z4!X~K0X~V%40Z9N%20UsingQHYinstead%20of%20thFmuYvariablej)%27~j88zX~Iq7wrap%7B7box%7BX~j%5CnZdataYt%20X%7D%3BW9-%3E%20L%20(~Vsum_starting_two%7BSTrait%3BjQ%20aP%3A%3AN%2F%2FMrrayLu32KZ.get%7BJ%3D%20IZ.append%7BH%20snapshoGAM%3CL%3EFe%20Es%20D%20%3C-CZ%3A%209%7D%208%20%207%7D.un6jfn%20!_L%01!6789CDEFGHIJKLMNPQSVWXYZjqz~_>)