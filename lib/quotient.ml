open Sexplib.Std

exception CurrencyTypeMismatch of string

type t = {symbol_: string; value_: Qv.t}

type showable =
  { kind: string [@key "kind"]
  ; symbol: string [@key "symbol"]
  ; value: string [@key "value"] }
[@@deriving yojson, sexp]

let check_sym t1 t2 =
  if String.compare t1.symbol_ t2.symbol_ = 0 then true else false

let make_qv (symbol_, value_) = {symbol_; value_}

let show_sym t = Printf.printf "%s" t.symbol_

let show_val t = Printf.printf "%s" (Qv.S.to_str t.value_)

let show_t t = Printf.printf "(%s %s)" t.symbol_ (Qv.S.to_str t.value_)

let neg t = {t with value_= Qv.S.neg t.value_}

let abs t = {t with value_= Qv.S.abs t.value_}

let ( + ) t1 t2 =
  if check_sym t1 t2 then {t1 with value_= Qv.S.add t1.value_ t2.value_}
  else
    raise
      (CurrencyTypeMismatch "cannot operate on two different currency types")

let ( - ) t1 t2 =
  if check_sym t1 t2 then {t1 with value_= Qv.S.sub t1.value_ t2.value_}
  else
    raise
      (CurrencyTypeMismatch "cannot operate on two different currency types")

let ( * ) t qv = {t with value_= Qv.S.mul t.value_ qv}

let ( / ) t qv = {t with value_= Qv.S.div t.value_ qv}

let to_json x =
  Yojson.Safe.to_string
  @@ showable_to_yojson
       { kind= "quotient_value"
       ; symbol= x.symbol_
       ; value= Qv.S.to_str x.value_ }

let showable_of_t t =
  {kind= "quotient_value"; symbol= t.symbol_; value= Qv.S.to_str t.value_}

let to_sexp t = sexp_of_showable @@ showable_of_t t
