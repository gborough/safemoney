(** Exchange Representation*)

module Make (Qv : Qv_intf.S) : sig
  exception IntermediaryMismatch of string

  (** {1 Types} *)
  type t =
    { src: string  (** Source. *)
    ; dst: string  (** Destination. *)
    ; value: Qv.t  (** Exhange Rate. *) }
  [@@deriving compare]

  (** showable for t *)
  type showable =
    { src_: string [@key "src"]
    ; dst_: string [@key "dst"]
    ; value_: string [@key "value"] }
  [@@deriving show, yojson]

  (** {1 Construction} *)
  val make_xchg : src:string -> dst:string -> Qv.t -> t
  (** Construct exchange rate, e.g. make_xchg "GBP" "AUD" Utils.make_q(19400/1000) *)

  val show_xchg : t -> unit
  (** Print the exchange rate*)

  val ( **> ) : t -> t -> t
  (** Exchange rate composition *)

  val xchg_recip : t -> t
  (** Apply reciprocal to exchange rate. xchg_recip (xchg_recip xchg) = id *)

  val to_json : t -> string
  (** Convert t to json*)
end
