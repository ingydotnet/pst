r:meta() {
  language_name="R"
  tag_line="The R Project for Statistical Computing"
  language_description="\
R is a programming language for statistical computing and graphics
supported by the R Core Team and the R Foundation for Statistical
Computing. Created by statisticians Ross Ihaka and Robert Gentleman, R is
used among data miners, bioinformaticians and statisticians for data
analysis and developing statistical software. Users have created packages
to augment the functions of the R language.
"
}

r:main() (
  run cran "$command" "$@"
)

r:version() (
  version R 3
)
