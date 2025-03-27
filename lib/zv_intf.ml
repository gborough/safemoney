(* Integer Representation

   Wrapper type for Zarith Z integer type
   {{:https://ocaml.org/p/zarith/latest/doc/Z/index.html} [Z]} which serves
   as the underlying type for other currency types that are built based on
   integer values *)

module type S = sig
  type t = private Z.t

  module S : sig
    val make : string -> t

    val neg : t -> t

    val abs : t -> t

    val signum : t -> int

    val add : t -> t -> t

    val sub : t -> t -> t

    val mul : t -> t -> t

    val to_str : t -> string

    val to_float : t -> float
  end
end
