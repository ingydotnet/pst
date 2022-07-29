dart:meta() {
  language_name="Dart"
  tag_line="A client-optimized language for fast apps"
  language_description="\
Dart is a programming language designed for client development, such as for
the web and mobile apps. It is developed by Google and can also be used to
build server and desktop applications. It is an object-oriented,
class-based, garbage-collected language with C-style syntax.
"
}

dart:main() (
  run pub "$command" "$@"
)

dart:version() (
  version dart 4
)
