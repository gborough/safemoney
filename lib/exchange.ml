open Sexplib.Std

exception IntermediaryMismatch of string

type t = {src_: string; dst_: string; value_: Qv.t}

type showable =
  { kind: string [@key "kind"]
  ; src: string [@key "src"]
  ; dst: string [@key "dst"]
  ; value: string [@key "value"] }
[@@deriving yojson, sexp]

let make_xchg ~src ~dst value =
  let value = Qv.S.abs value in
  {src_= src; dst_= dst; value_= value}

let show_xchg t =
  Printf.printf "Exchange rate from %s to %s: %s" t.src_ t.dst_
    (Qv.S.to_str t.value_)

let ( **> ) t1 t2 =
  if String.compare t1.dst_ t2.src_ = 0 then
    {src_= t1.src_; dst_= t2.dst_; value_= Qv.S.mul t1.value_ t2.value_}
  else
    raise
      (IntermediaryMismatch
         "Intermediary currency symbol must be equal in order to compose \
          exchange rate" )

let xchg_recip t =
  {src_= t.dst_; dst_= t.src_; value_= Qv.S.div (Qv.S.one ()) t.value_}

let to_json t =
  Yojson.Safe.to_string
  @@ showable_to_yojson
       { kind= "exchange_rate"
       ; src= t.src_
       ; dst= t.dst_
       ; value= Qv.S.to_str t.value_ }

let showable_of_t t =
  { kind= "exchange_rate"
  ; src= t.src_
  ; dst= t.dst_
  ; value= Qv.S.to_str t.value_ }

let to_sexp t = sexp_of_showable @@ showable_of_t t
