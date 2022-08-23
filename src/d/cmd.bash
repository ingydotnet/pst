d:meta() {
  language_name="D"
  tag_line="A multi-paradigm system programming language"
  language_description="\
D, also known as dlang, is a multi-paradigm system programming language
created by Walter Bright at Digital Mars and released in 2001. Andrei
Alexandrescu joined the design and development effort in 2007. Though it
originated as a re-engineering of C++, D is a profoundly different language
— features of D can be considered streamlined and expanded-upon ideas from
C++, however D also draws inspiration from other high-level programming
languages, notably Java, Python, Ruby, C#, and Eiffel.
"
}

d:main() (
  run dub "$command" "$@"
)

# shellcheck disable=2088
d:version() (
  version dmd '~/dlang/dmd-2.100.0/linux/bin64/dmd --version' 4
  version dub '~/dlang/dmd-2.100.0/linux/bin64/dub --version' 3
)
