haskell:meta() {
  language_name="Haskell"
  tag_line="A purely functional programming language"
  language_description="\
Haskell is a general-purpose, statically-typed, purely functional
programming language with type inference and lazy evaluation. Designed for
teaching, research and industrial applications, Haskell has pioneered a
number of programming language features such as type classes, which enable
type-safe operator overloading. Haskell's main implementation is the
Glasgow Haskell Compiler (GHC). It is named after logician Haskell Curry.
"
}

haskell:main() (
  run cabal "$command" "$@"
)

haskell:version() (
  version ghc 8
  version cabal 3
)
