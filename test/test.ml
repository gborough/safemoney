open Safemoney

let%expect_test "qv_ops" =
  let open Quotient in
  let qv1 = make_qv ("AUD", make_q "3/1") in
  let qv2 = make_qv ("AUD", make_q "2/1") in
  let r = abs (neg ((qv1 + qv2 - qv2) * make_q "3/1" / make_q "3/1")) in
  qv_to_str r.value_ |> print_endline ;
  [%expect {|3/1|}]

(* qv_ops_diff_currency *)
let () =
  let open Quotient in
  try
    let qv1 = make_qv ("AUD", make_q "3/1") in
    let qv2 = make_qv ("GBP", make_q "2/1") in
    let _r = abs (neg ((qv1 + qv2 - qv2) * make_q "3/1" / make_q "3/1")) in
    Printf.printf "%s" ""
  with
  | CurrencyTypeMismatch _ -> ()
  | _ -> exit 1

let%expect_test "dv_ops_with_scale" =
  let open Discrete in
  let scale =
    Scale.make_scale ~sym:"AUD" ~sub_unit:"cent" (make_q "100/1")
  in
  let dv1 = make_dv (scale, make_z "200") in
  let dv2 = make_dv (scale, make_z "100") in
  let r = (dv1 + dv2 - dv2) * make_z "10" in
  zv_to_str r.value_ |> print_endline ;
  [%expect {|2000|}]

(* dv_ops_with_diff_scale *)
let () =
  let open Discrete in
  try
    let scale1 =
      Scale.make_scale ~sym:"AUD" ~sub_unit:"cent" (make_q "100/1")
    in
    let scale2 =
      Scale.make_scale ~sym:"GBP" ~sub_unit:"penny" (make_q "100/1")
    in
    let dv1 = make_dv (scale1, make_z "200") in
    let dv2 = make_dv (scale2, make_z "100") in
    let _r = (dv1 + dv2 - dv2) * make_z "10" in
    Printf.printf "%s" ""
  with
  | ScaleTypeMismatch _ -> ()
  | _ -> exit 1

(* non_valid_scale *)
let () =
  let open Discrete in
  try
    let _scale =
      Scale.make_scale ~sym:"AUD" ~sub_unit:"cent" (make_q "-100/1")
    in
    Printf.printf "%s" ""
  with
  | Scale.ValidScaleError _ -> ()
  | _ -> exit 1

let%expect_test "xchg_ops" =
  let open Exchange in
  let gbp_to_aud =
    xchg_recip
      (xchg_recip (make_xchg ~src:"GBP" ~dst:"AUD" (make_q "8872/4503")))
  in
  let aud_to_nzd = make_xchg ~src:"AUD" ~dst:"NZD" (make_q "4908/4503") in
  let gbp_to_nzd = gbp_to_aud **> aud_to_nzd in
  gbp_to_nzd.src_ |> print_endline ;
  gbp_to_nzd.dst_ |> print_endline ;
  qv_to_str gbp_to_nzd.value_ |> print_endline ;
  [%expect {|
    GBP
    NZD
    14514592/6759003 |}]

(* diff_intermediary_symbol *)
let () =
  let open Exchange in
  try
    let gbp_to_aud =
      xchg_recip
        (xchg_recip (make_xchg ~src:"GBP" ~dst:"AUD" (make_q "8872/4503")))
    in
    let aud_to_nzd = make_xchg ~src:"USD" ~dst:"NZD" (make_q "4908/4503") in
    let _gbp_to_nzd = gbp_to_aud **> aud_to_nzd in
    Printf.printf "%s" ""
  with
  | IntermediaryMismatch _ -> ()
  | _ -> exit 1

let%expect_test "predefined" =
  let open Predefined in
  let open Quotient in
  let qv1 = ISO4217_AUD.make_qv (make_q "3/1") in
  let qv2 = ISO4217_AUD.make_qv (make_q "2/1") in
  let dv1 = Option.get (ISO4217_AUD.make_dv "cent" (make_z "200")) in
  let dv2 = Option.get (ISO4217_AUD.make_dv "cent" (make_z "100")) in
  let rv = abs (neg ((qv1 + qv2 - qv2) * make_q "3/1" / make_q "3/1")) in
  let open Discrete in
  let dv = (dv1 + dv2 - dv2) * make_z "10" in
  qv_to_str rv.value_ |> print_endline ;
  zv_to_str dv.value_ |> print_endline ;
  [%expect {|
    3/1
    2000|}]

let%expect_test "mark_thousands" =
  Ops.mark_thousands ~v:1234567 ~sep:"," |> print_endline ;
  [%expect {|1,234,567|}]

let%expect_test "qv_to_decimal_up" =
  let open Ops in
  let printing_conf =
    make_printing_conf ~sep:(sep_dot_comma ()) ~plus_sign:true
      ~num_of_digits:4 ~rounding:Up
  in
  q_to_decimal ~printing_conf ~q:(make_q "-1234567/7") |> print_endline ;
  [%expect {|-176,366.0|}]

let%expect_test "qv_to_decimal_truncate" =
  let open Ops in
  let printing_conf =
    make_printing_conf ~sep:(sep_dot_comma ()) ~plus_sign:true
      ~num_of_digits:4 ~rounding:Truncate
  in
  q_to_decimal ~printing_conf ~q:(make_q "-1234567/7") |> print_endline ;
  [%expect {|-176,366.7142|}]

let%expect_test "decimal_to_qv_pos" =
  let open Ops in
  let sep = Separator.make_exn ('.', Some ',') in
  match unsafe_decimal_to_q ~decimal:"+5,050.50" ~sep with
  | Ok v -> v |> print_endline ; [%expect {| 10101/2 |}]
  | Error _ -> ()

let%expect_test "decimal_to_qv_neg" =
  let open Ops in
  let sep = Separator.make_exn ('.', Some '_') in
  match unsafe_decimal_to_q ~decimal:"-5_050.50" ~sep with
  | Ok v -> v |> print_endline ; [%expect {| -10101/2 |}]
  | Error _ -> ()

let%expect_test "decimal_to_qv_hundreds" =
  let open Ops in
  let sep = Separator.make_exn ('.', Some ',') in
  match unsafe_decimal_to_q ~decimal:"-50.50" ~sep with
  | Ok v -> v |> print_endline ; [%expect {| -101/2 |}]
  | Error _ -> ()

let%expect_test "decimal_to_qv_zero" =
  let open Ops in
  let sep = Separator.make_exn ('.', None) in
  match unsafe_decimal_to_q ~decimal:"-0.0" ~sep with
  | Ok v -> v |> print_endline ; [%expect {| 0 |}]
  | Error _ -> ()

let%expect_test "seal_quotient" =
  let open Ops in
  let open Quotient in
  let qv = make_qv ("USD", make_q "-1234567/7") in
  let printing_conf =
    make_printing_conf ~sep:(sep_dot_comma ()) ~plus_sign:true
      ~num_of_digits:4 ~rounding:Truncate
  in
  let r = seal_quotient ~printing_conf ~qv in
  r |> print_endline ; [%expect {|-176,366.7142|}]

let%expect_test "unsafe_float_to_discrete" =
  let open Ops in
  let open Discrete.Scale in
  let scale = make_scale ~sym:"GBP" ~sub_unit:"Penny" (make_q "100/1") in
  let r = unsafe_float_to_discrete ~scale ~integer:123 in
  Discrete.to_json r |> print_endline ;
  [%expect
    {|{"kind":"discrete_value","symbol":"GBP","sub_unit":"Penny","scale_value":"100/1","discrete_value":"123"}|}]

let%expect_test "sexp_of_scale" =
  let open Discrete.Scale in
  let scale = make_scale ~sym:"GBP" ~sub_unit:"Penny" (make_q "100/1") in
  Base.Sexp.to_string @@ Discrete.Scale.to_sexp scale |> print_endline ;
  [%expect {|((kind scale_value)(symbol GBP)(sub_unit Penny)(value 100/1))|}]

let%expect_test "sexp_of_discrete" =
  let open Ops in
  let open Discrete.Scale in
  let scale = make_scale ~sym:"GBP" ~sub_unit:"Penny" (make_q "100/1") in
  let r = unsafe_float_to_discrete ~scale ~integer:123 in
  Base.Sexp.to_string @@ Discrete.to_sexp r |> print_endline ;
  [%expect
    {|((kind discrete_value)(symbol GBP)(sub_unit Penny)(s_value 100/1)(value 123))|}]

let%expect_test "sexp_of_exchange" =
  let open Exchange in
  let gbp_to_aud =
    xchg_recip
      (xchg_recip (make_xchg ~src:"GBP" ~dst:"AUD" (make_q "8872/4503")))
  in
  let aud_to_nzd = make_xchg ~src:"AUD" ~dst:"NZD" (make_q "4908/4503") in
  let gbp_to_nzd = gbp_to_aud **> aud_to_nzd in
  Base.Sexp.to_string @@ Exchange.to_sexp gbp_to_nzd |> print_endline ;
  [%expect
    {|((kind exchange_rate)(src GBP)(dst NZD)(value 14514592/6759003))|}]

let%expect_test "sexp_of_quotient" =
  let open Quotient in
  let qv1 = make_qv ("AUD", make_q "3/1") in
  let qv2 = make_qv ("AUD", make_q "2/1") in
  let r = abs (neg ((qv1 + qv2 - qv2) * make_q "3/1" / make_q "3/1")) in
  Base.Sexp.to_string @@ Quotient.to_sexp r |> print_endline ;
  [%expect {|((kind quotient_value)(symbol AUD)(value 3/1))|}]
