clojure:meta() {
  language_name="Clojure"
  tag_line="Lisp in the JVM"
  language_description="\
Clojure is a dynamic, general-purpose programming language, combining the
approachability and interactive development of a scripting language with an
efficient and robust infrastructure for multithreaded programming. Clojure
is a compiled language, yet remains completely dynamic – every feature
supported by Clojure is supported at runtime. Clojure provides easy access
to the Java frameworks, with optional type hints and type inference, to
ensure that calls to Java can avoid reflection.
"
}

clojure:main() (
  run lein "$command" "$@"
)

clojure:test() (
  mkdir -p .lein/{tmp,m2}
  run lein test "$@"
)

clojure:publish() (
  get-config username apitoken
  docker_args+=( --env USERNAME=$USERNAME )
  docker_args+=( --env APITOKEN=$APITOKEN )

  if [[ ${1-} == :snapshot ]]; then
    shift
    run lein deploy "$@"
  else
    run lein release "$@"
  fi
)

clojure:version() (
  version clojure 'clojure </dev/null' 2
  version lein 2
)
