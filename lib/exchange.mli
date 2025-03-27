exception IntermediaryMismatch of string

(** {1 Types} *)
type t =
  { src_: string  (** source *)
  ; dst_: string  (** destination *)
  ; value_: Qv.t  (** exhange rate *) }
(** Type of exhange rate *)

(** {1 Construction} *)
val make_xchg : src:string -> dst:string -> Qv.t -> t
(** [make_xchg src dst qv] makes an exchange rate, taking a src: "GBP", a dst: "AUD", and a qv: make_q(19400/1000) *)

val show_xchg : t -> unit
(** [show_xchg t] prints t *)

val ( **> ) : t -> t -> t
(** [ t1 **> t2 ] composes two different exchange rates, dst of t1 must equal to src of t2 *)

val xchg_recip : t -> t
(** [xchg_recip t] applies reciprocal to exchange rate, xchg_recip (xchg_recip xchg) = id *)

val to_json : t -> string
(** [to_json t] converts t to json string *)

val to_sexp : t -> Base.Sexp.t
(** [to_sexp t] converts t to sexp *)
