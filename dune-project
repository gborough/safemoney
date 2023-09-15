(lang dune 3.0)

(name safemoney)

(generate_opam_files true)

(source
 (github gborough/safemoney))

(authors "Geoffrey Borough")

(maintainers "geoffrey.borough@outlook.com")

(license MIT)

(documentation https://github.com/gborough/safemoney/README.md)

(package
 (name safemoney)
 (authors "Geoffrey Borough")
 (synopsis "A type safe money manipulation library")
 (description "A type safe money manipulation library")
 (depends (ocaml (>= 4.14.0)) core dune zarith stdint angstrom re2 yojson ppx_jane ppx_deriving ppx_yojson_conv ppx_deriving_yojson))