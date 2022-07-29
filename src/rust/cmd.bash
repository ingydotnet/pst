rust:meta() {
  language_name="Rust"
  tag_line="A language empowering everyone"
  language_description="\
Rust is a multi-paradigm, general-purpose programming language. Rust
emphasizes performance, type safety, and concurrency. Rust enforces memory
safety—that is, that all references point to valid memory—without requiring
the use of a garbage collector or reference counting present in other
memory-safe languages.
"
}

rust:main() (
  run crate "$command" "$@"
)

rust:version() (
  version rustc '/home/user/.cargo/bin/rustc --version' 2
  version cargo '/home/user/.cargo/bin/cargo --version' 2
)
