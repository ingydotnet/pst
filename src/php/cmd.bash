php:meta() {
  language_name="PHP"
  tag_line="A popular general-purpose scripting language"
  language_description="\
PHP is a general-purpose scripting language geared toward web development.
It was originally created by Danish-Canadian programmer Rasmus Lerdorf in
1994. The PHP reference implementation is now produced by The PHP Group.
PHP originally stood for Personal Home Page, but it now stands for the
recursive initialism PHP: Hypertext Preprocessor.
"
}

php:main() (
  run composer "$command" "$@"
)

php:version() (
  version php 2
  version composer 'composer --version | cat' 3
)
