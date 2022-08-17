version:getopt() {
  getopt_spec="\
$app [<$app-opts>] $command <$command-opts>

'$app $command' Options:
--
a,all         Show all language/tool versions
h,help        Get help for $command command
"
}

version:main() (
  if $option_all; then
    for lang in "${langs[@]}"; do
      source "$root/src/$lang/cmd.bash"
      "$lang:meta"
      if func "$lang:version"; then
        echo "${language_name:-$lang}:"
        "$lang:version" || true
        echo
      fi
    done
  else
    print-version
  fi
)
