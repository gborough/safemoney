(** Discrete Representation

    Currency operates on discrete integer types with a scale setting *)

module Make (Qv : Qv_intf.S) (Zv : Zv_intf.S) : sig
  exception ScaleTypeMismatch of string

  module Scale : sig
    exception ValidScaleError of string

    (** {1 Types} *)
    type t =
      { symbol : string (** Currency Symbol *)
      ; unit : string (** Currency Unit Name *)
      ; value : Qv.t (** Scale Value in Rational *)
      }
    [@@deriving compare]
    (** Scale Representation

        Almost every currency has a unit value and sub unit values
        e.g. Pound is unit value for GBP with a scale of 1 to 1
        Penny is sub unit value for GBP with scale of 100 to 1. *)

    (** showable for t *)
    type showable =
      { symbol_ : string [@key "symbol"]
      ; unit_ : string [@key "unit"]
      ; value_ : string [@key "value"]
      }
    [@@deriving show, sexp, yojson]

    (** {1 Construction} *)
    val make_scale : string -> string -> Qv.t -> t
    (** Construct exchange rate, e.g. make_scale "GBP" "penny" Utils.make_q("100/1") *)

    (** Required scale to be position *)
    val check_scale : Qv.t -> bool

    (** Convert t to showable rep *)
    val to_showable_json : t -> string
  end

  (** {1 Types} *)
  type t =
    { scale : Scale.t (** Scale Setting *)
    ; value : Zv.t (** Integer Value *)
    }

  (** showable for t *)
  type showable =
    { scale_ : string [@key "scale"]
    ; value_ : string [@key "value"]
    }
  [@@deriving show, sexp, yojson]

  (** {1 Construction} *)
  val make_dv : Scale.t * Zv.t -> t
  (** Construct discrete value*)

  (** Print the scale setting *)
  val show_scale : t -> unit

  (** Print the integer value *)
  val show_val : t -> unit

  (** Print the discrete value *)
  val show_t : t -> unit

  (** Negate a discrete integer value *)
  val neg : t -> t

  (** Return an absolute discrete integer value *)
  val abs : t -> t

  (** Add two discrete integer values *)
  val ( + ) : t -> t -> t

  (** Substract two discrete integer values *)
  val ( - ) : t -> t -> t

  (** Multiply two discrete integer values *)
  val ( * ) : t:t -> value:Zv.t -> t

  (** Convert t to showable rep *)
  val to_showable_json : t -> string
end
