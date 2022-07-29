scala:meta() {
  language_name="Scala"
  tag_line="The Scala Programming Language"
  language_description="\
Scala combines object-oriented and functional programming in one concise,
high-level language. Scala's static types help avoid bugs in complex
applications, and its JVM and JavaScript runtimes let you build
high-performance systems with easy access to huge ecosystems of libraries.
"
}

scala:main() (
  run sbt "$command" "$@"
)

scala:version() (
  version scala '/root/.local/share/coursier/bin/scala --version' 5
  version sbt '/root/.local/share/coursier/bin/sbt exit | grep welcome | head -n1' 5
)
