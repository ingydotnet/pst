test:main() (
  lang "$@"
)

test:all() (
  echo 'Ada — gnat & alr'
  run gnat --version
  run alr --version
)

version_tests="\
== Ada
$ gnat --version | head -n1
$ alr --version

== Bash
$ bash --version
$ bpan --version

== Ruby
$ ruby --version
$ gem --version
"
