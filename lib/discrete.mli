exception ScaleTypeMismatch of string

module Scale : sig
  exception ValidScaleError of string

  (** {1 Types} *)
  type t =
    { symbol_: string  (** currency symbol *)
    ; sub_unit_: string  (** currency unit name *)
    ; value_: Qv.t  (** scale value in rational *) }
  (** Type of scale

        Almost every currency has a unit value and sub unit values
        e.g. Pound is unit value for GBP with a scale of 1 to 1
        Penny is sub unit value for GBP with scale of 100 to 1 *)

  (** {1 Construction} *)
  val make_scale : sym:string -> sub_unit:string -> Qv.t -> t
  (** [make_scale symbol subunit qv] makes exchange rate, e.g. make_scale "GBP" "penny" make_q("100/1") *)

  val to_json : t -> Yojson.Safe.t
  (** [to_json t] converts t to json *)

  val to_sexp : t -> Base.Sexp.t
  (** [to_sexp t] converts t to sexp *)
end

(** {1 Types} *)
type t =
  {scale_: Scale.t  (** Scale Setting *); value_: Zv.t  (** Integer Value *)}

(** {1 Construction} *)
val make_dv : Scale.t * Zv.t -> t
(** [make_dv scale zv] constructs t with scale and zv*)

val show_scale : t -> unit
(** [show_scale t] prints t's scale setting *)

val show_val : t -> unit
(** [show_val t] prints t's discrete integer value *)

val show_t : t -> unit
(** [show_t t] prints t *)

val neg : t -> t
(** [neg t] negates t's discrete integer value *)

val abs : t -> t
(** [abs t] returns t's absolute discrete integer value *)

val ( + ) : t -> t -> t
(** [t + qv] adds two t *)

val ( - ) : t -> t -> t
(** [t - qv] substract two t *)

val ( * ) : t -> Zv.t -> t
(** [t * qv] multiplies t's value part with a discrete integer values *)

val to_json : t -> Yojson.Safe.t
(** [to_json t] converts t to json string *)

val to_sexp : t -> Base.Sexp.t
(** [to_sexp t] converts t to sexp*)
