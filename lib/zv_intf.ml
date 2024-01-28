(** Integer Representation

    Wrapper type for Zarith Z integer type {{:https://ocaml.org/p/zarith/latest/doc/Z/index.html} [Z]}
    which serves as the underlying type for other currency types that are built based on integer values.

    Apart from few helper conversion functions, this signature implement most of what is equivalent to
    the Num typeclass sensibly. *)

module type S = sig
  (** {1 Types} *)
  type t = private Z.t [@@deriving compare]

  module S : sig
    (** {1 Construction} *)
    val make : string -> t
    (** Constructing Z by using a private type, create a Z value from string, e.g. [from_str "123"].
        Reason behind is to disallow a range of functions that are unsuitable for currency operations.
        For convenience the function alias [make_z] can be used. *)

    (** showable for t *)
    type showable = { value : string } [@@deriving show, sexp, yojson]

    (** Negate a Z value *)
    val neg : t -> t

    (** Return an absolute Z value *)
    val abs : t -> t

    (** Return the sign of Z value, -1, 0, or 1 when the argument is respectively negative, null, or positive. *)
    val signum : t -> int

    (** Add two Z values *)
    val add : t -> t -> t

    (** Substract two Z values *)
    val sub : t -> t -> t

    (** Multiply two Z values *)
    val mul : t -> t -> t

    (** Convert a Z value to string *)
    val to_str : t -> string

    (** Convert a Z value to float *)
    val to_float : t -> float

    (** Convert a Q value to printable rep *)
    val to_showable_json : t -> string
  end
end
