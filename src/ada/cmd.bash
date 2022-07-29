ada:meta() {
  language_name="Ada"
  tag_line="The Language for Safe, Secure, Reliable Software"
  language_description="\
Ada is a state-of-the art programming language that development teams
worldwide are using for critical software: from microkernels and
small-footprint, real-time embedded systems to large-scale enterprise
applications, and everything in between.
"
}

ada:main() (
  run alr "$command" "$@"
)

ada:version() (
  version gnat 2
  version alr 2
)
