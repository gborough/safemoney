(** Rational Representation

    Wrapper type for Zarith Q rational type {{:https://ocaml.org/p/zarith/latest/doc/Q/index.html} [Q]}
    which serves as the underlying type for other currency types that are built based on rational values.

    Apart from few helper conversion functions, this signature implement most of what is equivalent to
    the Num typeclass sensibly. *)

module type S = sig
  (** {1 Types} *)
  type t = private Q.t [@@deriving compare]

  exception NonsensicalQuotientValue of string [@@deriving sexp, yojson]
  exception DenominatorZero of string [@@deriving sexp, yojson]
  exception NonQuotientRep of string [@@deriving sexp, yojson]

  module S : sig
    (** showable for t *)
    type showable = { value : string } [@@deriving show, sexp, yojson]

    (** Construction*)
    val make : string -> t
    (** Constructing Q by using a private type, create a Q value from string, e.g. [from_str "123/456"].
        Reason behind is to disallow a range of functions that are unsuitable for currency operations. Unsensical
        and undefined rational numbers are checked/excluded.In the context of safe money we want to establish
        a chain of proof that no lossy operations ever occurred. For convenience the function alias [make_q] can be used. *)

    (** Return rational value of 1: "1/1" or "1" *)
    val one : t

    (** Negate a Q value *)
    val neg : t -> t

    (** Return an absolute Q value *)
    val abs : t -> t

    (** Return the sign of Q value, -1, 0, or 1 when the argument is respectively negative, null, or positive. *)
    val signum : t -> int

    (** Add two Q values *)
    val add : t -> t -> t

    (** Substract two Q values *)
    val sub : t -> t -> t

    (** Multiply two Q values *)
    val mul : t -> t -> t

    (** Divide two Q values *)
    val div : t -> t -> t

    (** Get the numerator of a Q value *)
    val num_of_q : t -> Z.t

    (** Get the denominator of a Q value *)
    val den_of_q : t -> Z.t

    (** Convert a Q value to string *)
    val to_str : t -> string

    (** Convert a Q value to float *)
    val to_float : t -> float

    (** Convert a Q value to showable rep *)
    val to_showable_json : t -> string
  end
end
