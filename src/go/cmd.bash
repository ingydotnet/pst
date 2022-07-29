go:meta() {
  language_name="Go"
  tag_line="Build fast, reliable, and efficient software at scale"
  language_description="\
Go is a statically typed, compiled programming language designed at Google
by Robert Griesemer, Rob Pike, and Ken Thompson. It is syntactically
similar to C, but with memory safety, garbage collection, structural
typing, and CSP-style concurrency. It is often referred to as Golang
because of its former domain name, golang.org, but its proper name is Go.
"
}

go:main() (
  run go "$command" "$@"
)

go:version() (
  version go '/usr/local/go/bin/go version' 3
)
