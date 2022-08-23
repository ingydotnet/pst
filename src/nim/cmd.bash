nim:meta() {
  language_name="Nim"
  tag_line="Efficient, expressive, elegant"
  language_description="\
Nim is a general-purpose, multi-paradigm, statically typed, compiled
systems programming language, designed and developed by a team around
Andreas Rumpf. Nim is designed to be \"efficient, expressive, and elegant\",
supporting metaprogramming, functional, message passing, procedural, and
object-oriented programming styles by providing several features such as
compile time code generation, algebraic data types, a foreign function
interface (FFI) with C, C++, Objective-C, and JavaScript, and supporting
compiling to those same languages.
"
}

nim:main() (
  run nimble "$command" "$@"
)

# shellcheck disable=2088
nim:version() (
  version nim '~/.nimble/bin/nim --version' 4
  version nimble '~/.nimble/bin/nimble --version' 2
)
