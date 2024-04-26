module Make (Qv : Qv_intf.S) = struct
  exception CurrencyTypeMismatch of string

  type t = {symbol: string [@compare.ignore]; value: Qv.t}
  [@@deriving compare]

  type showable =
    {symbol_: string [@key "symbol"]; value_: string [@key "value"]}
  [@@deriving show, yojson]

  let check_sym t1 t2 =
    if String.compare t1.symbol t2.symbol = 0 then true else false

  let make_qv (symbol, qv) = {symbol; value= qv}

  let show_sym t = Printf.printf "%s" t.symbol

  let show_val t = Printf.printf "%s" (Qv.S.to_str t.value)

  let show_t t = Printf.printf "(%s %s)" t.symbol (Qv.S.to_str t.value)

  let neg t = {t with value= Qv.S.neg t.value}

  let abs t = {t with value= Qv.S.abs t.value}

  let ( + ) t1 t2 =
    if check_sym t1 t2 then {t1 with value= Qv.S.add t1.value t2.value}
    else
      raise
        (CurrencyTypeMismatch
           "cannot operate on two different currency types" )

  let ( - ) t1 t2 =
    if check_sym t1 t2 then {t1 with value= Qv.S.sub t1.value t2.value}
    else
      raise
        (CurrencyTypeMismatch
           "cannot operate on two different currency types" )

  let ( * ) ~t ~value = {t with value= Qv.S.mul t.value value}

  let ( / ) t value = {t with value= Qv.S.div t.value value}

  let to_json x =
    Yojson.Safe.to_string
    @@ showable_to_yojson {symbol_= x.symbol; value_= Qv.S.to_str x.value}
end
