(** Quotient Representation

    Currency operates on rational types *)

module Make (Qv : Qv_intf.S) : sig
  exception CurrencyTypeMismatch of string

  (** {1 Types} *)
  type t =
    { symbol : string (** Currency Symbol *)
    ; value : Qv.t (** Value in Rational *)
    }
  [@@deriving compare]

  (** showable for t *)
  type showable =
    { symbol_ : string [@key "symbol"]
    ; value_ : string [@key "value"]
    }
  [@@deriving show, sexp, yojson]

  (** {1 Construction} *)
  val make_qv : string * Qv.t -> t
  (** Construct quotient value, e.g. make_qv "GBP" Utils.make_q("123456/100") *)

  (** Print the currency symbol *)
  val show_sym : t -> unit

  (** Print the currency value *)
  val show_val : t -> unit

  (** Print the quotient value *)
  val show_t : t -> unit

  (** Negate a quotient value *)
  val neg : t -> t

  (** Return an absolute quotient value *)
  val abs : t -> t

  (** Add two quotient values with same symbol as required *)
  val ( + ) : t -> t -> t

  (** Substract two quotient values with same symbol as required *)
  val ( - ) : t -> t -> t

  (** Multiply a quotient value with a plain rational value.
      Multiplying two quotient values does not make sense for currency ops. *)
  val ( * ) : t:t -> value:Qv.t -> t

  (** Divide a quotient value with a plain rational value.
      Dividing two quotient values does not make sense for currency ops. *)
  val ( / ) : t -> Qv.t -> t

  (** Convert t to showable rep *)
  val to_showable_json : t -> string
end
