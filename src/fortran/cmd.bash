fortran:meta() {
  language_name="Fortran"
  tag_line="High-performance parallel programming language"
  language_description="\
Fortran (formerly FORTRAN) is a general-purpose, compiled imperative
programming language that is especially suited to numeric computation and
scientific computing.
"
}

fortran:main() (
  run fpm "$command" "$@"
)

# shellcheck disable=2088
fortran:version() (
  version gfortran 5
  version fpm '~/miniforge3/bin/fpm --version' 2
)
