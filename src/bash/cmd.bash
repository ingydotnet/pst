bash:meta() {
  language_name="Bash"
  tag_line="Bourne Again SHell"
  language_description="\
Bash is the GNU Project's shell—the Bourne Again SHell. This is an
sh-compatible shell that incorporates useful features from the Korn shell
(ksh) and the C shell (csh). It is intended to conform to the IEEE POSIX
P1003.2/ISO 9945.2 Shell and Tools standard. It offers functional
improvements over sh for both programming and interactive use. In addition,
most sh scripts can be run by Bash without modification.
"
}

bash:main() (
  run bpan "$command" "$@"
)

bash:version() (
  version bash 4
  version bpan 2
)
