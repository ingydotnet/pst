crystal:meta() {
  language_name="Crystal"
  tag_line="A Language For Humans and Computers"
  language_description="\
Crystal is a general-purpose, object-oriented programming language,
designed and developed by Ary Borenszweig, Juan Wajnerman, Brian Cardiff
and more than 300 contributors. With syntax inspired by the language Ruby,
it is a compiled language with static type-checking, but specifying the
types of variables or method arguments is generally unneeded. Types are
resolved by an advanced global type inference algorithm. Crystal is
currently in active development. It is released as free and open-source
software under the Apache License version 2.0.
"
}

crystal:main() (
  run shard "$command" "$@"
)

crystal:version() (
  version crystal 2
  version llvm 'crystal --version' 7
  version shards 2
)
