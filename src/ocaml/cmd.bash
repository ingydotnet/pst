ocaml:meta() {
  language_name="OCaml"
  tag_line="Functional language with expressiveness and safety"
  language_description="\
OCaml (formerly Objective Caml) is a general-purpose, multi-paradigm
programming language which extends the Caml dialect of ML with
object-oriented features. OCaml was created in 1996 by Xavier Leroy, Jérôme
Vouillon, Damien Doligez, Didier Rémy, Ascánder Suárez, and others.
"
}

ocaml:main() (
  run opam "$command" "$@"
)

ocaml:version() (
  version ocaml 5
  version opam 1
)
