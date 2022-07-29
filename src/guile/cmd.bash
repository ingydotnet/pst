guile:meta() {
  language_name="Guile"
  tag_line="Guile is an extension language platform"
  language_description="\
GNU Ubiquitous Intelligent Language for Extensions (GNU Guile) is the
preferred extension language system for the GNU Project and features an
implementation of the programming language Scheme. Its first version was
released in 1993. In addition to large parts of Scheme standards, Guile
Scheme includes modularized extensions for many different programming
tasks.
"
}

guile:main() (
  run guix "$command" "$@"
)

guile:version() (
  version guile 4
  version guix 4
)
