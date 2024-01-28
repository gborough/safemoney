(** Exchange Representation*)

module Make (Qv : Qv_intf.S) : sig
  exception IntermediaryMismatch of string

  (** {1 Types} *)
  type t =
    { src : string (** Source. *)
    ; dst : string (** Destination. *)
    ; value : Qv.t (** Exhange Rate. *)
    }
  [@@deriving compare]

  (** showable for t *)
  type showable =
    { src_ : string [@key "src"]
    ; dst_ : string [@key "dst"]
    ; value_ : string [@key "value"]
    }
  [@@deriving show, sexp, yojson]

  (** {1 Construction} *)
  val make_xchg : src:string -> dst:string -> Qv.t -> t
  (** Construct exchange rate, e.g. make_xchg "GBP" "AUD" Utils.make_q(19400/1000) *)

  (** Print the exchange rate*)
  val show_xchg : t -> unit

  (** Exchange rate composition *)
  val ( **> ) : t -> t -> t

  (** Apply reciprocal to exchange rate. xchg_recip (xchg_recip xchg) = id *)
  val xchg_recip : t -> t

  (** Convert t to showable rep *)
  val to_showable_json : t -> string
end
