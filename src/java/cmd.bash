java:meta() {
  language_name="Java"
  tag_line="Write once, run away"
  language_description="\
Java is a high-level, class-based, object-oriented programming language
that is designed to have as few implementation dependencies as possible. It
is a general-purpose programming language intended to let programmers write
once, run anywhere (WORA), meaning that compiled Java code can run on all
platforms that support Java without the need to recompile. Java
applications are typically compiled to bytecode that can run on any Java
virtual machine (JVM) regardless of the underlying computer architecture.
"
}

java:main() (
  run maven "$command" "$@"
)

java:version() (
  version javac 2
  version java 2
  version mvn 'mvn --version | sed '"'"'s/\x1b\[1\?m/ /g'"'"'' 3
)
