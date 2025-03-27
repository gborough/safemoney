(* Rational Representation

   Wrapper type for Zarith Q rational type
   {{:https://ocaml.org/p/zarith/latest/doc/Q/index.html} [Q]} which serves
   as the underlying type for other currency types that are built based on
   rational values *)

module type S = sig
  type t = private Q.t

  exception NonsensicalQuotientValue of string

  exception DenominatorZero of string

  exception NonQuotientRep of string

  module S : sig
    val make : string -> t

    val one : unit -> t

    val neg : t -> t

    val abs : t -> t

    val signum : t -> int

    val add : t -> t -> t

    val sub : t -> t -> t

    val mul : t -> t -> t

    val div : t -> t -> t

    val num_of_q : t -> Z.t

    val den_of_q : t -> Z.t

    val to_str : t -> string

    val to_float : t -> float
  end
end
