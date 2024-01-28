open Core

(** Exchange type functor *)
module Exchange = Exchange.Make ((Qv : Qv_intf.S))

(** Quotient type functor *)
module Quotient = Quotient.Make ((Qv : Qv_intf.S))

(** Discrete type functor *)
module Discrete = Discrete.Make ((Qv : Qv_intf.S)) ((Zv : Zv_intf.S))

(** Signature for user-defined currency type. Typically one needs to provide the following:
    - currency symbol
    - currency description
    - number of named scales with their value if any

    To make custom type module simply implement the Custom signature:

    {[
      module Custome_Type : Custom = struct
        let symbol = "CSTM"
        let description = "Custom Currency"

        let units =
          let table = Hashtbl.create (module String) in
          let scale1 = Discrete.Scale.make_scale symbol "scale1" (Utils.make_q "1/1") in
          let scale2 = Discrete.Scale.make_scale symbol "scale2" (Utils.make_q "100/1") in
          Hashtbl.set table ~key:"scale1" ~data:scale1;
          Hashtbl.set table ~key:"scale2" ~data:scale2;
          Some table
        ;;

        let make_qv qv = Quotient.make_qv (symbol, qv)

        let make_dv unit dv =
          match units with
          | Some tbl ->
            let s =
              Option.value_exn ~message:"Error retriving non-existent scale"
              @@ Hashtbl.find tbl unit
            in
            Some (Discrete.make_dv (s, dv))
          | None -> None
        ;;
      end
    ]} *)

module type Custom = sig
  val symbol : string
  val description : string
  val units : (string, Discrete.Scale.t) Hashtbl.t option
  val make_qv : Qv.t -> Quotient.t
  val make_dv : string -> Zv.t -> Discrete.t option
end

(** Convevient helper to make rational Q value *)
let make_q v = Qv.S.make v

(** Convevient helper to make integer Z value *)
let make_z v = Zv.S.make v
