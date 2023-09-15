open Q
open Core

type t = Q.t [@@deriving compare]

exception NonsensicalQuotientValue of string
exception DenominatorZero of string
exception NonQuotientRep of string

module S = struct
  type showable = {
    value: string
  }
  [@@deriving show, sexp, yojson]

  let one = Q.one

  let neg x = Q.neg x

  let abs x = Q.abs x

  let signum x = Q.sign x

  let add x y = Q.add x y

  let sub x y = Q.sub x y

  let mul x y = Q.mul x y

  let div x y = Q.div x y

  let make str =
    let pat = Re2.create_exn "^-?[0-9]*/?-?[0-9]*?$" in
    match Re2.matches pat str with
    | true ->
      (
        let q = Q.of_string str in
        match Q.classify q with
        | Q.INF | Q.MINF | Q.UNDEF -> raise (NonsensicalQuotientValue "nonsensical quotient values are not suitable for currency operation")
        | Q.NZERO -> if Z.compare q.den Z.zero = 0 then raise (DenominatorZero "denominator must not be zero") else q
        | Q.ZERO -> Q.zero
      )
    | false -> raise (NonQuotientRep "only quotient representation allowed, e.g. 123/456")

  let num_of_q x = Q.num x

  let den_of_q x = Q.den x

  let to_str x = if Z.compare (den_of_q x) Z.one = 0 then (Q.to_string x) ^ "/1" else Q.to_string x

  let to_float x = Q.to_float x

  let to_showable_json x = Yojson.Safe.to_string @@ showable_to_yojson { value = to_str x }
end
