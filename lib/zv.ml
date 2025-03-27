type t = Z.t

module S = struct
  let neg x = Z.neg x

  let abs x = Z.abs x

  let signum x = Z.sign x

  let add x y = Z.add x y

  let sub x y = Z.sub x y

  let mul x y = Z.mul x y

  let make str = Z.of_string str

  let to_str x = Z.to_string x

  let to_float x = Z.to_float x
end
