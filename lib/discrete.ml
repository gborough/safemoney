open Sexplib.Std

module Scale = struct
  exception ValidScaleError of string

  type t = {symbol_: string; sub_unit_: string; value_: Qv.t}

  type showable =
    { kind: string [@key "kind"]
    ; symbol: string [@key "symbol"]
    ; sub_unit: string [@key "sub_unit"]
    ; value: string [@key "value"] }
  [@@deriving yojson, sexp]

  let check_scale scale =
    if Z.gt (Qv.S.num_of_q scale) Z.zero && Z.gt (Qv.S.den_of_q scale) Z.zero
    then true
    else false

  let make_scale ~sym ~sub_unit value_ =
    if check_scale value_ then {symbol_= sym; sub_unit_= sub_unit; value_}
    else raise (ValidScaleError "Valid scale must be greater than 0")

  let to_json t =
    Yojson.Safe.to_string
    @@ showable_to_yojson
         { kind= "scale_value"
         ; symbol= t.symbol_
         ; sub_unit= t.sub_unit_
         ; value= Qv.S.to_str t.value_ }

  let showable_of_t t =
    { kind= "scale_value"
    ; symbol= t.symbol_
    ; sub_unit= t.sub_unit_
    ; value= Qv.S.to_str t.value_ }

  let to_sexp t = sexp_of_showable @@ showable_of_t t
end

exception ScaleTypeMismatch of string

type t = {scale_: Scale.t; value_: Zv.t}

type showable =
  { kind: string [@key "kind"]
  ; symbol: string [@key "symbol"]
  ; sub_unit: string [@key "sub_unit"]
  ; s_value: string [@key "scale_value"]
  ; value: string [@key "discrete_value"] }
[@@deriving yojson, sexp]

let check_scale t1 t2 = if t1.scale_ == t2.scale_ then true else false

let make_dv (scale_, value_) = {scale_; value_}

let show_scale t =
  Printf.printf "(%s %s %s)" t.scale_.symbol_ t.scale_.sub_unit_
    (Qv.S.to_str t.scale_.value_)

let show_val t = Printf.printf "%s" (Zv.S.to_str t.value_)

let show_t t =
  Printf.printf "(%s %s %s %s)" t.scale_.symbol_ t.scale_.sub_unit_
    (Qv.S.to_str t.scale_.value_)
    (Zv.S.to_str t.value_)

let neg t = {t with value_= Zv.S.neg t.value_}

let abs t = {t with value_= Zv.S.abs t.value_}

let ( + ) t1 t2 =
  if check_scale t1 t2 then {t1 with value_= Zv.S.add t1.value_ t2.value_}
  else
    raise
      (ScaleTypeMismatch "cannot operate on two different currency scales")

let ( - ) t1 t2 =
  if check_scale t1 t2 then {t1 with value_= Zv.S.sub t1.value_ t2.value_}
  else
    raise
      (ScaleTypeMismatch "cannot operate on two different currency scales")

let ( * ) t value = {t with value_= Zv.S.mul t.value_ value}

let to_json t =
  Yojson.Safe.to_string
  @@ showable_to_yojson
       { kind= "discrete_value"
       ; symbol= t.scale_.symbol_
       ; sub_unit= t.scale_.sub_unit_
       ; s_value= Qv.S.to_str t.scale_.value_
       ; value= Zv.S.to_str t.value_ }

let showable_of_t t =
  { kind= "discrete_value"
  ; symbol= t.scale_.symbol_
  ; sub_unit= t.scale_.sub_unit_
  ; s_value= Qv.S.to_str t.scale_.value_
  ; value= Zv.S.to_str t.value_ }

let to_sexp t = sexp_of_showable @@ showable_of_t t
