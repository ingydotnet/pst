list:main() (
  i=1
  for lang in "${langs[@]}"; do
    if $option_quiet; then
      echo "$lang"
    else
      line=
      info=$root/src/$lang/cmd.bash
      if [[ -f $info ]]; then
        source "$info"
        "$lang:meta"
      fi
      printf '%2d) %-12s — %s\n' "$((i++))" "$language_name" "$tag_line"
    fi
  done
)
