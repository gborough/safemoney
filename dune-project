(lang dune 3.0)

(name safemoney)

(generate_opam_files true)

(source
 (github gborough/safemoney))

(authors "Geoffrey Borough")

(maintainers "geoffrey.borough@outlook.com")

(license MIT)

(documentation https://gborough.github.io/safemoney/safemoney)

(package
 (name safemoney)
 (authors "Geoffrey Borough")
 (synopsis "A type safe money manipulation library")
 (description "A type safe money manipulation library")
 (depends
  (ocaml
   (>= 4.14.0))
  base
  dune
  (zarith
   (>= 1.5.0))
  stdint
  (angstrom
   (>= 0.16.0))
  re
  yojson
  ppx_deriving
  ppx_deriving_yojson
  ppx_jane
  sexplib
  (ppx_expect :with-test)))
