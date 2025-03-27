module Discrete = Discrete
module Exchange = Exchange
module Quotient = Quotient
module Predefined = Predefined
module Ops = Ops

val make_q : string -> Qv.t
(** Helper function to make Qv value *)

val make_z : string -> Zv.t
(** Helper function to make Zv value *)

val qv_to_str : Qv.t -> string
(** Helper function to convert Qv to string *)

val zv_to_str : Zv.t -> string
(** Helper function to convert Zv to string *)
