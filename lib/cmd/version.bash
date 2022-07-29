version:main() (
  print-version
)

version:all() (
  for lang in "${langs[@]}"; do
    source "$root/src/$lang/cmd.bash"
    "$lang:meta"
    if func "$lang:version"; then
      echo "${language_name:-$lang}:"
      "$lang:version" || true
      echo
    fi
  done
)
