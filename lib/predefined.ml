open Base
open Types

(** Predefined module for Afghani *)
module ISO4217_AFN : Custom = struct
  let symbol = "AFN"

  let description = "Afghani"

  let units =
    let table = Hashtbl.create (module String) in
    let afghani =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"afghani"
        (make_q "1/1")
    in
    let pul =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pul" (make_q "100/1")
    in
    Hashtbl.set table ~key:"afghani" ~data:afghani ;
    Hashtbl.set table ~key:"pul" ~data:pul ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Albanian Lek *)
module ISO4217_ALL : Custom = struct
  let symbol = "ALL"

  let description = "Albanian Lek"

  let units =
    let table = Hashtbl.create (module String) in
    let lek =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"lek" (make_q "1/1")
    in
    let qindarke =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"qindarke"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"lek" ~data:lek ;
    Hashtbl.set table ~key:"qindarke" ~data:qindarke ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Algerian Dinar *)
module ISO4217_DZD : Custom = struct
  let symbol = "DZD"

  let description = "Algerian Dinar"

  let units =
    let table = Hashtbl.create (module String) in
    let dinar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dinar" (make_q "1/1")
    in
    let santeem =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"santeem"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"dinar" ~data:dinar ;
    Hashtbl.set table ~key:"santeem" ~data:santeem ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Angolan Kwanza *)
module ISO4217_AOA : Custom = struct
  let symbol = "AOA"

  let description = "Angolan Kwanza"

  let units =
    let table = Hashtbl.create (module String) in
    let kwanza =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kwanza" (make_q "1/1")
    in
    let centimo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centimo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"kwanza" ~data:kwanza ;
    Hashtbl.set table ~key:"centimo" ~data:centimo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for East Caribbean Dollar *)
module ISO4217_XCD : Custom = struct
  let symbol = "XCD"

  let description = "East Caribbean Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Argentine Peso *)
module ISO4217_ARS : Custom = struct
  let symbol = "ARS"

  let description = "Argentine Peso"

  let units =
    let table = Hashtbl.create (module String) in
    let peso =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"peso" (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"peso" ~data:peso ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Armenian Dram *)
module ISO4217_AMD : Custom = struct
  let symbol = "AMD"

  let description = "Armenian Dram"

  let units =
    let table = Hashtbl.create (module String) in
    let dram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dram" (make_q "1/1")
    in
    let luma =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"luma" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dram" ~data:dram ;
    Hashtbl.set table ~key:"luma" ~data:luma ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Aruban Florin *)
module ISO4217_AWG : Custom = struct
  let symbol = "AWG"

  let description = "Aruban Florin"

  let units =
    let table = Hashtbl.create (module String) in
    let florin =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"florin" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"florin" ~data:florin ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Australian Dollar *)
module ISO4217_AUD : Custom = struct
  let symbol = "AUD"

  let description = "Australian Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Azerbaijan Manat *)
module ISO4217_AZN : Custom = struct
  let symbol = "AZN"

  let description = "Azerbaijan Manat"

  let units =
    let table = Hashtbl.create (module String) in
    let manat =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"qapik" (make_q "1/1")
    in
    let qapik =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"qapik"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"manat" ~data:manat ;
    Hashtbl.set table ~key:"qapik" ~data:qapik ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bahamian Dollar *)
module ISO4217_BSD : Custom = struct
  let symbol = "BSD"

  let description = "Bahamian Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bahraini Dinar *)
module ISO4217_BHD : Custom = struct
  let symbol = "BHD"

  let description = "Bahraini Dinar"

  let units =
    let table = Hashtbl.create (module String) in
    let dinar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dinar" (make_q "1/1")
    in
    let fils =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"fils"
        (make_q "1000/1")
    in
    Hashtbl.set table ~key:"dinar" ~data:dinar ;
    Hashtbl.set table ~key:"fils" ~data:fils ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bangladeshi Taka *)
module ISO4217_BDT : Custom = struct
  let symbol = "BDT"

  let description = "Bangladeshi Taka"

  let units =
    let table = Hashtbl.create (module String) in
    let taka =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"taka" (make_q "1/1")
    in
    let paisa =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"paisa"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"taka" ~data:taka ;
    Hashtbl.set table ~key:"paisa" ~data:paisa ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Barbados Dollar *)
module ISO4217_BBD : Custom = struct
  let symbol = "BBD"

  let description = "Barbados Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Belarusian Ruble *)
module ISO4217_BYN : Custom = struct
  let symbol = "BYN"

  let description = "Belarusian Ruble"

  let units =
    let table = Hashtbl.create (module String) in
    let ruble =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kapiejka"
        (make_q "1/1")
    in
    let kapiejka =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kapiejka"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"ruble" ~data:ruble ;
    Hashtbl.set table ~key:"kapiejka" ~data:kapiejka ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Belize Dollar *)
module ISO4217_BZD : Custom = struct
  let symbol = "BZD"

  let description = "Belize Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for CFA Franc BCEAO *)
module ISO4217_XOF : Custom = struct
  let symbol = "XOF"

  let description = "CFA Franc BCEAO"

  let units =
    let table = Hashtbl.create (module String) in
    let franc =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"franc" (make_q "1/1")
    in
    let centime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"franc" ~data:franc ;
    Hashtbl.set table ~key:"centime" ~data:centime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bermudian Dollar *)
module ISO4217_BMD : Custom = struct
  let symbol = "BMD"

  let description = "Bermudian Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bhutanese Ngultrum *)
module ISO4217_BTN : Custom = struct
  let symbol = "BTN"

  let description = "Bhutanese Ngultrum"

  let units =
    let table = Hashtbl.create (module String) in
    let ngultrum =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ngultrum"
        (make_q "100/1")
    in
    let chetrum =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"chetrum"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"ngultrum" ~data:ngultrum ;
    Hashtbl.set table ~key:"chetrum" ~data:chetrum ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bolivian Boliviano *)
module ISO4217_BOB : Custom = struct
  let symbol = "BOB"

  let description = "Bolivian Boliviano"

  let units =
    let table = Hashtbl.create (module String) in
    let boliviano =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"boliviano"
        (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"boliviano" ~data:boliviano ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bolivian Mvdol *)
module ISO4217_BOV : Custom = struct
  let symbol = "BOV"

  let description = "Bolivian Mvdol"

  let units =
    let table = Hashtbl.create (module String) in
    let bov =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"BOV" (make_q "100/1")
    in
    Hashtbl.set table ~key:"BOV" ~data:bov ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bosnia-Herzegovina Convertible Marka *)
module ISO4217_BAM : Custom = struct
  let symbol = "BAM"

  let description = "Bosnia-Herzegovina Convertible Marka"

  let units =
    let table = Hashtbl.create (module String) in
    let mark =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"mark" (make_q "1/1")
    in
    let fening =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"fening"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"mark" ~data:mark ;
    Hashtbl.set table ~key:"fening" ~data:fening ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Botswanan Pula *)
module ISO4217_BWP : Custom = struct
  let symbol = "BWP"

  let description = "Botswanan Pula"

  let units =
    let table = Hashtbl.create (module String) in
    let pula =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pula" (make_q "1/1")
    in
    let thebe =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"thebe"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"pula" ~data:pula ;
    Hashtbl.set table ~key:"thebe" ~data:thebe ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Norwegian Krone *)
module ISO4217_NOK : Custom = struct
  let symbol = "NOK"

  let description = "Norwegian Krone"

  let units =
    let table = Hashtbl.create (module String) in
    let krone =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"krone" (make_q "1/1")
    in
    let ore =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ore" (make_q "100/1")
    in
    Hashtbl.set table ~key:"krone" ~data:krone ;
    Hashtbl.set table ~key:"ore" ~data:ore ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Brazilian Real *)
module ISO4217_BRL : Custom = struct
  let symbol = "BRL"

  let description = "Brazilian Real"

  let units =
    let table = Hashtbl.create (module String) in
    let real =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"real" (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"real" ~data:real ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Brunei Dollar *)
module ISO4217_BND : Custom = struct
  let symbol = "BND"

  let description = "Brunei Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let sen =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"sen" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"sen" ~data:sen ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bulgarian Lev *)
module ISO4217_BGN : Custom = struct
  let symbol = "BGN"

  let description = "Bulgarian Lev"

  let units =
    let table = Hashtbl.create (module String) in
    let lev =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"lev" (make_q "1/1")
    in
    let stotinka =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"stotinka"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"lev" ~data:lev ;
    Hashtbl.set table ~key:"stotinka" ~data:stotinka ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Burundi Franc *)
module ISO4217_BIF : Custom = struct
  let symbol = "BIF"

  let description = "Burundi Franc"

  let units =
    let table = Hashtbl.create (module String) in
    let franc =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"franc" (make_q "1/1")
    in
    let centime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"franc" ~data:franc ;
    Hashtbl.set table ~key:"centime" ~data:centime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Cabo Verde Escudo *)
module ISO4217_CVE : Custom = struct
  let symbol = "CVE"

  let description = "Cabo Verde Escudo"

  let units =
    let table = Hashtbl.create (module String) in
    let escudo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"escudo" (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"escudo" ~data:escudo ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Cambodian Riel *)
module ISO4217_KHR : Custom = struct
  let symbol = "KHR"

  let description = "Cambodian Riel"

  let units =
    let table = Hashtbl.create (module String) in
    let riel =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"r" (make_q "1/1")
    in
    let sen =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"sen" (make_q "100/1")
    in
    Hashtbl.set table ~key:"riel" ~data:riel ;
    Hashtbl.set table ~key:"sen" ~data:sen ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for CFA Franc BEAC *)
module ISO4217_XAF : Custom = struct
  let symbol = "XAF"

  let description = "CFA Franc BEAC"

  let units =
    let table = Hashtbl.create (module String) in
    let franc =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"franc" (make_q "1/1")
    in
    let centime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"franc" ~data:franc ;
    Hashtbl.set table ~key:"centime" ~data:centime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Canadian Dollar *)
module ISO4217_CAD : Custom = struct
  let symbol = "CAD"

  let description = "Canadian Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Cayman Islands Dollar *)
module ISO4217_KYD : Custom = struct
  let symbol = "KYD"

  let description = "Cayman Islands Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Chilean Peso *)
module ISO4217_CLP : Custom = struct
  let symbol = "CLP"

  let description = "Chilean Peso"

  let units =
    let table = Hashtbl.create (module String) in
    let peso =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"peso" (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"peso" ~data:peso ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Chilean Unidad de Fomento *)
module ISO4217_CLF : Custom = struct
  let symbol = "CLF"

  let description = "Chilean Unidad de Fomento"

  let units =
    let table = Hashtbl.create (module String) in
    let clf =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"CLF"
        (make_q "10000/1")
    in
    Hashtbl.set table ~key:"CLF" ~data:clf ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Chinese Yuan Renminbi *)
module ISO4217_CNY : Custom = struct
  let symbol = "CNY"

  let description = "Chinese Yuan Renminbi"

  let units =
    let table = Hashtbl.create (module String) in
    let yuan =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"yuan" (make_q "1/1")
    in
    let fen =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"fen" (make_q "100/1")
    in
    Hashtbl.set table ~key:"yuan" ~data:yuan ;
    Hashtbl.set table ~key:"fen" ~data:fen ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Colombian Peso *)
module ISO4217_COP : Custom = struct
  let symbol = "COP"

  let description = "Colombian Peso"

  let units =
    let table = Hashtbl.create (module String) in
    let peso =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"peso" (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"peso" ~data:peso ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Colombian Unidad de Valor Real *)
module ISO4217_COU : Custom = struct
  let symbol = "COU"

  let description = "Colombian Unidad de Valor Real"

  let units =
    let table = Hashtbl.create (module String) in
    let cou =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"COU" (make_q "100/1")
    in
    Hashtbl.set table ~key:"COU" ~data:cou ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Comorian Franc *)
module ISO4217_KMF : Custom = struct
  let symbol = "KMF"

  let description = "Comorian Franc"

  let units =
    let table = Hashtbl.create (module String) in
    let franc =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"franc" (make_q "1/1")
    in
    let centime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"franc" ~data:franc ;
    Hashtbl.set table ~key:"centime" ~data:centime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Congolese Franc *)
module ISO4217_CDF : Custom = struct
  let symbol = "CDF"

  let description = "Congolese Franc"

  let units =
    let table = Hashtbl.create (module String) in
    let franc =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"franc" (make_q "1/1")
    in
    let centime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"franc" ~data:franc ;
    Hashtbl.set table ~key:"centime" ~data:centime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Costa Rican Colon *)
module ISO4217_CRC : Custom = struct
  let symbol = "CRC"

  let description = "Costa Rican Colon"

  let units =
    let table = Hashtbl.create (module String) in
    let colon =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"colon" (make_q "1/1")
    in
    let centimo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centimo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"colon" ~data:colon ;
    Hashtbl.set table ~key:"centimo" ~data:centimo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Cuban Peso *)
module ISO4217_CUP : Custom = struct
  let symbol = "CUP"

  let description = "Cuban Peso"

  let units =
    let table = Hashtbl.create (module String) in
    let peso =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"peso" (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"peso" ~data:peso ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Cuban Peso Convertible *)
module ISO4217_CUC : Custom = struct
  let symbol = "CUC"

  let description = "Cuban Peso Convertible"

  let units =
    let table = Hashtbl.create (module String) in
    let peso =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"peso" (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"peso" ~data:peso ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Netherlands Antillean Guilder *)
module ISO4217_ANG : Custom = struct
  let symbol = "ANG"

  let description = "Netherlands Antillean Guilder"

  let units =
    let table = Hashtbl.create (module String) in
    let guilder =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"guilder"
        (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"guilder" ~data:guilder ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Czech Koruna *)
module ISO4217_CZK : Custom = struct
  let symbol = "CZK"

  let description = "Czech Koruna"

  let units =
    let table = Hashtbl.create (module String) in
    let koruna =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"koruna" (make_q "1/1")
    in
    let haler =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"haler"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"koruna" ~data:koruna ;
    Hashtbl.set table ~key:"haler" ~data:haler ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Danish Krone *)
module ISO4217_DKK : Custom = struct
  let symbol = "DKK"

  let description = "Danish Krone"

  let units =
    let table = Hashtbl.create (module String) in
    let krone =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"krone" (make_q "1/1")
    in
    let ore =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ore" (make_q "100/1")
    in
    Hashtbl.set table ~key:"krone" ~data:krone ;
    Hashtbl.set table ~key:"ore" ~data:ore ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Djibouti Franc *)
module ISO4217_DJF : Custom = struct
  let symbol = "DJF"

  let description = "Djibouti Franc"

  let units =
    let table = Hashtbl.create (module String) in
    let franc =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"franc" (make_q "1/1")
    in
    let centime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"franc" ~data:franc ;
    Hashtbl.set table ~key:"centime" ~data:centime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Dominican Peso *)
module ISO4217_DOP : Custom = struct
  let symbol = "DOP"

  let description = "Dominican Peso"

  let units =
    let table = Hashtbl.create (module String) in
    let peso =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"peso" (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"peso" ~data:peso ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Egyptian Pound *)
module ISO4217_EGP : Custom = struct
  let symbol = "EGP"

  let description = "Egyptian Pound"

  let units =
    let table = Hashtbl.create (module String) in
    let pound =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pound" (make_q "1/1")
    in
    let piastre =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"piastre"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"pound" ~data:pound ;
    Hashtbl.set table ~key:"piastre" ~data:piastre ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for El Salvador Colon *)
module ISO4217_SVC : Custom = struct
  let symbol = "SVC"

  let description = "El Salvador Colon"

  let units =
    let table = Hashtbl.create (module String) in
    let colon =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"colon" (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"colon" ~data:colon ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Eritrean Nakfa *)
module ISO4217_ERN : Custom = struct
  let symbol = "ERN"

  let description = "Eritrean Nakfa"

  let units =
    let table = Hashtbl.create (module String) in
    let nafka =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"nafka" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"nafka" ~data:nafka ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Swazi Lilangeni *)
module ISO4217_SZL : Custom = struct
  let symbol = "SZL"

  let description = "Swazi Lilangeni"

  let units =
    let table = Hashtbl.create (module String) in
    let lilangeni =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"lilangeni"
        (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"lilangeni" ~data:lilangeni ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Ethiopian Birr *)
module ISO4217_ETB : Custom = struct
  let symbol = "ETB"

  let description = "Ethiopian Birr"

  let units =
    let table = Hashtbl.create (module String) in
    let birr =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"birr" (make_q "1/1")
    in
    let santim =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"santim"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"birr" ~data:birr ;
    Hashtbl.set table ~key:"santim" ~data:santim ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Euro *)
module ISO4217_EUR : Custom = struct
  let symbol = "EUR"

  let description = "Euro"

  let units =
    let table = Hashtbl.create (module String) in
    let euro =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"euro" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"euro" ~data:euro ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Falkland Islands Pound *)
module ISO4217_FKP : Custom = struct
  let symbol = "FKP"

  let description = "Falkland Islands Pound"

  let units =
    let table = Hashtbl.create (module String) in
    let pound =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pound" (make_q "1/1")
    in
    let penny =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"pound" ~data:pound ;
    Hashtbl.set table ~key:"penny" ~data:penny ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Fiji Dollar *)
module ISO4217_FJD : Custom = struct
  let symbol = "FJD"

  let description = "Fiji Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for CFP Franc *)
module ISO4217_XPF : Custom = struct
  let symbol = "XPF"

  let description = "CFP Franc"

  let units =
    let table = Hashtbl.create (module String) in
    let franc =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"franc" (make_q "1/1")
    in
    let centime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"franc" ~data:franc ;
    Hashtbl.set table ~key:"centime" ~data:centime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Pound Sterling *)
module ISO4217_GBP : Custom = struct
  let symbol = "GBP"

  let description = "Pound Sterling"

  let units =
    let table = Hashtbl.create (module String) in
    let pound =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pound" (make_q "1/1")
    in
    let penny =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"penny"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"pound" ~data:pound ;
    Hashtbl.set table ~key:"penny" ~data:penny ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Gambian Dalasi *)
module ISO4217_GMD : Custom = struct
  let symbol = "GMD"

  let description = "Gambian Dalasi"

  let units =
    let table = Hashtbl.create (module String) in
    let dalasi =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dalasi" (make_q "1/1")
    in
    let butut =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"butut"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"dalasi" ~data:dalasi ;
    Hashtbl.set table ~key:"butut" ~data:butut ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Georgian Lari *)
module ISO4217_GEL : Custom = struct
  let symbol = "GEL"

  let description = "Georgian Lari"

  let units =
    let table = Hashtbl.create (module String) in
    let lari =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"lari" (make_q "1/1")
    in
    let tetri =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"tetri"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"lari" ~data:lari ;
    Hashtbl.set table ~key:"tetri" ~data:tetri ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Ghana Cedi *)
module ISO4217_GHS : Custom = struct
  let symbol = "GHS"

  let description = "Ghana Cedi"

  let units =
    let table = Hashtbl.create (module String) in
    let cedi =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cedi" (make_q "1/1")
    in
    let pesewa =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pesewa"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"cedi" ~data:cedi ;
    Hashtbl.set table ~key:"pesewa" ~data:pesewa ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Gibraltar Pound *)
module ISO4217_GIP : Custom = struct
  let symbol = "GIP"

  let description = "Gibraltar Pound"

  let units =
    let table = Hashtbl.create (module String) in
    let pound =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pound" (make_q "1/1")
    in
    let penny =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"penny"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"pound" ~data:pound ;
    Hashtbl.set table ~key:"penny" ~data:penny ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Guatemalan Quetzal *)
module ISO4217_GTQ : Custom = struct
  let symbol = "GTQ"

  let description = "Guatemalan Quetzal"

  let units =
    let table = Hashtbl.create (module String) in
    let quetzal =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"quetzal"
        (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"quetzal" ~data:quetzal ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Guinean Franc *)
module ISO4217_GNF : Custom = struct
  let symbol = "GNF"

  let description = "Guinean Franc"

  let units =
    let table = Hashtbl.create (module String) in
    let franc =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"franc" (make_q "1/1")
    in
    let centime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"franc" ~data:franc ;
    Hashtbl.set table ~key:"centime" ~data:centime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Guyana Dollar *)
module ISO4217_GYD : Custom = struct
  let symbol = "GYD"

  let description = "Guyana Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Haitian Gourde *)
module ISO4217_HTG : Custom = struct
  let symbol = "HTG"

  let description = "Haitian Gourde"

  let units =
    let table = Hashtbl.create (module String) in
    let gourde =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"gourde" (make_q "1/1")
    in
    let centime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"gourde" ~data:gourde ;
    Hashtbl.set table ~key:"centime" ~data:centime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Honduran Lempira *)
module ISO4217_HNL : Custom = struct
  let symbol = "HNL"

  let description = "Honduran Lempira"

  let units =
    let table = Hashtbl.create (module String) in
    let lempira =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"lempira"
        (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"lempira" ~data:lempira ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Hong Kong Dollar *)
module ISO4217_HKD : Custom = struct
  let symbol = "HKD"

  let description = "Hong Kong Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Hungarian Forint *)
module ISO4217_HUF : Custom = struct
  let symbol = "HUF"

  let description = "Hungarian Forint"

  let units =
    let table = Hashtbl.create (module String) in
    let forint =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"forint" (make_q "1/1")
    in
    let filler =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"filler"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"forint" ~data:forint ;
    Hashtbl.set table ~key:"filler" ~data:filler ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Iceland Krona *)
module ISO4217_ISK : Custom = struct
  let symbol = "ISK"

  let description = "Iceland Krona"

  let units =
    let table = Hashtbl.create (module String) in
    let krona =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"krona" (make_q "1/1")
    in
    let eyrir =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"eyrir"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"krona" ~data:krona ;
    Hashtbl.set table ~key:"eyrir" ~data:eyrir ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Indian Rupee *)
module ISO4217_INR : Custom = struct
  let symbol = "INR"

  let description = "Indian Rupee"

  let units =
    let table = Hashtbl.create (module String) in
    let rupee =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rupee" (make_q "1/1")
    in
    let paisa =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"paisa"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"rupee" ~data:rupee ;
    Hashtbl.set table ~key:"paisa" ~data:paisa ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Indonesian Rupiah *)
module ISO4217_IDR : Custom = struct
  let symbol = "IDR"

  let description = "Indonesian Rupiah"

  let units =
    let table = Hashtbl.create (module String) in
    let rupiah =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rupiah" (make_q "1/1")
    in
    let sen =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"sen" (make_q "100/1")
    in
    Hashtbl.set table ~key:"rupiah" ~data:rupiah ;
    Hashtbl.set table ~key:"sen" ~data:sen ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Special Drawing Right *)
module ISO4217_XDR : Custom = struct
  let symbol = "XDR"

  let description = "Special Drawing Right"

  let units =
    let table = Hashtbl.create (module String) in
    let xdr =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"XDR" (make_q "1/1")
    in
    Hashtbl.set table ~key:"XDR" ~data:xdr ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Iranian Rial *)
module ISO4217_IRR : Custom = struct
  let symbol = "IRR"

  let description = "Iranian Rial"

  let units =
    let table = Hashtbl.create (module String) in
    let rial =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rial" (make_q "1/1")
    in
    let dinar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dinar"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"rial" ~data:rial ;
    Hashtbl.set table ~key:"dinar" ~data:dinar ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Iraqi Dinar *)
module ISO4217_IQD : Custom = struct
  let symbol = "IQD"

  let description = "Iraqi Dinar"

  let units =
    let table = Hashtbl.create (module String) in
    let dinar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dinar" (make_q "1/1")
    in
    let fils =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"fils" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dinar" ~data:dinar ;
    Hashtbl.set table ~key:"fils" ~data:fils ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for New Israeli Sheqel *)
module ISO4217_ILS : Custom = struct
  let symbol = "ILS"

  let description = "New Israeli Sheqel"

  let units =
    let table = Hashtbl.create (module String) in
    let shekel =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"shekel" (make_q "1/1")
    in
    let agora =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"agora"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"shekel" ~data:shekel ;
    Hashtbl.set table ~key:"agora" ~data:agora ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Jamaican Dollar *)
module ISO4217_JMD : Custom = struct
  let symbol = "JMD"

  let description = "Jamaican Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Japenese Yen *)
module ISO4217_JPY : Custom = struct
  let symbol = "JPY"

  let description = "Japenese Yen"

  let units =
    let table = Hashtbl.create (module String) in
    let yen =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"yen" (make_q "1/1")
    in
    let sen =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"sen" (make_q "100/1")
    in
    Hashtbl.set table ~key:"yen" ~data:yen ;
    Hashtbl.set table ~key:"sen" ~data:sen ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Jordanian Dinar *)
module ISO4217_JOD : Custom = struct
  let symbol = "JOD"

  let description = "Jordanian Dinar"

  let units =
    let table = Hashtbl.create (module String) in
    let dinar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dinar" (make_q "1/1")
    in
    let piastre =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"piastre"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"dinar" ~data:dinar ;
    Hashtbl.set table ~key:"piastre" ~data:piastre ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Kazakhstani Tenge *)
module ISO4217_KZT : Custom = struct
  let symbol = "KZT"

  let description = "Kazakhstani Tenge"

  let units =
    let table = Hashtbl.create (module String) in
    let tenge =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"tenge" (make_q "1/1")
    in
    let tiyin =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"tiyin"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"tenge" ~data:tenge ;
    Hashtbl.set table ~key:"tiyin" ~data:tiyin ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Kenyan Shilling *)
module ISO4217_KES : Custom = struct
  let symbol = "KES"

  let description = "Kenyan Shilling"

  let units =
    let table = Hashtbl.create (module String) in
    let shilling =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"shilling"
        (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"shilling" ~data:shilling ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for North Korean Won *)
module ISO4217_KPW : Custom = struct
  let symbol = "KPW"

  let description = "North Korean Won"

  let units =
    let table = Hashtbl.create (module String) in
    let won =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"won" (make_q "1/1")
    in
    let chon =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"chon" (make_q "100/1")
    in
    Hashtbl.set table ~key:"won" ~data:won ;
    Hashtbl.set table ~key:"chon" ~data:chon ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for South Korean Won *)
module ISO4217_KRW : Custom = struct
  let symbol = "KRW"

  let description = "South Korean Won"

  let units =
    let table = Hashtbl.create (module String) in
    let won =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"won" (make_q "1/1")
    in
    let jeon =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"jeon" (make_q "100/1")
    in
    Hashtbl.set table ~key:"won" ~data:won ;
    Hashtbl.set table ~key:"jeon" ~data:jeon ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Kuwaiti Dinar *)
module ISO4217_KWD : Custom = struct
  let symbol = "KWD"

  let description = "Kuwaiti Dinar"

  let units =
    let table = Hashtbl.create (module String) in
    let dinar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dinar" (make_q "1/1")
    in
    let fils =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"fils" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dinar" ~data:dinar ;
    Hashtbl.set table ~key:"fils" ~data:fils ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Kyrgystani Som *)
module ISO4217_KGS : Custom = struct
  let symbol = "KGS"

  let description = "Kyrgystani Som"

  let units =
    let table = Hashtbl.create (module String) in
    let som =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"som" (make_q "1/1")
    in
    let tyiyn =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"tyiyn"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"som" ~data:som ;
    Hashtbl.set table ~key:"tyiyn" ~data:tyiyn ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Lao Kip *)
module ISO4217_LAK : Custom = struct
  let symbol = "LAK"

  let description = "Lao Kip"

  let units =
    let table = Hashtbl.create (module String) in
    let kip =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kip" (make_q "1/1")
    in
    let att =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"att" (make_q "100/1")
    in
    Hashtbl.set table ~key:"kip" ~data:kip ;
    Hashtbl.set table ~key:"att" ~data:att ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Lebanese Pound *)
module ISO4217_LBP : Custom = struct
  let symbol = "LBP"

  let description = "Lebanese Pound"

  let units =
    let table = Hashtbl.create (module String) in
    let pound =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pound" (make_q "1/1")
    in
    let piastre =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"piastre"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"pound" ~data:pound ;
    Hashtbl.set table ~key:"piastre" ~data:piastre ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Lesotho Loti *)
module ISO4217_LSL : Custom = struct
  let symbol = "LSL"

  let description = "Lesotho Loti"

  let units =
    let table = Hashtbl.create (module String) in
    let loti =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"loti" (make_q "1/1")
    in
    let sente =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"sente"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"loti" ~data:loti ;
    Hashtbl.set table ~key:"sente" ~data:sente ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Liberian Dollar *)
module ISO4217_LRD : Custom = struct
  let symbol = "LRD"

  let description = "Liberian Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Libyan Dinar *)
module ISO4217_LYD : Custom = struct
  let symbol = "LYD"

  let description = "Libyan Dinar"

  let units =
    let table = Hashtbl.create (module String) in
    let dinar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dinar" (make_q "1/1")
    in
    let dirham =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dirham"
        (make_q "1000/1")
    in
    Hashtbl.set table ~key:"dinar" ~data:dinar ;
    Hashtbl.set table ~key:"dirham" ~data:dirham ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Swiss Franc *)
module ISO4217_CHF : Custom = struct
  let symbol = "CHF"

  let description = "Swiss Franc"

  let units =
    let table = Hashtbl.create (module String) in
    let franc =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"franc" (make_q "1/1")
    in
    let rappen =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rappen"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"franc" ~data:franc ;
    Hashtbl.set table ~key:"rappen" ~data:rappen ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Macanese Pataca *)
module ISO4217_MOP : Custom = struct
  let symbol = "MOP"

  let description = "Macanese Pataca"

  let units =
    let table = Hashtbl.create (module String) in
    let pataca =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pataca" (make_q "1/1")
    in
    let avo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"avo" (make_q "100/1")
    in
    Hashtbl.set table ~key:"pataca" ~data:pataca ;
    Hashtbl.set table ~key:"avo" ~data:avo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Macedonian Denar *)
module ISO4217_MKD : Custom = struct
  let symbol = "MKD"

  let description = "Macedonian Denar"

  let units =
    let table = Hashtbl.create (module String) in
    let denar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"denar" (make_q "1/1")
    in
    let deni =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"deni" (make_q "100/1")
    in
    Hashtbl.set table ~key:"denar" ~data:denar ;
    Hashtbl.set table ~key:"deni" ~data:deni ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Malagasy Ariary *)
module ISO4217_MGA : Custom = struct
  let symbol = "MGA"

  let description = "Malagasy Ariary"

  let units =
    let table = Hashtbl.create (module String) in
    let ariary =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ariary" (make_q "1/1")
    in
    let iraimbilanja =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"iraimbilanja"
        (make_q "5/1")
    in
    Hashtbl.set table ~key:"ariary" ~data:ariary ;
    Hashtbl.set table ~key:"iraimbilanja" ~data:iraimbilanja ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Malawi Kwacha *)
module ISO4217_MWK : Custom = struct
  let symbol = "MWK"

  let description = "Malawi Kwacha"

  let units =
    let table = Hashtbl.create (module String) in
    let kwacha =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kwacha" (make_q "1/1")
    in
    let tambala =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"tambala"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"kwacha" ~data:kwacha ;
    Hashtbl.set table ~key:"tambala" ~data:tambala ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Malaysian Ringgit *)
module ISO4217_MYR : Custom = struct
  let symbol = "MYR"

  let description = "Malaysian Ringgit"

  let units =
    let table = Hashtbl.create (module String) in
    let ringgit =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ringgit"
        (make_q "1/1")
    in
    let sen =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"sen" (make_q "100/1")
    in
    Hashtbl.set table ~key:"ringgit" ~data:ringgit ;
    Hashtbl.set table ~key:"sen" ~data:sen ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Maldivian Rufiyaa *)
module ISO4217_MVR : Custom = struct
  let symbol = "MVR"

  let description = "Maldivian Rufiyaa"

  let units =
    let table = Hashtbl.create (module String) in
    let rufiyaa =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rufiyaa"
        (make_q "1/1")
    in
    let laari =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"laari"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"rufiyaa" ~data:rufiyaa ;
    Hashtbl.set table ~key:"laari" ~data:laari ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Mauritius Rupee *)
module ISO4217_MUR : Custom = struct
  let symbol = "MUR"

  let description = "Mauritius Rupee"

  let units =
    let table = Hashtbl.create (module String) in
    let rupee =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rupee" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"rupee" ~data:rupee ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for ADB Unit of Account *)
module ISO4217_XUA : Custom = struct
  let symbol = "XUA"

  let description = "ADB Unit of Account"

  let units =
    let table = Hashtbl.create (module String) in
    let xua =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"XUA" (make_q "1/1")
    in
    Hashtbl.set table ~key:"xua" ~data:xua ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Mexican Peso *)
module ISO4217_MXN : Custom = struct
  let symbol = "MXN"

  let description = "Mexican Peso"

  let units =
    let table = Hashtbl.create (module String) in
    let peso =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"peso" (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"peso" ~data:peso ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Mexican Unidad de Inversion *)
module ISO4217_MXV : Custom = struct
  let symbol = "MXV"

  let description = "Mexican Unidad de Inversion"

  let units =
    let table = Hashtbl.create (module String) in
    let mxv =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"MXV" (make_q "100/1")
    in
    Hashtbl.set table ~key:"mxv" ~data:mxv ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Moldovan Leu *)
module ISO4217_MDL : Custom = struct
  let symbol = "MDL"

  let description = "Moldovan Leu"

  let units =
    let table = Hashtbl.create (module String) in
    let leu =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"leu" (make_q "1/1")
    in
    let ban =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ban" (make_q "100/1")
    in
    Hashtbl.set table ~key:"leu" ~data:leu ;
    Hashtbl.set table ~key:"ban" ~data:ban ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Mongolian Tugrik *)
module ISO4217_MNT : Custom = struct
  let symbol = "MNT"

  let description = "Mongolian Tugrik"

  let units =
    let table = Hashtbl.create (module String) in
    let tugrik =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"tugrik" (make_q "1/1")
    in
    let mongo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"mongo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"tugrik" ~data:tugrik ;
    Hashtbl.set table ~key:"mongo" ~data:mongo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Moroccan Dirham *)
module ISO4217_MAD : Custom = struct
  let symbol = "MAD"

  let description = "Moroccan Dirham"

  let units =
    let table = Hashtbl.create (module String) in
    let dirham =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dirham" (make_q "1/1")
    in
    let centime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"dirham" ~data:dirham ;
    Hashtbl.set table ~key:"centime" ~data:centime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Myanmar Kyat *)
module ISO4217_MMK : Custom = struct
  let symbol = "MMK"

  let description = "Myanmar Kyat"

  let units =
    let table = Hashtbl.create (module String) in
    let kyat =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kyat" (make_q "1/1")
    in
    let pya =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pya" (make_q "100/1")
    in
    Hashtbl.set table ~key:"kyat" ~data:kyat ;
    Hashtbl.set table ~key:"pya" ~data:pya ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Namibia Dollar *)
module ISO4217_NAD : Custom = struct
  let symbol = "NAD"

  let description = "Namibia Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Nepalese Rupee *)
module ISO4217_NPR : Custom = struct
  let symbol = "NPR"

  let description = "Nepalese Rupee"

  let units =
    let table = Hashtbl.create (module String) in
    let rupee =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rupee" (make_q "1/1")
    in
    let paisa =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"paisa"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"rupee" ~data:rupee ;
    Hashtbl.set table ~key:"paisa" ~data:paisa ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for New Zealand Dollar *)
module ISO4217_NZD : Custom = struct
  let symbol = "NZD"

  let description = "New Zealand Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Cordoba Oro *)
module ISO4217_NIO : Custom = struct
  let symbol = "NIO"

  let description = "Cordoba Oro"

  let units =
    let table = Hashtbl.create (module String) in
    let cordoba =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cordoba"
        (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"cordoba" ~data:cordoba ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Nigerian Naira *)
module ISO4217_NGN : Custom = struct
  let symbol = "NGN"

  let description = "Nigerian Naira"

  let units =
    let table = Hashtbl.create (module String) in
    let naira =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"naira" (make_q "1/1")
    in
    let kobo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kobo" (make_q "100/1")
    in
    Hashtbl.set table ~key:"naira" ~data:naira ;
    Hashtbl.set table ~key:"kobo" ~data:kobo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Omani Rial *)
module ISO4217_OMR : Custom = struct
  let symbol = "OMR"

  let description = "Omani Rial"

  let units =
    let table = Hashtbl.create (module String) in
    let rial =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rial" (make_q "1/1")
    in
    let baisa =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"baisa"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"rial" ~data:rial ;
    Hashtbl.set table ~key:"baisa" ~data:baisa ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Pakistan Rupee *)
module ISO4217_PKR : Custom = struct
  let symbol = "PKR"

  let description = "Pakistan Rupee"

  let units =
    let table = Hashtbl.create (module String) in
    let rupee =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rupee" (make_q "1/1")
    in
    let paisa =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"paisa"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"rupee" ~data:rupee ;
    Hashtbl.set table ~key:"paisa" ~data:paisa ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Panamanian Balboa *)
module ISO4217_PAB : Custom = struct
  let symbol = "PAB"

  let description = "Panamanian Balboa"

  let units =
    let table = Hashtbl.create (module String) in
    let balboa =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"balboa" (make_q "1/1")
    in
    let centesimo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centesimo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"balboa" ~data:balboa ;
    Hashtbl.set table ~key:"centesimo" ~data:centesimo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Papua New Guinean Kina *)
module ISO4217_PGK : Custom = struct
  let symbol = "PGK"

  let description = "Papua New Guinean Kina"

  let units =
    let table = Hashtbl.create (module String) in
    let kina =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kina" (make_q "1/1")
    in
    let toea =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"toea" (make_q "100/1")
    in
    Hashtbl.set table ~key:"kina" ~data:kina ;
    Hashtbl.set table ~key:"toea" ~data:toea ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Paraguayan Guarani *)
module ISO4217_PYG : Custom = struct
  let symbol = "PYG"

  let description = "Paraguayan Guarani"

  let units =
    let table = Hashtbl.create (module String) in
    let guarani =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"guarani"
        (make_q "1/1")
    in
    let centimo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centimo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"guarani" ~data:guarani ;
    Hashtbl.set table ~key:"centimo" ~data:centimo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Peruvian Sol *)
module ISO4217_PEN : Custom = struct
  let symbol = "PEN"

  let description = "Peruvian Sol"

  let units =
    let table = Hashtbl.create (module String) in
    let sol =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"sol" (make_q "1/1")
    in
    let centimo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centimo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"sol" ~data:sol ;
    Hashtbl.set table ~key:"centimo" ~data:centimo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Philippine Peso *)
module ISO4217_PHP : Custom = struct
  let symbol = "PHP"

  let description = "Philippine Peso"

  let units =
    let table = Hashtbl.create (module String) in
    let peso =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"peso" (make_q "1/1")
    in
    let centavo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centavo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"peso" ~data:peso ;
    Hashtbl.set table ~key:"centavo" ~data:centavo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Polish Zloty *)
module ISO4217_PLN : Custom = struct
  let symbol = "PLN"

  let description = "Polish Zloty"

  let units =
    let table = Hashtbl.create (module String) in
    let zloty =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"zloty" (make_q "1/1")
    in
    let grosz =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"grosz"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"zloty" ~data:zloty ;
    Hashtbl.set table ~key:"grosz" ~data:grosz ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Qatari Rial *)
module ISO4217_QAR : Custom = struct
  let symbol = "QAR"

  let description = "Qatari Rial"

  let units =
    let table = Hashtbl.create (module String) in
    let rial =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rial" (make_q "1/1")
    in
    let dirham =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dirham"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"rial" ~data:rial ;
    Hashtbl.set table ~key:"dirham" ~data:dirham ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Romanian Leu *)
module ISO4217_RON : Custom = struct
  let symbol = "RON"

  let description = "Romanian Leu"

  let units =
    let table = Hashtbl.create (module String) in
    let leu =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"leu" (make_q "1/1")
    in
    let ban =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ban" (make_q "100/1")
    in
    Hashtbl.set table ~key:"leu" ~data:leu ;
    Hashtbl.set table ~key:"ban" ~data:ban ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Russian Ruble *)
module ISO4217_RUB : Custom = struct
  let symbol = "RUB"

  let description = "Russian Ruble"

  let units =
    let table = Hashtbl.create (module String) in
    let ruble =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ruble" (make_q "1/1")
    in
    let kopek =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kopek"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"ruble" ~data:ruble ;
    Hashtbl.set table ~key:"kopek" ~data:kopek ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Rwanda Franc *)
module ISO4217_RWF : Custom = struct
  let symbol = "RWF"

  let description = "Rwanda Franc"

  let units =
    let table = Hashtbl.create (module String) in
    let franc =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"franc" (make_q "1/1")
    in
    let centime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"franc" ~data:franc ;
    Hashtbl.set table ~key:"centime" ~data:centime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Saint Helena Pound *)
module ISO4217_SHP : Custom = struct
  let symbol = "SHP"

  let description = "Saint Helena Pound"

  let units =
    let table = Hashtbl.create (module String) in
    let pound =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pound" (make_q "1/1")
    in
    let penny =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"penny"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"pound" ~data:pound ;
    Hashtbl.set table ~key:"penny" ~data:penny ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Samoan Tala *)
module ISO4217_WST : Custom = struct
  let symbol = "WST"

  let description = "Samoan Tala"

  let units =
    let table = Hashtbl.create (module String) in
    let tala =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"tala" (make_q "1/1")
    in
    let sene =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"sene" (make_q "100/1")
    in
    Hashtbl.set table ~key:"tala" ~data:tala ;
    Hashtbl.set table ~key:"sene" ~data:sene ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Sao Tome and Principe Dobra *)
module ISO4217_STN : Custom = struct
  let symbol = "STN"

  let description = "Sao Tome and Principe Dobra"

  let units =
    let table = Hashtbl.create (module String) in
    let dobra =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dobra" (make_q "1/1")
    in
    let centimos =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centimos"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"dobra" ~data:dobra ;
    Hashtbl.set table ~key:"centimos" ~data:centimos ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Saudi Riyal *)
module ISO4217_SAR : Custom = struct
  let symbol = "SAR"

  let description = "Saudi Riyal"

  let units =
    let table = Hashtbl.create (module String) in
    let riyal =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"riyal" (make_q "1/1")
    in
    let halala =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"halala"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"riyal" ~data:riyal ;
    Hashtbl.set table ~key:"halala" ~data:halala ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Serbian Dinar *)
module ISO4217_RSD : Custom = struct
  let symbol = "RSD"

  let description = "Serbian Dinar"

  let units =
    let table = Hashtbl.create (module String) in
    let dinar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dinar" (make_q "1/1")
    in
    let para =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"para" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dinar" ~data:dinar ;
    Hashtbl.set table ~key:"para" ~data:para ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Seychelles Rupee *)
module ISO4217_SCR : Custom = struct
  let symbol = "SCR"

  let description = "Seychelles Rupee"

  let units =
    let table = Hashtbl.create (module String) in
    let rupee =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rupee" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"rupee" ~data:rupee ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Sierra Leonean Leone *)
module ISO4217_SLL : Custom = struct
  let symbol = "SLL"

  let description = "Sierra Leonean Leone"

  let units =
    let table = Hashtbl.create (module String) in
    let leone =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"leone" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"leone" ~data:leone ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Sierra Leonean Leone *)
module ISO4217_SLE : Custom = struct
  let symbol = "SLE"

  let description = "Sierra Leonean Leone"

  let units =
    let table = Hashtbl.create (module String) in
    let leone =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"leone" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"leone" ~data:leone ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Singapore Dollar *)
module ISO4217_SGD : Custom = struct
  let symbol = "SGD"

  let description = "Singapore Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Sucre *)
module ISO4217_XSU : Custom = struct
  let symbol = "XSU"

  let description = "Sucre"

  let units =
    let table = Hashtbl.create (module String) in
    let xsu =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"XSU" (make_q "1/1")
    in
    Hashtbl.set table ~key:"xsu" ~data:xsu ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Solomon Islands Dollar *)
module ISO4217_SBD : Custom = struct
  let symbol = "SBD"

  let description = "Solomon Islands Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Somali Shilling *)
module ISO4217_SOS : Custom = struct
  let symbol = "SOS"

  let description = "Somali Shilling"

  let units =
    let table = Hashtbl.create (module String) in
    let shilling =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"shilling"
        (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"shilling" ~data:shilling ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for South African Rand *)
module ISO4217_ZAR : Custom = struct
  let symbol = "ZAR"

  let description = "South African Rand"

  let units =
    let table = Hashtbl.create (module String) in
    let rand =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rand" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"rand" ~data:rand ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for South Sudanese Pound *)
module ISO4217_SSP : Custom = struct
  let symbol = "SSP"

  let description = "South Sudanese Pound"

  let units =
    let table = Hashtbl.create (module String) in
    let pound =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pound" (make_q "1/1")
    in
    let piastre =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"piastre"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"pound" ~data:pound ;
    Hashtbl.set table ~key:"piastre" ~data:piastre ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Sri Lanka Rupee *)
module ISO4217_LKR : Custom = struct
  let symbol = "LKR"

  let description = "Sri Lanka Rupee"

  let units =
    let table = Hashtbl.create (module String) in
    let rupee =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rupee" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"rupee" ~data:rupee ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Sudanese Pound *)
module ISO4217_SDG : Custom = struct
  let symbol = "SDG"

  let description = "Sudanese Pound"

  let units =
    let table = Hashtbl.create (module String) in
    let pound =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pound" (make_q "1/1")
    in
    let piastre =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"piastre"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"pound" ~data:pound ;
    Hashtbl.set table ~key:"piastre" ~data:piastre ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Surinam Dollar *)
module ISO4217_SRD : Custom = struct
  let symbol = "SRD"

  let description = "Surinam Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Swedish Krona *)
module ISO4217_SEK : Custom = struct
  let symbol = "SEK"

  let description = "Swedish Krona"

  let units =
    let table = Hashtbl.create (module String) in
    let krona =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"krona" (make_q "1/1")
    in
    let ore =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ore" (make_q "100/1")
    in
    Hashtbl.set table ~key:"krona" ~data:krona ;
    Hashtbl.set table ~key:"ore" ~data:ore ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for WIR Euro *)
module ISO4217_CHE : Custom = struct
  let symbol = "CHE"

  let description = "WIR Euro"

  let units =
    let table = Hashtbl.create (module String) in
    let che =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"CHE" (make_q "100/1")
    in
    Hashtbl.set table ~key:"che" ~data:che ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Syrian Pound *)
module ISO4217_SYP : Custom = struct
  let symbol = "SYP"

  let description = "Syrian Pound"

  let units =
    let table = Hashtbl.create (module String) in
    let pound =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pound" (make_q "1/1")
    in
    let piastre =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"piastre"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"pound" ~data:pound ;
    Hashtbl.set table ~key:"piastre" ~data:piastre ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for New Taiwan Dollar *)
module ISO4217_TWD : Custom = struct
  let symbol = "TWD"

  let description = "New Taiwan Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Tajikstani Somoni *)
module ISO4217_TJS : Custom = struct
  let symbol = "TJS"

  let description = "Tajikstani Somoni"

  let units =
    let table = Hashtbl.create (module String) in
    let somoni =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"somoni" (make_q "1/1")
    in
    let diram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"diram"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"somoni" ~data:somoni ;
    Hashtbl.set table ~key:"diram" ~data:diram ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Tanzanian Shilling *)
module ISO4217_TZS : Custom = struct
  let symbol = "TZS"

  let description = "Tanzanian Shilling"

  let units =
    let table = Hashtbl.create (module String) in
    let shilling =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"shilling"
        (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"shilling" ~data:shilling ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Thai Baht *)
module ISO4217_THB : Custom = struct
  let symbol = "THB"

  let description = "Thai Baht"

  let units =
    let table = Hashtbl.create (module String) in
    let baht =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"baht" (make_q "1/1")
    in
    let satang =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"satang"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"baht" ~data:baht ;
    Hashtbl.set table ~key:"satang" ~data:satang ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Tongan Pa'anga *)
module ISO4217_TOP : Custom = struct
  let symbol = "TOP"

  let description = "Tongan Pa'anga"

  let units =
    let table = Hashtbl.create (module String) in
    let paanga =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"pa'anga"
        (make_q "1/1")
    in
    let seniti =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"seniti"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"paanga" ~data:paanga ;
    Hashtbl.set table ~key:"seniti" ~data:seniti ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Trinidad and Tobago Dollar *)
module ISO4217_TTD : Custom = struct
  let symbol = "TTD"

  let description = "Trinidad and Tobago Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Tunisian Dinar *)
module ISO4217_TND : Custom = struct
  let symbol = "TND"

  let description = "Tunisian Dinar"

  let units =
    let table = Hashtbl.create (module String) in
    let dinar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dinar" (make_q "1/1")
    in
    let millime =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"millime"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"dinar" ~data:dinar ;
    Hashtbl.set table ~key:"millime" ~data:millime ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Turkish Lira *)
module ISO4217_TRY : Custom = struct
  let symbol = "TRY"

  let description = "Turkish Lira"

  let units =
    let table = Hashtbl.create (module String) in
    let lira =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"lira" (make_q "1/1")
    in
    let kurus =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kurus"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"kurus" ~data:lira ;
    Hashtbl.set table ~key:"kurus" ~data:kurus ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Turkmenistan New Manat *)
module ISO4217_TMT : Custom = struct
  let symbol = "TMT"

  let description = "Turkmenistan New Manat"

  let units =
    let table = Hashtbl.create (module String) in
    let manat =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"manat" (make_q "1/1")
    in
    let tennesi =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"tennesi"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"manat" ~data:manat ;
    Hashtbl.set table ~key:"tennesi" ~data:tennesi ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Uganda Shilling *)
module ISO4217_UGX : Custom = struct
  let symbol = "UGX"

  let description = "Uganda Shilling"

  let units =
    let table = Hashtbl.create (module String) in
    let shilling =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"shilling"
        (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"shilling" ~data:shilling ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Ukrainian Hryvnia *)
module ISO4217_UAH : Custom = struct
  let symbol = "UAH"

  let description = "Ukrainian Hryvnia"

  let units =
    let table = Hashtbl.create (module String) in
    let hryvnia =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"hryvnia"
        (make_q "1/1")
    in
    let kopiyka =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kopiyka"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"hryvnia" ~data:hryvnia ;
    Hashtbl.set table ~key:"kopiyka" ~data:kopiyka ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for UAE Dirham *)
module ISO4217_AED : Custom = struct
  let symbol = "AED"

  let description = "UAE Dirham"

  let units =
    let table = Hashtbl.create (module String) in
    let dirham =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dirham" (make_q "1/1")
    in
    let fils =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"fils" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dirham" ~data:dirham ;
    Hashtbl.set table ~key:"fils" ~data:fils ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for US Dollar *)
module ISO4217_USD : Custom = struct
  let symbol = "USD"

  let description = "US Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for US Dollar (Next day) *)
module ISO4217_USN : Custom = struct
  let symbol = "USN"

  let description = "US Dollar (Next day)"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Peso Uruguayo *)
module ISO4217_UYU : Custom = struct
  let symbol = "UYU"

  let description = "Peso Uruguayo"

  let units =
    let table = Hashtbl.create (module String) in
    let peso =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"peso" (make_q "1/1")
    in
    let centesimo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centesimo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"peso" ~data:peso ;
    Hashtbl.set table ~key:"centesimo" ~data:centesimo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Uruguay Peso en Unidades Indexadas *)
module ISO4217_UYI : Custom = struct
  let symbol = "UYI"

  let description = "Uruguay Peso en Unidades Indexadas"

  let units =
    let table = Hashtbl.create (module String) in
    let uyi =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"UYI" (make_q "1/1")
    in
    Hashtbl.set table ~key:"uyi" ~data:uyi ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Unidad Previsional *)
module ISO4217_UYW : Custom = struct
  let symbol = "UYW"

  let description = "Unidad Previsional"

  let units =
    let table = Hashtbl.create (module String) in
    let uyw =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"UYW"
        (make_q "10000/1")
    in
    Hashtbl.set table ~key:"uyw" ~data:uyw ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Uzbekistani Sum *)
module ISO4217_UZS : Custom = struct
  let symbol = "UZS"

  let description = "Uzbekistani Sum"

  let units =
    let table = Hashtbl.create (module String) in
    let sum =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"sum" (make_q "1/1")
    in
    let tiyin =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"tiyin"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"sum" ~data:sum ;
    Hashtbl.set table ~key:"tiyin" ~data:tiyin ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Vanuatu Vatu *)
module ISO4217_VUV : Custom = struct
  let symbol = "VUV"

  let description = "Vanuatu Vatu"

  let units =
    let table = Hashtbl.create (module String) in
    let vatu =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"vatu" (make_q "1/1")
    in
    Hashtbl.set table ~key:"vatu" ~data:vatu ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bolivar Soberano S *)
module ISO4217_VES : Custom = struct
  let symbol = "VES"

  let description = "Bolivar Soberano"

  let units =
    let table = Hashtbl.create (module String) in
    let bolivar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"bolivar"
        (make_q "1/1")
    in
    let centimo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centimo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"bolivar" ~data:bolivar ;
    Hashtbl.set table ~key:"centimo" ~data:centimo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bolivar Soberano D *)
module ISO4217_VED : Custom = struct
  let symbol = "VED"

  let description = "Bolivar Soberano"

  let units =
    let table = Hashtbl.create (module String) in
    let bolivar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"bolivar"
        (make_q "1/1")
    in
    let centimo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centimo"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"bolivar" ~data:bolivar ;
    Hashtbl.set table ~key:"centimo" ~data:centimo ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Vietnamese Dong *)
module ISO4217_VND : Custom = struct
  let symbol = "VND"

  let description = "Vietnamese Dong"

  let units =
    let table = Hashtbl.create (module String) in
    let dong =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dong" (make_q "1/1")
    in
    let hao =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"hao" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dong" ~data:dong ;
    Hashtbl.set table ~key:"hao" ~data:hao ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Yemeni Rial *)
module ISO4217_YER : Custom = struct
  let symbol = "YER"

  let description = "Yemeni Rial"

  let units =
    let table = Hashtbl.create (module String) in
    let rial =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"rial" (make_q "1/1")
    in
    let fils =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"fils" (make_q "100/1")
    in
    Hashtbl.set table ~key:"rial" ~data:rial ;
    Hashtbl.set table ~key:"fils" ~data:fils ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Zambian Kwacha *)
module ISO4217_ZMW : Custom = struct
  let symbol = "ZMW"

  let description = "Zambian Kwacha"

  let units =
    let table = Hashtbl.create (module String) in
    let kwacha =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kwacha" (make_q "1/1")
    in
    let ngwee =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ngwee"
        (make_q "100/1")
    in
    Hashtbl.set table ~key:"ngwee" ~data:kwacha ;
    Hashtbl.set table ~key:"ngwee" ~data:ngwee ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Zimbabwe Dollar *)
module ISO4217_ZWL : Custom = struct
  let symbol = "ZWL"

  let description = "Zimbabwe Dollar"

  let units =
    let table = Hashtbl.create (module String) in
    let dollar =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dollar" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"dollar" ~data:dollar ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bond Markets Unit European Composite Unit (EURCO) *)
module ISO4217_XBA : Custom = struct
  let symbol = "XBA"

  let description = "Bond Markets Unit European Composite Unit (EURCO)"

  let units =
    let table = Hashtbl.create (module String) in
    let xba =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"XBA" (make_q "1/1")
    in
    Hashtbl.set table ~key:"xba" ~data:xba ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bond Markets Unit European Composite Unit (E.M.U.-6) *)
module ISO4217_XBB : Custom = struct
  let symbol = "XBB"

  let description = "Bond Markets Unit European Monetary Unit (E.M.U.-6)"

  let units =
    let table = Hashtbl.create (module String) in
    let xbb =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"XBB" (make_q "1/1")
    in
    Hashtbl.set table ~key:"xbb" ~data:xbb ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bond Markets Unit European Unit of Account 9 (E.U.A.-9) *)
module ISO4217_XBC : Custom = struct
  let symbol = "XBC"

  let description = "Bond Markets Unit European Unit of Account 9 (E.U.A.-9)"

  let units =
    let table = Hashtbl.create (module String) in
    let xbc =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"XBC" (make_q "1/1")
    in
    Hashtbl.set table ~key:"xbc" ~data:xbc ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bond Markets Unit European Unit of Account 17 (E.U.A.-17) *)
module ISO4217_XBD : Custom = struct
  let symbol = "XBD"

  let description =
    "Bond Markets Unit European Unit of Account 17 (E.U.A.-17)"

  let units =
    let table = Hashtbl.create (module String) in
    let xbd =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"XBD" (make_q "1/1")
    in
    Hashtbl.set table ~key:"xbd" ~data:xbd ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Non Currency *)
module ISO4217_XXX : Custom = struct
  let symbol = "XXX"

  let description =
    "The codes assigned for transactions where no currency is involved"

  let units = None

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Gold *)
module ISO4217_XAU : Custom = struct
  let symbol = "XAU"

  let description = "Gold"

  let units =
    let table = Hashtbl.create (module String) in
    let troy_ounce =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"troy-ounce"
        (make_q "1/1")
    in
    let grain =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"grain"
        (make_q "480/1")
    in
    let milligrain =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"milligrain"
        (make_q "480000/1")
    in
    let kilogram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kilogram"
        (make_q "31103477/1000000000")
    in
    let gram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"gram"
        (make_q "31103477/1000000")
    in
    let milligram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"milligram"
        (make_q "31103477/1000")
    in
    let microgram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"microgram"
        (make_q "31103477/1")
    in
    Hashtbl.set table ~key:"troy-ounce" ~data:troy_ounce ;
    Hashtbl.set table ~key:"grain" ~data:grain ;
    Hashtbl.set table ~key:"milligrain" ~data:milligrain ;
    Hashtbl.set table ~key:"kilogram" ~data:kilogram ;
    Hashtbl.set table ~key:"gram" ~data:gram ;
    Hashtbl.set table ~key:"milligram" ~data:milligram ;
    Hashtbl.set table ~key:"microgram" ~data:microgram ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Palladium *)
module ISO4217_XPD : Custom = struct
  let symbol = "XPD"

  let description = "Palladium"

  let units =
    let table = Hashtbl.create (module String) in
    let troy_ounce =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"troy-ounce"
        (make_q "1/1")
    in
    let grain =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"grain"
        (make_q "480/1")
    in
    let milligrain =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"milligrain"
        (make_q "480000/1")
    in
    let kilogram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kilogram"
        (make_q "31103477/1000000000")
    in
    let gram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"gram"
        (make_q "31103477/1000000")
    in
    let milligram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"milligram"
        (make_q "31103477/1000")
    in
    let microgram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"microgram"
        (make_q "31103477/1")
    in
    Hashtbl.set table ~key:"troy-ounce" ~data:troy_ounce ;
    Hashtbl.set table ~key:"grain" ~data:grain ;
    Hashtbl.set table ~key:"milligrain" ~data:milligrain ;
    Hashtbl.set table ~key:"kilogram" ~data:kilogram ;
    Hashtbl.set table ~key:"gram" ~data:gram ;
    Hashtbl.set table ~key:"milligram" ~data:milligram ;
    Hashtbl.set table ~key:"microgram" ~data:microgram ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Platinum *)
module ISO4217_XPT : Custom = struct
  let symbol = "XPT"

  let description = "Platinum"

  let units =
    let table = Hashtbl.create (module String) in
    let troy_ounce =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"troy-ounce"
        (make_q "1/1")
    in
    let grain =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"grain"
        (make_q "480/1")
    in
    let milligrain =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"milligrain"
        (make_q "480000/1")
    in
    let kilogram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kilogram"
        (make_q "31103477/1000000000")
    in
    let gram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"gram"
        (make_q "31103477/1000000")
    in
    let milligram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"milligram"
        (make_q "31103477/1000")
    in
    let microgram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"microgram"
        (make_q "31103477/1")
    in
    Hashtbl.set table ~key:"troy-ounce" ~data:troy_ounce ;
    Hashtbl.set table ~key:"grain" ~data:grain ;
    Hashtbl.set table ~key:"milligrain" ~data:milligrain ;
    Hashtbl.set table ~key:"kilogram" ~data:kilogram ;
    Hashtbl.set table ~key:"gram" ~data:gram ;
    Hashtbl.set table ~key:"milligram" ~data:milligram ;
    Hashtbl.set table ~key:"microgram" ~data:microgram ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Silver *)
module ISO4217_XAG : Custom = struct
  let symbol = "XAG"

  let description = "Silver"

  let units =
    let table = Hashtbl.create (module String) in
    let troy_ounce =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"troy-ounce"
        (make_q "1/1")
    in
    let grain =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"grain"
        (make_q "480/1")
    in
    let milligrain =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"milligrain"
        (make_q "480000/1")
    in
    let kilogram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kilogram"
        (make_q "31103477/1000000000")
    in
    let gram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"gram"
        (make_q "31103477/1000000")
    in
    let milligram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"milligram"
        (make_q "31103477/1000")
    in
    let microgram =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"microgram"
        (make_q "31103477/1")
    in
    Hashtbl.set table ~key:"troy-ounce" ~data:troy_ounce ;
    Hashtbl.set table ~key:"grain" ~data:grain ;
    Hashtbl.set table ~key:"milligrain" ~data:milligrain ;
    Hashtbl.set table ~key:"kilogram" ~data:kilogram ;
    Hashtbl.set table ~key:"gram" ~data:gram ;
    Hashtbl.set table ~key:"milligram" ~data:milligram ;
    Hashtbl.set table ~key:"microgram" ~data:microgram ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Bitcoin *)
module Crypto_BTC : Custom = struct
  let symbol = "BTC"

  let description = "Bitcoin"

  let units =
    let table = Hashtbl.create (module String) in
    let bitcoin =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"bitcoin"
        (make_q "1/1")
    in
    let millibitcoin =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"millibitcoin"
        (make_q "1000/1")
    in
    let satoshi =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"satoshi"
        (make_q "100000000/1")
    in
    Hashtbl.set table ~key:"bitcoin" ~data:bitcoin ;
    Hashtbl.set table ~key:"millibitcoin" ~data:millibitcoin ;
    Hashtbl.set table ~key:"satoshi" ~data:satoshi ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Ethereum *)
module Crypto_ETH : Custom = struct
  let symbol = "ETH"

  let description = "Ethereum"

  let units =
    let table = Hashtbl.create (module String) in
    let ether =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ether" (make_q "1/1")
    in
    let kwei =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"kwei"
        (make_q "1000/1")
    in
    let babbage =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"babbage"
        (make_q "1000/1")
    in
    let mwei =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"mwei"
        (make_q "1000000/1")
    in
    let lovelace =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"lovelace"
        (make_q "1000000/1")
    in
    let gwei =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"gwei"
        (make_q "1000000000/1")
    in
    let shannon =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"shannon"
        (make_q "1000000000/1")
    in
    let microether =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"microether"
        (make_q "1000000000000/1")
    in
    let szabo =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"szabo"
        (make_q "1000000000000/1")
    in
    let finney =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"finney"
        (make_q "1000000000000000/1")
    in
    let milliether =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"milliether"
        (make_q "1000000000000000/1")
    in
    let wei =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"wei"
        (make_q "1000000000000000000/1")
    in
    Hashtbl.set table ~key:"ether" ~data:ether ;
    Hashtbl.set table ~key:"kwei" ~data:kwei ;
    Hashtbl.set table ~key:"babbage" ~data:babbage ;
    Hashtbl.set table ~key:"mwei" ~data:mwei ;
    Hashtbl.set table ~key:"lovelace" ~data:lovelace ;
    Hashtbl.set table ~key:"gwei" ~data:gwei ;
    Hashtbl.set table ~key:"shannon" ~data:shannon ;
    Hashtbl.set table ~key:"microether" ~data:microether ;
    Hashtbl.set table ~key:"szabo" ~data:szabo ;
    Hashtbl.set table ~key:"finney" ~data:finney ;
    Hashtbl.set table ~key:"milliether" ~data:milliether ;
    Hashtbl.set table ~key:"wei" ~data:wei ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Binance Coin *)
module Crypto_BNB : Custom = struct
  let symbol = "BNB"

  let description = "Binance Coin"

  let units =
    let table = Hashtbl.create (module String) in
    let bnb =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"bnb" (make_q "1/1")
    in
    let jager =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"jager"
        (make_q "100000000/1")
    in
    Hashtbl.set table ~key:"bnb" ~data:bnb ;
    Hashtbl.set table ~key:"jager" ~data:jager ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Tether USDT *)
module Crypto_USDT : Custom = struct
  let symbol = "USDT"

  let description = "Tether USDT"

  let units =
    let table = Hashtbl.create (module String) in
    let usdt =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"usdt" (make_q "1/1")
    in
    let cent =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"cent" (make_q "100/1")
    in
    Hashtbl.set table ~key:"usdt" ~data:usdt ;
    Hashtbl.set table ~key:"cent" ~data:cent ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Cardano *)
module Crypto_ADA : Custom = struct
  let symbol = "ADA"

  let description = "Cardano"

  let units =
    let table = Hashtbl.create (module String) in
    let ada =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ada" (make_q "1/1")
    in
    let lovelace =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"lovelace"
        (make_q "1000000/1")
    in
    Hashtbl.set table ~key:"ada" ~data:ada ;
    Hashtbl.set table ~key:"lovelace" ~data:lovelace ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Dogecoin *)
module Crypto_DOGE : Custom = struct
  let symbol = "DOGE"

  let description = "Dogecoin"

  let units =
    let table = Hashtbl.create (module String) in
    let doge =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"doge" (make_q "1/1")
    in
    let koinu =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"koinu"
        (make_q "100000000/1")
    in
    Hashtbl.set table ~key:"doge" ~data:doge ;
    Hashtbl.set table ~key:"koinu" ~data:koinu ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Litecoin *)
module Crypto_LTC : Custom = struct
  let symbol = "LTC"

  let description = "Litecoin"

  let units =
    let table = Hashtbl.create (module String) in
    let litecoin =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"litecoin"
        (make_q "1/1")
    in
    let lite =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"lite"
        (make_q "1000/1")
    in
    let photon =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"lite"
        (make_q "100000000/1")
    in
    Hashtbl.set table ~key:"litecoin" ~data:litecoin ;
    Hashtbl.set table ~key:"lite" ~data:lite ;
    Hashtbl.set table ~key:"photon" ~data:photon ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Ripple *)
module Crypto_XRP : Custom = struct
  let symbol = "XRP"

  let description = "Ripple"

  let units =
    let table = Hashtbl.create (module String) in
    let ripple =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"ripple" (make_q "1/1")
    in
    let drop =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"drop"
        (make_q "1000000/1")
    in
    Hashtbl.set table ~key:"ripple" ~data:ripple ;
    Hashtbl.set table ~key:"drop" ~data:drop ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Monero *)
module Crypto_XMR : Custom = struct
  let symbol = "XMR"

  let description = "Monero"

  let units =
    let table = Hashtbl.create (module String) in
    let monero =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"monero" (make_q "1/1")
    in
    let decinero =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"decinero"
        (make_q "10/1")
    in
    let centinero =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"centinero"
        (make_q "100/1")
    in
    let millinero =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"millinero"
        (make_q "1000/1")
    in
    let micronero =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"micronero"
        (make_q "1000000/1")
    in
    let nanonero =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"nanonero"
        (make_q "1000000000/1")
    in
    let piconero =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"piconero"
        (make_q "1000000000000/1")
    in
    Hashtbl.set table ~key:"monero" ~data:monero ;
    Hashtbl.set table ~key:"decinero" ~data:decinero ;
    Hashtbl.set table ~key:"centinero" ~data:centinero ;
    Hashtbl.set table ~key:"millinero" ~data:millinero ;
    Hashtbl.set table ~key:"micronero" ~data:micronero ;
    Hashtbl.set table ~key:"nanonero" ~data:nanonero ;
    Hashtbl.set table ~key:"piconero" ~data:piconero ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Solana *)
module Crypto_SOL : Custom = struct
  let symbol = "SOL"

  let description = "Solana"

  let units =
    let table = Hashtbl.create (module String) in
    let sol =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"sol" (make_q "1/1")
    in
    let lamport =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"lamport"
        (make_q "100000000/1")
    in
    Hashtbl.set table ~key:"sol" ~data:sol ;
    Hashtbl.set table ~key:"lamport" ~data:lamport ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Polkadot *)
module Crypto_DOT : Custom = struct
  let symbol = "DOT"

  let description = "Polkadot"

  let units =
    let table = Hashtbl.create (module String) in
    let dot =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dot" (make_q "1/1")
    in
    let million =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"million "
        (make_q "1/1000000")
    in
    let millidot =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"millidot "
        (make_q "1000/1")
    in
    let microdot =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"microdot "
        (make_q "100000/1")
    in
    let planck =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"million "
        (make_q "1000000000/1")
    in
    Hashtbl.set table ~key:"dot" ~data:dot ;
    Hashtbl.set table ~key:"million" ~data:million ;
    Hashtbl.set table ~key:"millidot" ~data:millidot ;
    Hashtbl.set table ~key:"microdot" ~data:microdot ;
    Hashtbl.set table ~key:"planck" ~data:planck ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Shiba inu *)
module Crypto_SHIB : Custom = struct
  let symbol = "SHIB"

  let description = "Shiba inu"

  let units =
    let table = Hashtbl.create (module String) in
    let shib =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"dot" (make_q "1/1")
    in
    let shiboshi =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"shiboshi "
        (make_q "100000000/1")
    in
    Hashtbl.set table ~key:"shib" ~data:shib ;
    Hashtbl.set table ~key:"shiboshi" ~data:shiboshi ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end

(** Predefined module for Tezos *)
module Crypto_XTZ : Custom = struct
  let symbol = "XTZ"

  let description = "Tezos"

  let units =
    let table = Hashtbl.create (module String) in
    let tez =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"tez" (make_q "1/1")
    in
    let mutez =
      Discrete.Scale.make_scale ~sym:symbol ~sub_unit:"mutez "
        (make_q "1000000/1")
    in
    Hashtbl.set table ~key:"tez" ~data:tez ;
    Hashtbl.set table ~key:"mutez" ~data:mutez ;
    Some table

  let make_qv qv = Quotient.make_qv (symbol, qv)

  let make_dv unit dv =
    match units with
    | Some tbl ->
        let s =
          Option.value_exn ~message:"Error retriving non-existent scale"
          @@ Hashtbl.find tbl unit
        in
        Some (Discrete.make_dv (s, dv))
    | None -> None
end
