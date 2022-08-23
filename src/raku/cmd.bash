raku:meta() {
  language_name="Raku"
  tag_line="Requires you know how to be nice to all kinds of people"
  language_description="\
Raku is a member of the Perl family of programming languages. Formerly
known as Perl 6, it was renamed in October 2019. Raku introduces elements
of many modern and historical languages. Compatibility with Perl was not a
goal, though a compatibility mode is part of the specification. The design
process for Raku began in 2000.
"
}

raku:main() (
  run zef "$command" "$@"
)

raku:clean() (
  rm -fr ./lib/.precomp ./target
)

raku:version() (
  version raku '/opt/rakudo-pkg/bin/raku --version | sed '"'"'s/\.$//'"'"'' 4
  # shellcheck disable=2016
  version zef 'PATH=/opt/rakudo-pkg/bin:$PATH; /root/.raku/bin/zef --version' 1
)
