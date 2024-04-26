open Types
open Stdint

(** Float round strategies*)
type rounding =
  | Up  (** decimal digits ignored *)
  | Down  (** decimal digits ignored *)
  | Nearest  (** decimal digits ignored *)
  | NearestHalfToEven  (** decimal digits ignored *)
  | TowardsZero  (** decimal digits ignored *)
  | WithDecimalPrecision
      (** rounding up to number of decimal digits provided *)
  | Truncate  (** rounding down to number of decimal digits provided *)

(** Separator Configuration *)
module Separator : sig
  (** {1 Types} *)
  type t = private string * string option

  (** Construction*)
  val make_exn : char * char option -> t
  (** e.g. make_exn (',', Some '.') *)

  val fst : t -> string
  (** Get first separator *)

  val snd : t -> string option
  (** Get second optional separator *)
end

(** Printing and rounding configuration *)
type printing_conf =
  { separator: Separator.t
  ; plus_sign: bool
  ; num_of_digits: Uint8.t
  ; rounding: rounding }

val make_printing_conf :
     sep:Separator.t
  -> plus_sign:bool
  -> num_of_digits:int
  -> rounding:rounding
  -> printing_conf
(** Make printing and rounding configuration *)

val mark_thousands : v:int -> sep:string -> string

val sep_comma : unit -> Separator.t
(** Premade separator configuration, e.g. 1000,0 *)

val sep_comma_dot : unit -> Separator.t
(** Premade separator configuration, e.g. 1.000,0 *)

val sep_comma_space : unit -> Separator.t
(** Premade separator configuration, e.g. 1_000,0*)

val sep_dot : unit -> Separator.t
(** Premade separator configuration, e.g. 1000.0 *)

val sep_dot_comma : unit -> Separator.t
(** Premade separator configuration, e.g. 1,000.0 *)

val sep_dot_space : unit -> Separator.t
(** Premade separator configuration, e.g. 1_000.0 *)

val default_printing_conf : unit -> printing_conf
(** Default printing configuration *)

val q_to_decimal : printing_conf:printing_conf -> qv:Qv.t -> string
(** Convert a rational value to string representation of a float value with a printing configuration.
    e.g. [let sep_dot_comma = Separator.make_exn ('.', Some ',') in
    let printing_conf = { separator = sep_dot_comma; plus_sign = true; num_of_digits = Uint8.of_int 4; rounding = Truncate } in
    q_to_decimal ~printing_conf: printing_conf ~qv: (Utils.make_q "-1234567/7")]
    would print "-176366.7142" *)

val seal_quotient : printing_conf:printing_conf -> qv:Quotient.t -> string
(** Convert quotient value to the string representaion of a float value with a printing configuration.
    This should be used as the final step after all operations have been carried out. *)

val seal_discrete : printing_conf:printing_conf -> dv:Discrete.t -> string
(** Convert discrete value to the string representaion of a float value with a printing configuration.
    This should be used as the final step after all operations have been carried out. *)

val seal_exchange : printing_conf:printing_conf -> xchg:Exchange.t -> string
(** Convert exchange value to the string representaion of a float value with a printing configuration.
    This should be used as the final step after all operations have been carried out. *)

val seal_scale :
  printing_conf:printing_conf -> scale:Discrete.Scale.t -> string
(** Convert scale value to the string representaion of a float value with a printing configuration.
    This should be used as the final step after all operations have been carried out. *)

val unsafe_decimal_to_q :
  decimal:string -> sep:Separator.t -> (string, string) result
(** Parse the string representation of a float value with printing configuration
    e.g. [ let sep = Separator.make_exn ('.', Some ',') in unsafe_decimal_to_q ~decimal : "+123,456.789"]
    would convert value to "123456.789" *)

val unsafe_float_to_quotient :
  symbol:string -> decimal:string -> sep:Separator.t -> Quotient.t
(** Unsafely convert a float value of string rep to quotient value.
    It is unsafe in a sense that the origin of float is deemed to
    be unverified by default and might be as a result of lossy operations. *)

val unsafe_float_to_discrete :
  scale:Discrete.Scale.t -> integer:int -> Discrete.t
(** Unsafely convert a integer value of string rep to discrete value.
    It is unsafe in a sense that the origin of the integer is deemed to
    be unverified by default and might be as a result of lossy operations. *)

val unsafe_float_to_exchange :
  src:string -> dst:string -> decimal:string -> sep:Separator.t -> Exchange.t
(** Unsafely convert a float/decimal value of string rep to exchange value.
    It is unsafe in a sense that the origin of float/decimal is deemed to
    be unverified by default and might be as a result of lossy operations. *)

val unsafe_float_to_scale :
     symbol:string
  -> unit:string
  -> decimal:string
  -> sep:Separator.t
  -> Discrete.Scale.t
(** Unsafely convert a float/decimal value of string rep to scale value.
    It is unsafe in a sense that the origin of float/decimal is deemed to
    be unverified by default and might be as a result of lossy operations. *)
