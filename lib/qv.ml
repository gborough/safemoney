type t = Q.t

exception NonsensicalQuotientValue of string

exception DenominatorZero of string

exception NonQuotientRep of string

module S = struct
  let one () = Q.one

  let neg t = Q.neg t

  let abs t = Q.abs t

  let signum t = Q.sign t

  let add t1 t2 = Q.add t1 t2

  let sub t1 t2 = Q.sub t1 t2

  let mul t1 t2 = Q.mul t1 t2

  let div t1 t2 = Q.div t1 t2

  let make str =
    let pat = Re.Pcre.regexp "^-?[0-9]+/+-?[0-9]+?$" in
    match Re.Pcre.pmatch ~rex:pat str with
    | true -> (
        let q = Q.of_string str in
        match Q.classify q with
        | Q.INF | Q.MINF | Q.UNDEF ->
            raise
              (NonsensicalQuotientValue
                 "nonsensical quotient values are not suitable for currency \
                  operation" )
        | Q.NZERO ->
            if Z.compare q.den Z.zero = 0 then
              raise (DenominatorZero "denominator must not be zero")
            else q
        | Q.ZERO -> Q.zero )
    | false ->
        raise
          (NonQuotientRep
             "only quotient representation allowed, e.g. 123/456" )

  let num_of_q t = Q.num t

  let den_of_q t = Q.den t

  let to_str t =
    if Z.compare (den_of_q t) Z.one = 0 then Q.to_string t ^ "/1"
    else Q.to_string t

  let to_float t = Q.to_float t
end
