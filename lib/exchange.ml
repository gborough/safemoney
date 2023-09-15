open Core

module Make (Qv: Qv_intf.S) = struct
  exception IntermediaryMismatch of string [@@deriving sexp, yojson]

  module Quotient = Quotient.Make

  type t = {
    src: string;
    dst: string;
    value: Qv.t;
  }
  [@@deriving compare]

  type showable = {
    src_: string; [@key "src"]
    dst_: string; [@key "dst"]
    value_: string; [@key "value"]
  }
  [@@deriving show, sexp, yojson]

  let make_xchg ~src ~dst value = let value = Qv.S.abs value in { src; dst; value; }

  let show_xchg t = Printf.printf "Exchange rate from %s to %s: %s" t.src t.dst (Qv.S.to_str t.value)

  let ( **> ) t1 t2 =
    if String.compare t1.dst t2.src = 0 then { src = t1.src; dst = t2.dst; value = Qv.S.mul t1.value t2.value }
    else raise (IntermediaryMismatch "Intermediary currency symbol must be equal in order to compose exchange rate")

  let xchg_recip t = { src = t.dst; dst = t.src; value = Qv.S.div Qv.S.one t.value }

  let to_showable_json x = Yojson.Safe.to_string @@ showable_to_yojson { src_ = x.src; dst_ = x.dst; value_ = Qv.S.to_str x.value }
end
