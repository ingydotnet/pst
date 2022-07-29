groovy:meta() {
  language_name="Groovy"
  tag_line="A multi-faceted language for the Java platform"
  language_description="\
"
}

groovy:main() (
  run gradle "$command" "$@"
)

groovy:version() (
  version groovy 'groovy --version </dev/null 2>/dev/null' 3
  version gradle 'gradle --version </dev/null 2>/dev/null | grep ^Gradle' 2
)
