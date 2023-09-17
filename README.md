# SAFEMONEY

A type safe money manipulation library for ocaml, currently supporting user-defined currency types as well as all ISO4217 currency codes and major crypto currencies.

It is well known that using float numbers for money calculation is inherently lossy and should be avoided at all cost. A classic example shows that 0.21 + 0.32 could possibly lead to 0.530003 which extra money is created out of thin air. Money calculation without context is also considered error prone (e.g. the accidental USD $10. + AUD $10. = ? $20). Also there are a number of float representations and operations do not make sense for money calculation (e.g. accidentally operating on infinity values or using functions like Float.atanh).

On the other hand money calculations using checked rational(quotient) and discrete(integer) numbers with properly established context are considered to be safe. Some of the core types of this library are based on rational and discrete numbers. Back to the previous example of 0.21 + 0.32, we can substitute using rational numbers 21/100 + 32/100 = 53/100 and clearly nothing is lost or created arbitrarily. Alternatively if we were to operate on the scale of "cents" we can then write in integers 21 + 32 = 53 which achieves the same result. This library aims to establish and uphold safety contract by providing contexts in which the calculations take place, the following examples will not compile(see user manual for more examples):

```ocaml
let open Quotient in

let qv1 = make_qv ("AUD", make_q "30/100") in     <--- AUD
                                                     +
let qv2 = make_qv ("GBP", make_q "20/100") in     <--- GBP
                                                     =
( + ) qv1 qv2                                      Error
```

```ocaml
let open Discrete in

let scale1 = Scale.make_scale "AUD" "dollar" (make_q "1/1") in   <--- Unit in dollar
                                                                            +
let scale1 = Scale.make_scale "AUD" "cent" (make_q "100/1") in   <--- Unit in cents

let dv1 = make_dv (scale1, make_z "200") in

let dv2 = make_dv (scale2, make_z "100") in                                =

( + ) dv1 dv2                                                            Error
```

Things considered to be unsafe:

* For any intermediary calculations using float number

* For any intermediary calculations using nonsensical functions and number representations

* For any intermediary calculations without establishing context, namely various currency/scale types

Things considered to be maybe unsafe:

* Returning(in applicative/monadic sense) float number to a safe context for further operations

* That is if the float number itself violates the safety contract mentioned above, then unsafe

* But otherwise safe to use and that the burden of proof is with the user

Things consider safe:

* Finalising(sealing) the rational/discrete number to float with rounding strategy as the final step of calculation. The burden of proof is with the user not to use the sealed float number for anything unsafe ops mentioned above

## User Manual

Walkthrough core modules and types

### Qv and Zv

The core types for building rational and integer numbers are **Qv** and **Zv**, which are wrappers for **zarith** **Q** and **Z** types respectively. Two convenience functions **make_q** and **make_z** are provided for building these values, but otherwise can be built via the **make** function in each module:

```ocaml
open Safemoney

let qv = make_q "123/45" in ...
let zv = make_z "12345" in ...
```

### Quotient

The **Quotient** type provides a context for rational number operations, taking a **string** of currency name and a **Qv** value:

```ocaml
let open Quotient in
let qv1 = make_qv ("AUD", make_q "30/100") in
let qv2 = make_qv ("AUD", make_q "20/100") in
( + ) qv1 qv2
```

### Discrete

The **Discrete** type provides a context for integer number operations, taking a **Scale** type and a **Zv** value. The Scale type takes a currency name, an unit name and a scale ratio which denote a named division with respect to the unit account of the currency, e.g. for USD the subdivision of 100 "cent" make up to 1 "dollar" of unit account, hence the ratio is 100/1 which is represented by a Qv value:

```ocaml
let open Discrete in
let scale = Scale.make_scale "USD" "cent" (make_q "100/1") in
let dv1 = make_dv (scale, make_z "200") in
let dv2 = make_dv (scale, make_z "100") in
( - ) dv1 dv2
```

### Exchange

The **Exchange** type provides a context for currency exchange mechanism, taking a source currency, destination currency and exchange rate of **Qv** value:

```ocaml
let open Exchange in
let aud_to_nzd = make_xchg ~src: "AUD" ~dst: "NZD" (make_q "4908/4503") in ...
```

To compose exchange rate, e.g. from GBP to NZD via AUD:

```ocaml
let open Exchange in
let gbp_to_aud = make_xchg ~src: "GBP" ~dst: "AUD" (make_q "8872/4503") in
let aud_to_nzd = make_xchg ~src: "AUD" ~dst: "NZD" (make_q "4908/4503") in
let gbp_to_nzd = ( **> ) gbp_to_aud aud_to_nzd in ...
```

### Custom

The **Custom** type provides a signature for user defined currency types, allowing items such as currency code, description of the currency, an optional hashmap of unit scales and Qv/Zv initialiser to be specified. Obviously this is an opinionated approach and the **Predefined** module relies on this signature, but users could optionally come up with their own signatures to cater for specific needs. Let's define a new module for a currency called CamelCoin™ by implementing Custom signature:

```ocaml
module CAMELCOIN : Custom = struct
    let symbol = "CMC"

    let description = "Camel Coin🐫"

    let units =
    let table = Hashtbl.create (module String) in
    let hoof = Discrete.Scale.make_scale symbol "hoof" (Utils.make_q "1/1") in
    let hump = Discrete.Scale.make_scale symbol "hump" (Utils.make_q "100/1") in
    Hashtbl.set table ~key: "hoof" ~data: hoof;
    Hashtbl.set table ~key: "hump" ~data: hump;
    Some table

    let make_qv qv = Quotient.make_qv (symbol, qv)

    let make_dv unit dv =
    match units with
    | Some tbl -> let s = Option.value_exn ~message: "Error retriving non-existent scale" @@ Hashtbl.find tbl unit in Some (Discrete.make_dv (s, dv))
    | None -> None
end

let open Quotient in
let qv1 = CAMELCOIN.make_qv (make_q "30/100") in
let qv2 = CAMELCOIN.make_qv (make_q "20/100") in
let dv1 = Core.Option.value_exn (CAMELCOIN.make_dv "cent" (make_z "200")) in
let dv2 = Core.Option.value_exn (CAMELCOIN.make_dv "cent" (make_z "100")) in
( - ) qv1 qv2;
( + ) dv1 dv2;
```

### Predefined

The **Predefined** module includes readily made ISO4217 currencies and major crypto currencies. See usage in **Custom**.

### Sealing Operations

Practically in real life when calculations are **DONE** on these safe types we might want to convert them to the float representations along with a conversion strategies, effectively sealing the operations/presenting the final result, and promise not to use it further. The **Utils** module provides such sealing functions and their effective signatures are:

* seal_quotient -> (val seal_quotient: printing_conf:printing_conf -> qv:Safemoney.Quotient.t -> string)
* seal_discrete -> (val seal_discrete: printing_conf:printing_conf -> dv:Safemoney.Discrete.t -> string)
* seal_exchange -> (val seal_exchange: printing_conf:printing_conf -> xchg:Safemoney.Exchange.t -> string)
* seal_scale -> (val seal_scale: printing_conf:printing_conf -> scale:Safemoney.Discrete.Scale.t -> string)

The **printing_conf** specifies how the the final float number should be presented, by providing a number **Separator**, whether to print a "+" sign, number of decimal places to show and a **rounding** strategy. e.g to seal a Quotient value:

```ocaml
let open Utils in
let open Safemoney in
(** We make a value on the fly but usually it is the result of a chain of safe Qv type calculations **)
let qv = make_qv ("USD", make_q "1234567/7") in
(** Using a premade separator "sep_dot_comma" in Utils module **)
let printing_conf = { separator = sep_dot_comma; plus_sign = true; num_of_digits = Uint8.of_int 4; rounding = Truncate } in 
seal_quotient ~printing_conf: printing_conf ~qv: qv
```
would print "+176,366.7142"

Note the sealed result is a **String** to discourage further usage

### Unsafe

This library does provide escape hatches to allow float values from unsafe part of the codebase to be returned into the safe types, if you cannot establish the chain of proof for the float safety contract then use them at your own peril. The **Utils** module provides such functions:

* unsafe_float_to_quotient
* unsafe_float_to_discrete
* unsafe_float_to_exchange
* unsafe_float_to_scale

Note the float value is taken as **String** to encourage "finalisation" on previously unsafe float. To guide the functions on how to correctly recognise the separator the correct one should be provided or parser error is thrown.


## TODOs

- Toplevel Printer

- Preprocessor

## License

This project is licensed under the [MIT license].

[MIT license]: https://github.com/gborough/safemoney/blob/main/LICENSE

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in safemoney by you, shall be licensed as MIT, without any additional
terms or conditions.
