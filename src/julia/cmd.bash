julia:meta() {
  language_name="Julia"
  tag_line="It just seemed like a pretty name"
  language_description="\
Julia is a high-level, high-performance, dynamic programming language.
While it is a general-purpose language and can be used to write any
application, many of its features are well suited for numerical analysis
and computational science.
"
}

julia:repl() (
  run julia --project=.
)

julia:version() (
  version julia 3
)
