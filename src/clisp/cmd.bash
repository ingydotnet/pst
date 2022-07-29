clisp:meta() {
  language_name="Common Lisp"
  tag_line="The Programmable Programming Language"
  language_description="\
Common Lisp is the modern, multi-paradigm, high-performance, compiled,
ANSI-standardized, most prominent (along with Scheme) descendant of the
long-running family of Lisp programming languages.
"
}

clisp:main() (
  run quicklisp "$command" "$@"
)

clisp:version() (
  version sbcl 2
)
