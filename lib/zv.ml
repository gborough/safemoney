type t = Z.t

module S = struct
  let neg t = Z.neg t

  let abs t = Z.abs t

  let signum t = Z.sign t

  let add t1 t2 = Z.add t1 t2

  let sub t1 t2 = Z.sub t1 t2

  let mul t1 t2 = Z.mul t1 t2

  let make str = Z.of_string str

  let to_str t = Z.to_string t

  let to_float t = Z.to_float t
end
