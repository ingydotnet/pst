cmds:main() (
  grep -E '^  \w+  ' <<<"$getopt" |
    sort |
    (
      if $option_quiet; then
        cut -d' ' -f3
      else
        cut -c3-
      fi
    )
)
