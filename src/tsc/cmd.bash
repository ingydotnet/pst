tsc:meta() {
  language_name="TypeScript"
  tag_line="JavaScript with syntax for types"
  language_description="\
TypeScript is a strongly typed programming language that builds on
JavaScript, giving you better tooling at any scale.
"
}

tsc:main() (
  npm "$@"
)

tsc:version() (
  version coffee '~/node_modules/.bin/tsc --version' 2
  version npm 1
)
