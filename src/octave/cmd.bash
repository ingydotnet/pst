octave:meta() {
  language_name="Octave"
  tag_line="Scientific Programming Language"
  language_description="\
GNU Octave is a high-level programming language primarily intended for
scientific computing and numerical computation. Octave helps in solving
linear and nonlinear problems numerically, and for performing other
numerical experiments using a language that is mostly compatible with
MATLAB. It may also be used as a batch-oriented language. As part of the
GNU Project, it is free software under the terms of the GNU General Public
License.
"
}

octave:main() (
  run pkg "$command" "$@"
)

octave:version() (
  version octave 'octave --version |& grep "^GNU Octave"' 4
)
