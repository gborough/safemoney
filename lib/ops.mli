open Stdint

(** Type of rounding strategies*)
type rounding =
  | Up  (** decimal digits ignored *)
  | Down  (** decimal digits ignored *)
  | Nearest  (** decimal digits ignored *)
  | NearestHalfToEven  (** decimal digits ignored *)
  | TowardsZero  (** decimal digits ignored *)
  | WithDecimalPrecision
      (** rounding up to number of decimal digits provided *)
  | Truncate  (** rounding down to number of decimal digits provided *)

(** Type of separator configuration *)
module Separator : sig
  (** {1 Types} *)
  type t = private string * string option

  val make_exn : char * char option -> t
  (** [make_exn c c_opt] makes sep config, e.g. make_exn (',', Some '.') *)

  val fst : t -> string
  (** [fst t] gets t's first separator *)

  val snd : t -> string option
  (** [snd t] gets t's second optional separator *)
end

(** Type of printing and rounding configuration *)
type printing_conf =
  { separator: Separator.t  (** type of separator *)
  ; plus_sign: bool  (** whether to print + sign if positive *)
  ; num_of_digits: Uint8.t  (** num of decimal places printed *)
  ; rounding: rounding  (** rounding strategy used *) }

val make_printing_conf :
     sep:Separator.t
  -> plus_sign:bool
  -> num_of_digits:int
  -> rounding:rounding
  -> printing_conf
(** [make_printing_conf separator plus_sign num_of_digits rounding] makes a printing config *)

val mark_thousands : v:int -> sep:string -> string
(** [mark_thousands position separator] marks a thousand separator at the position specified *)

val sep_comma : unit -> Separator.t
(** [sep_comma ()] pre-made separator configuration, e.g. 1000,0 *)

val sep_comma_dot : unit -> Separator.t
(** [sep_comma_dot ()] pre-made separator configuration, e.g. 1.000,0 *)

val sep_comma_space : unit -> Separator.t
(** [sep_comma_space ()] pre-made separator configuration, e.g. 1_000,0*)

val sep_dot : unit -> Separator.t
(** [sep_dot ()] pre-made separator configuration, e.g. 1000.0 *)

val sep_dot_comma : unit -> Separator.t
(** [sep_dot_comma ()] pre-made separator configuration, e.g. 1,000.0 *)

val sep_dot_space : unit -> Separator.t
(** [sep_dot_space ()] pre-made separator configuration, e.g. 1_000.0 *)

val default_printing_conf : unit -> printing_conf
(** [default_printing_conf ()] makes a default printing configuration *)

val q_to_decimal : printing_conf:printing_conf -> q:Qv.t -> string
(** [q_to_decimal printing_conf q] converts a rational value q to string representation of a float value with a printing configuration.
    e.g. [let sep_dot_comma = Separator.make_exn ('.', Some ',') in
    let printing_conf = { separator = sep_dot_comma; plus_sign = true; num_of_digits = Uint8.of_int 4; rounding = Truncate } in
    q_to_decimal ~printing_conf: printing_conf ~qv: (Utils.make_q "-1234567/7")]
    would print "-176366.7142" *)

val seal_quotient : printing_conf:printing_conf -> qv:Quotient.t -> string
(** [seal_quotient printing_conf qv] converts a quotient value qv to the string representaion of a float value with a printing configuration.
    This should be used as the final step after all operations have been carried out *)

val seal_discrete : printing_conf:printing_conf -> dv:Discrete.t -> string
(** [seal_discrete printing_conf dv] converts a discrete value dv to the string representaion of a float value with a printing configuration.
    This should be used as the final step after all operations have been carried out *)

val seal_exchange : printing_conf:printing_conf -> xchg:Exchange.t -> string
(** [seal_exchange printing_conf xchg] converts an exchange value xchg to the string representaion of a float value with a printing configuration.
    This should be used as the final step after all operations have been carried out *)

val seal_scale :
  printing_conf:printing_conf -> scale:Discrete.Scale.t -> string
(** [seal_scale printing_conf scale] converts a scale value to the string representaion of a float value with a printing configuration.
    This should be used as the final step after all operations have been carried out *)

val unsafe_decimal_to_q :
  decimal:string -> sep:Separator.t -> (string, string) result
(** [unsafe_decimal_to_q decimal sep] parses the string representation of a float value with printing configuration
    e.g. [ let sep = Separator.make_exn ('.', Some ',') in unsafe_decimal_to_q ~decimal : "+123,456.789"]
    would convert value to "123456.789" 
    It is unsafe in a sense that the origin of float is deemed to
    be unverified by default and might be as a result of lossy operations *)

val unsafe_float_to_quotient :
  symbol:string -> decimal:string -> sep:Separator.t -> Quotient.t
(** [unsafe_float_to_quotient symbol decimal sep] converts a float value of string rep to quotient value.
    It is unsafe in a sense that the origin of float is deemed to
    be unverified by default and might be as a result of lossy operations *)

val unsafe_float_to_discrete :
  scale:Discrete.Scale.t -> integer:int -> Discrete.t
(** [unsafe_float_to_discrete symbol decimal sep] converts an integer value of string rep to discrete value.
    It is unsafe in a sense that the origin of the integer is deemed to
    be unverified by default and might be as a result of lossy operations *)

val unsafe_float_to_exchange :
  src:string -> dst:string -> decimal:string -> sep:Separator.t -> Exchange.t
(** [unsafe_float_to_exchange src dst decimal sep] converts a float/decimal value of string rep to exchange value.
    It is unsafe in a sense that the origin of float/decimal is deemed to
    be unverified by default and might be as a result of lossy operations *)

val unsafe_float_to_scale :
     sym:string
  -> sub_unit:string
  -> decimal:string
  -> sep:Separator.t
  -> Discrete.Scale.t
(** [unsafe_float_to_scale sym sub_unit decimal sep] converts a float/decimal value of string rep to scale value.
    It is unsafe in a sense that the origin of float/decimal is deemed to
    be unverified by default and might be as a result of lossy operations *)
