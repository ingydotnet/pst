python:meta() {
  language_name="Python"
  tag_line="A programming language that lets you work quickly"
  language_description="\
Python is a high-level, interpreted, general-purpose programming language.
Its design philosophy emphasizes code readability with the use of
significant indentation.
"
}

python:main() (
  run pip "$command" "$@"
)

python:version() (
  version python 2
  version pip 2
)
