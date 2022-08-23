haxe:meta() {
  language_name="Haxe"
  tag_line="The Cross-platform Toolkit"
  language_description="\
Haxe is an open source high-level cross-platform programming language and
compiler that can produce applications and source code, for many different
computing platforms from one code-base. It is free and open-source
software, released under the MIT License. The compiler, written in OCaml,
is released under the GNU General Public License (GPL) version 2.
"
}

haxe:main() (
  run haxelib "$command" "$@"
)

# shellcheck disable=2016
haxe:version() (
  version haxe '/usr/local/haxe-4.2.5/haxe --version' 1
  version haxelib 'LD_LIBRARY_PATH=/usr/local/neko-2.3.0-linux64:$LD_LIBRARY_PATH /usr/local/haxe-4.2.5/haxelib' 4
)
