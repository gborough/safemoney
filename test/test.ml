open Core
open Stdint
open Safemoney_lib
open Safemoney

let%expect_test "qv_ops" =
  let open Quotient in
  let qv1 = make_qv ("AUD", make_q "3/1") in
  let qv2 = make_qv ("AUD", make_q "2/1") in
  let r = abs (neg (( / ) (( * ) ~t: (( - ) (( + ) qv1 qv2) qv2) ~value: (make_q "3/1")) (make_q "3/1"))) in
  (Qv.S.to_str r.value |> print_endline);
  [%expect {|3/1|}]

(* qv_ops_diff_currency *)
let () =
  let open Quotient in
  try
    let qv1 = make_qv ("AUD", make_q "3/1") in
    let qv2 = make_qv ("GBP", make_q "2/1") in
    let _r = abs (neg (( / ) (( * ) ~t: (( - ) (( + ) qv1 qv2) qv2) ~value: (make_q "3/1")) (make_q "3/1"))) in
    Printf.printf "%s" ""
  with
    | CurrencyTypeMismatch _ -> ()
    | _ -> exit 1

let%expect_test "dv_ops_with_scale" =
  let open Discrete in
  let scale = Scale.make_scale "AUD" "cent" (make_q "100/1") in
  let dv1 = make_dv (scale, make_z "200") in
  let dv2 = make_dv (scale, make_z "100") in
  let r = ( * ) ~t: (( - ) (( + ) dv1 dv2) dv2) ~value: (make_z "10") in
  Zv.S.to_str r.value |> print_endline;
  [%expect {|2000|}]

(* dv_ops_with_diff_scale *)
let () =
  let open Discrete in
  try
    let scale1 = Scale.make_scale "AUD" "cent" (make_q "100/1") in
    let scale2 = Scale.make_scale "GBP" "penny" (make_q "100/1") in
    let dv1 = make_dv (scale1, make_z "200") in
    let dv2 = make_dv (scale2, make_z "100") in
    let _r = ( * ) ~t: (( - ) (( + ) dv1 dv2) dv2) ~value: (make_z "10") in
    Printf.printf "%s" ""
  with
    | ScaleTypeMismatch _ -> ()
    | _ -> exit 1

(* non_valid_scale *)
let () =
  let open Discrete in
  try
    let _scale = Scale.make_scale "AUD" "cent" (make_q "-100/1") in
    Printf.printf "%s" ""
  with
    | Scale.ValidScaleError _ -> ()
    | _ -> exit 1

let%expect_test "xchg_ops" =
  let open Exchange in
  let gbp_to_aud = xchg_recip (xchg_recip (make_xchg ~src: "GBP" ~dst: "AUD" (make_q "8872/4503"))) in
  let aud_to_nzd = make_xchg ~src: "AUD" ~dst: "NZD" (make_q "4908/4503") in
  let gbp_to_nzd = ( **> ) gbp_to_aud aud_to_nzd in
  gbp_to_nzd.src |> print_endline;
  gbp_to_nzd.dst |> print_endline;
  Qv.S.to_str gbp_to_nzd.value |> print_endline;
  [%expect {|
    GBP
    NZD
    14514592/6759003 |}
  ]

(* diff_intermediary_symbol *)
let () =
  let open Exchange in
  try
    let gbp_to_aud = xchg_recip (xchg_recip (make_xchg ~src: "GBP" ~dst: "AUD" (make_q "8872/4503"))) in
    let aud_to_nzd = make_xchg ~src: "USD" ~dst: "NZD" (make_q "4908/4503") in
    let _gbp_to_nzd = ( **> ) gbp_to_aud aud_to_nzd in
    Printf.printf "%s" ""
  with
    | IntermediaryMismatch _ -> ()
    | _ -> exit 1

let%expect_test "predefined" =
  let open Predefined in
  let open Quotient in
  let qv1 = ISO4217_AUD.make_qv (make_q "3/1") in
  let qv2 = ISO4217_AUD.make_qv (make_q "2/1") in
  let dv1 = Core.Option.value_exn (ISO4217_AUD.make_dv "cent" (make_z "200")) in
  let dv2 = Core.Option.value_exn (ISO4217_AUD.make_dv "cent" (make_z "100")) in
  let rv = abs (neg (( / ) (( * ) ~t: (( - ) (( + ) qv1 qv2) qv2) ~value: (make_q "3/1")) (make_q "3/1"))) in
  let open Discrete in
  let dv = ( * ) ~t: (( - ) (( + ) dv1 dv2) dv2) ~value: (make_z "10") in
  (Qv.S.to_str rv.value |> print_endline);
  (Zv.S.to_str dv.value |> print_endline);
  [%expect {|
    3/1
    2000|}
  ]

let%expect_test "mark_thousands" =
  Utils.mark_thousands ~v: (1234567) ~sep: "," |> print_endline;
  [%expect {|1,234,567|}]

let%expect_test "qv_to_decimal_up" =
  let open Utils in
  let printing_conf = { separator = sep_dot_comma; plus_sign = true; num_of_digits = Uint8.of_int 4; rounding = Up } in
  q_to_decimal ~printing_conf: printing_conf ~qv: (make_q "-1234567/7") |> print_endline;
  [%expect {|-176,366.0|}]

let%expect_test "qv_to_decimal_truncate" =
  let open Utils in
  let printing_conf = { separator = sep_dot_comma; plus_sign = true; num_of_digits = Uint8.of_int 4; rounding = Truncate } in
  q_to_decimal ~printing_conf: printing_conf ~qv: (make_q "-1234567/7") |> print_endline;
  [%expect {|-176,366.7142|}]

let%expect_test "decimal_to_qv_pos" =
  let open Utils in
  let sep = Separator.make_exn ('.', Some ',') in
  match unsafe_decimal_to_q ~decimal: "+5,050.50" ~sep: sep with
  | Ok v ->
    v |> print_endline;
    [%expect {| 10101/2 |}];
  | Error _ -> ()

let%expect_test "decimal_to_qv_neg" =
  let open Utils in
  let sep = Separator.make_exn ('.', Some '_') in
  match unsafe_decimal_to_q ~decimal: "-5_050.50" ~sep: sep with
  | Ok v ->
    v |> print_endline;
    [%expect {| -10101/2 |}];
  | Error _ -> ()

let%expect_test "decimal_to_qv_hundreds" =
  let open Utils in
  let sep = Separator.make_exn ('.', Some ',') in
  match unsafe_decimal_to_q ~decimal: "-50.50" ~sep: sep with
  | Ok v ->
    v |> print_endline;
    [%expect {| -101/2 |}];
  | Error _ -> ()

let%expect_test "decimal_to_qv_zero" =
  let open Utils in
  let sep = Separator.make_exn ('.', None) in
  match unsafe_decimal_to_q ~decimal: "-0.0" ~sep: sep with
  | Ok v ->
    v |> print_endline;
    [%expect {| 0 |}];
  | Error _ -> ()

let%expect_test "seal_quotient" =
  let open Utils in
  let open Quotient in
  let qv = make_qv ("USD", make_q "-1234567/7") in
  let printing_conf = { separator = sep_dot_comma; plus_sign = true; num_of_digits = Uint8.of_int 4; rounding = Truncate } in
  let r = seal_quotient ~printing_conf: printing_conf ~qv: qv in
  r |> print_endline;
  [%expect {|-176,366.7142|}]

let%expect_test "unsafe_float_to_discrete" =
  let open Utils in
  let open Discrete.Scale in
  let scale = make_scale "GBP" "Penny" (make_q "100/1") in
  let r = unsafe_float_to_discrete ~scale: scale ~integer: 123 in
  Discrete.to_showable_json r |> print_endline;
  [%expect {|{"discrete_scale":"{\"symbol\":\"GBP\",\"unit\":\"Penny\",\"value\":\"100/1\"}","discrete_value":"{\"value\":\"123\"}"}|}]
