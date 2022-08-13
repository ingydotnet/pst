csharp:meta() {
  language_name="C#"
  tag_line="An object/component oriented programming language"
  language_description="\
C# is a general-purpose, multi-paradigm programming language. C#
encompasses static typing, strong typing, lexically scoped, imperative,
declarative, functional, generic, object-oriented (class-based), and
component-oriented programming disciplines.
"
}

csharp:main() (
  run nuget "$command" "$@"
)

csharp:version() (
  version mono-csc 5
  version mcs 5
  version dotnet 'dotnet --version' 1
  version mono 5
  version nuget 'nuget help 2>/dev/null | head -n1' 3
)
