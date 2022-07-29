lua:meta() {
  language_name="Lua"
  tag_line="Moon in Portuguese"
  language_description="\
Lua is a powerful, efficient, lightweight, embeddable scripting language.
It supports procedural programming, object-oriented programming, functional
programming, data-driven programming, and data description.
"
}

lua:main() (
  run luarocks "$command" "$@"
)

lua:version() (
  version lua 'lua -v' 2
  version luarocks 2
)
