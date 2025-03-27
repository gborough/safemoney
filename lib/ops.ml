open Base
open Stdint
open Types

type rounding =
  | Up
  | Down
  | Nearest
  | NearestHalfToEven
  | TowardsZero
  | WithDecimalPrecision
  | Truncate

module Separator = struct
  type t = string * string option

  let make_exn (c1, c2) =
    if Char.is_digit c1 || Char.is_whitespace c1 then
      failwith "C1 separator type not allowed"
    else
      match c2 with
      | Some c2 ->
          if Char.compare c1 c2 = 0 then
            failwith "Separator must be different as per convention"
          else if Char.is_digit c2 || Char.is_whitespace c2 then
            failwith "C2 separator type not allowed"
          else (String.of_char c1, Some (String.of_char c2))
      | None -> (String.of_char c1, None)

  let fst x = fst x

  let snd x = snd x
end

type printing_conf =
  { separator: Separator.t
  ; plus_sign: bool
  ; num_of_digits: Uint8.t
  ; rounding: rounding }

let make_printing_conf ~sep ~plus_sign ~num_of_digits ~rounding =
  { separator= sep
  ; plus_sign
  ; num_of_digits= Uint8.of_int num_of_digits
  ; rounding }

let sep_comma () = Separator.make_exn (',', None)

let sep_comma_dot () = Separator.make_exn (',', Some '.')

let sep_comma_space () = Separator.make_exn (',', Some '_')

let sep_dot () = Separator.make_exn ('.', None)

let sep_dot_comma () = Separator.make_exn ('.', Some ',')

let sep_dot_space () = Separator.make_exn ('.', Some '_')

let default_printing_conf () =
  make_printing_conf ~sep:(sep_dot ()) ~plus_sign:false ~num_of_digits:2
    ~rounding:Up

(** Mark a positive integer value with thousand separator configuration
    e.g. [mark_thousands ~v: 1234567 ~sep: ","]
    would print "1,234,567" *)
let mark_thousands ~v ~sep =
  let k = 1000 in
  if Int.compare v k < 0 then Int.to_string v
  else
    let divmod num den = (Int.( / ) num den, Int.rem num den) in
    let aux ~sep ~i =
      match divmod i k with
      | 0, 0 -> None
      | 0, rem -> Some (Int.to_string rem, 0)
      | quo, rem ->
          if Int.compare rem 10 < 0 then
            Some (sep ^ "0" ^ "0" ^ Int.to_string rem, quo)
          else if Int.compare rem 100 < 0 then
            Some (sep ^ "0" ^ Int.to_string rem, quo)
          else Some (sep ^ Int.to_string rem, quo)
    in
    Sequence.fold ~init:"" ~f:(Fn.flip ( ^ ))
      (Sequence.unfold ~init:v ~f:(fun i -> aux ~sep ~i))

let q_to_decimal ~printing_conf ~q =
  let qv = Qv.S.to_float q in
  let sep1 = Separator.fst printing_conf.separator in
  let sep2 =
    Option.value (Separator.snd printing_conf.separator) ~default:""
  in
  let num_of_digits = Uint8.to_int printing_conf.num_of_digits in
  let modf_aux v =
    ( Float.Parts.integral @@ Float.modf v
    , Float.abs @@ Float.Parts.fractional @@ Float.modf v )
  in
  let sign_aux v =
    match Float.sign_exn @@ fst v with
    | Sign.Pos -> if printing_conf.plus_sign then "+" else ""
    | Sign.Neg -> "-"
    | _ -> ""
  in
  let print_aux v =
    let parts = modf_aux v in
    let sign = sign_aux parts in
    sign
    ^ mark_thousands ~v:(Int.abs @@ Float.to_int (fst parts)) ~sep:sep2
    ^ sep1 ^ Int.to_string
    @@ Float.to_int (snd parts)
  in
  match printing_conf.rounding with
  | Up -> print_aux @@ Float.round_up qv
  | Down -> print_aux @@ Float.round_down qv
  | Nearest -> print_aux @@ Float.round_nearest qv
  | NearestHalfToEven -> print_aux @@ Float.round_nearest_half_to_even qv
  | TowardsZero -> print_aux @@ Float.round_towards_zero qv
  | WithDecimalPrecision ->
      let round_decimal ?(decimal_digits = 2) qv =
        Float.round_decimal ~decimal_digits qv
      in
      print_aux @@ round_decimal ~decimal_digits:num_of_digits qv
  | Truncate -> (
      let fpair = modf_aux qv in
      let sign = sign_aux fpair in
      let rec aux acc n s : string =
        if n = 0 then acc else aux (s ^ acc) (n - 1) s
      in
      let pad = aux "" num_of_digits "0" in
      let f_part v =
        Option.value
          (List.nth (String.split (Float.to_string v) ~on:'.') 1)
          ~default:""
      in
      let take_digits len v =
        let open Angstrom in
        match parse_string ~consume:Prefix (take len) v with
        | Ok r -> r
        | Error _ -> failwith "error parsing digits"
      in
      match fpair with
      | 0., 0. -> sign ^ "0" ^ sep1 ^ pad
      | i, 0. ->
          let ipart =
            mark_thousands ~v:(Int.abs @@ Float.to_int i) ~sep:sep2
          in
          sign ^ ipart ^ sep1 ^ pad
      | i, f ->
          let fpart = f_part f in
          let ipart =
            mark_thousands ~v:(Int.abs @@ Float.to_int i) ~sep:sep2
          in
          let len = num_of_digits - String.length fpart in
          let dig = take_digits num_of_digits fpart in
          if len > 0 then sign ^ ipart ^ sep1 ^ dig ^ aux "" len "0"
          else sign ^ ipart ^ sep1 ^ dig )

(** Unsafely convert a float/decimal value of string rep to integer value.
    It is unsafe in a sense that the origin of float/decimal is deemed to
    be unverified by default and might be as a result of lossy operations *)
let unsafe_integer_to_z integer = Z.to_string @@ Z.of_int integer

let seal_quotient ~printing_conf ~(qv : Quotient.t) =
  q_to_decimal ~printing_conf ~q:qv.value_

let seal_discrete ~printing_conf ~(dv : Discrete.t) =
  let z_to_q =
    Qv.S.div (Qv.S.make (Zv.S.to_str dv.value_ ^ "/1")) dv.scale_.value_
  in
  q_to_decimal ~printing_conf ~q:z_to_q

let seal_exchange ~printing_conf ~(xchg : Exchange.t) =
  q_to_decimal ~printing_conf ~q:xchg.value_

let seal_scale ~printing_conf ~(scale : Discrete.Scale.t) =
  q_to_decimal ~printing_conf ~q:scale.value_

let unsafe_decimal_to_q ~decimal ~sep =
  let sep1 = Separator.fst sep in
  let is_eol = function '\r' | '\n' -> true | _ -> false in
  let open Angstrom in
  let parser =
    lift3
      (fun sign ipart fpart ->
        Q.to_string @@ Q.of_float
        @@ Float.of_string (sign ^ ipart ^ sep1 ^ fpart) )
      ( peek_char
      >>= function
      | Some '-' -> advance 1 >>| fun () -> "-"
      | Some '+' -> advance 1 >>| fun () -> ""
      | Some c when Char.is_digit c -> return ""
      | _ -> fail "failure parsing sign" )
      ( match Separator.snd sep with
      | None -> take_while1 Char.is_digit
      | Some sep2 ->
          lift2
            (fun start rest -> start ^ rest)
            ( count 3 (satisfy Char.is_digit)
            <|> count 2 (satisfy Char.is_digit)
            <|> count 1 (satisfy Char.is_digit)
            >>| String.of_char_list )
            ( many
              @@ char (Char.of_string sep2)
                 *> count 3 (satisfy Char.is_digit)
            >>| List.concat >>| String.of_char_list ) )
      ( (char (Char.of_string sep1) >>| String.of_char)
      *> ( take_while1 (fun c -> if Char.is_digit c then true else false)
         <* take_till is_eol
         <|> (at_end_of_input >>| fun _ -> "") ) )
  in
  parse_string ~consume:All parser decimal

let unsafe_float_to_quotient ~symbol ~decimal ~sep =
  match unsafe_decimal_to_q ~decimal ~sep with
  | Ok qv -> Quotient.make_qv (symbol, Qv.S.make qv)
  | Error msg -> failwith msg

let unsafe_float_to_discrete ~scale ~integer =
  let r = unsafe_integer_to_z integer in
  Discrete.make_dv (scale, Zv.S.make r)

let unsafe_float_to_exchange ~src ~dst ~decimal ~sep =
  match unsafe_decimal_to_q ~decimal ~sep with
  | Ok qv -> Exchange.make_xchg ~src ~dst (Qv.S.make qv)
  | Error msg -> failwith msg

let unsafe_float_to_scale ~sym ~sub_unit ~decimal ~sep =
  match unsafe_decimal_to_q ~decimal ~sep with
  | Ok qv -> Discrete.Scale.make_scale ~sym ~sub_unit (Qv.S.make qv)
  | Error msg -> failwith msg
