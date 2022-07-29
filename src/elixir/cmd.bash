elixir:meta() {
  language_name="Elixir"
  tag_line="For building scalable and maintainable applications"
  language_description="\
Elixir is a functional, concurrent, general-purpose programming language
that runs on the BEAM virtual machine which is also used to implement the
Erlang programming language. Elixir builds on top of Erlang and shares the
same abstractions for building distributed, fault-tolerant applications.
Elixir also provides productive tooling and an extensible design. The
latter is supported by compile-time metaprogramming with macros and
polymorphism via protocols.
"
}

elixir:main() (
  run hex "$command" "$@"
)

elixir:version() (
  version elixir 'elixir --version | grep ^Elixir' 2
  version mix 'mix --version | grep ^Mix' 2
)
