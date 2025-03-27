exception CurrencyTypeMismatch of string

(** {1 Types} *)
type t =
  { symbol_: string  (** Currency Symbol *)
  ; value_: Qv.t  (** Value in Rational *) }
(** Type of quotient *)

(** {1 Construction} *)
val make_qv : string * Qv.t -> t
(** [make_qv name qv] makes t with a currenc symbol and quotient value, e.g. make_qv "GBP" make_q("123456/100") *)

val show_sym : t -> unit
(** [show_sym t] print t's currency symbol *)

val show_val : t -> unit
(** [show_val t] prints t's currency value *)

val show_t : t -> unit
(** [show_t t] prints t's quotient value *)

val neg : t -> t
(** [neg t] negates t's quotient value *)

val abs : t -> t
(** [abs t] returns t's absolute quotient value *)

val ( + ) : t -> t -> t
(** [t1 + t2] adds two t *)

val ( - ) : t -> t -> t
(** [t1 - t2] substracts two t *)

val ( * ) : t -> Qv.t -> t
(** [t * qv] multiplies a t with a plain rational value.
      Multiplying two quotient values does not make sense for currency ops *)

val ( / ) : t -> Qv.t -> t
(** [t / qv] divides a t with a plain rational value.
      Dividing two quotient values does not make sense for currency ops *)

val to_json : t -> Yojson.Safe.t
(** [to_json t] converts t to json string *)

val to_sexp : t -> Base.Sexp.t
(** [to_sexp t] converts t to sexp *)
