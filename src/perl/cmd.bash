perl:meta() {
  language_name="Perl"
  tag_line="Pathologically Eclectic Rubbish Lister"
  language_description="\
Perl is a general purpose, high level interpreted and dynamic programming
language. Perl supports both the procedural and Object-Oriented
programming. Perl is a lot similar to C syntactically and is easy for the
users who have knowledge of C, C++. Since Perl is a lot similar to other
widely used languages syntactically, it is easier to code and learn in
Perl.
"
}

perl:main() (
  run zild "$command" "$@"
)

perl:publish() (
  command=release perl:main "$@"
)

perl:version() (
  version perl 'perl --version | tr -d "()"' 10
  version cpanm 4
  version dzil 4
  version zild '(cd /tmp; zild --version)' 1
)
