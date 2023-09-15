open Core

module Make (Qv: Qv_intf.S) (Zv: Zv_intf.S) = struct
  exception ScaleTypeMismatch of string [@@deriving sexp, yojson]

  module Scale = struct
    exception ValidScaleError of string [@@deriving sexp, yojson]

    type t = {
      symbol: string;
      unit: string;
      value: Qv.t;
    }
    [@@deriving compare]

    type showable = {
      symbol_: string; [@key "symbol"]
      unit_: string; [@key "unit"]
      value_: string; [@key "value"]
    }
    [@@deriving show, sexp, yojson]

    let check_scale scale =
      if Z.gt (Qv.S.num_of_q scale) Z.zero && Z.gt (Qv.S.den_of_q scale) Z.zero then true else false

    let make_scale symbol unit value =
      if check_scale value then { symbol = symbol; unit = unit; value = value; }
      else raise (ValidScaleError "Valid scale must be greater than 0")

    let to_showable_json x = Yojson.Safe.to_string @@ showable_to_yojson { symbol_ = x.symbol; unit_ = x.unit; value_ = Qv.S.to_str x.value }
  end

  type t = {
    scale: Scale.t;
    value: Zv.t;
  }
  [@@deriving compare]

  type showable = {
    scale_: string; [@key "discrete_scale"]
    value_: string; [@key "discrete_value"]
  }
  [@@deriving show, sexp, yojson]

  let check_scale t1 t2 =
    if Scale.compare t1.scale t2.scale = 0 then true else false

  let make_dv (scale, value) = { scale = scale; value = value; }

  let show_scale t = Printf.printf "(%s %s %s)" t.scale.symbol t.scale.unit (Qv.S.to_str t.scale.value)

  let show_val t = Printf.printf "%s" (Zv.S.to_str t.value)

  let show_t t = Printf.printf "(%s %s %s %s)" t.scale.symbol t.scale.unit (Qv.S.to_str t.scale.value) (Zv.S.to_str t.value)

  let neg t = { t with value = Zv.S.neg t.value }

  let abs t = { t with value = Zv.S.abs t.value }

  let ( + ) t1 t2 =
    if check_scale t1 t2 then { t1 with value = Zv.S.add t1.value t2.value }
    else raise (ScaleTypeMismatch "cannot operate on two different currency scales")

  let ( - ) t1 t2 =
    if check_scale t1 t2 then { t1 with value = Zv.S.sub t1.value t2.value }
    else raise (ScaleTypeMismatch "cannot operate on two different currency scales")

  let ( * ) ~t ~value = { t with value = Zv.S.mul t.value value }

  let to_showable_json x = Yojson.Safe.to_string @@ showable_to_yojson { scale_ = Scale.to_showable_json x.scale; value_ = Zv.S.to_showable_json x.value }
end
