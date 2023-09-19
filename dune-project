(lang dune 3.0)

(name safemoney)

(generate_opam_files true)
(implicit_transitive_deps false)

(source
 (github gborough/safemoney))

(authors "Geoffrey Borough")

(maintainers "geoffrey.borough@outlook.com")

(license MIT)

(documentation https://gborough.github.io/safemoney/safemoney/safemoney/index.html)

(package
 (name safemoney)
 (authors "Geoffrey Borough")
 (synopsis "A type safe money manipulation library")
 (description "A type safe money manipulation library")
 (depends (ocaml (>= 4.14.0)) core dune (zarith (>= 1.6)) stdint (angstrom (>= 0.14.0)) re2 yojson ppx_jane ppx_deriving ppx_yojson_conv ppx_deriving_yojson))
