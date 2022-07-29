cpp:meta() {
  language_name="C++"
  tag_line="C with Classes"
  language_description="\
C++ is a general-purpose programming language created by Danish computer
scientist Bjarne Stroustrup as an extension of the C programming language.
"
}

cpp:main() (
  run conan "$command" "$@"
)

cpp:version() (
  version gcc 4
  version g++ 4
  version conan 'conan --version | cat' 3
)
