racket:meta() {
  language_name="Racket"
  tag_line="The Language-Oriented Programming Language"
  language_description="\
Racket is a general-purpose, multi-paradigm programming language and a
multi-platform distribution that includes the Racket language, compiler,
large standard library, IDE, development tools, and a set of additional
languages including Typed Racket (a sister language of Racket with a static
type-checker), Swindle, FrTime, Lazy Racket, R5RS & R6RS Scheme, Scribble,
Datalog, Racklog, Algol 60 and several teaching languages.
"
}

racket:main() (
  run raco "$command" "$@"
)

racket:version() (
  version racket 4
  version raco 'raco setup |& head -n1' 4
)
