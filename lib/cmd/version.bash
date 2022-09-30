version:getopt() (
  echo "\
$app [<$app-opts>] $cmd <$cmd-opts>

'$app $cmd' Options:
--
a,all         Show all language/tool versions
h,help        Get help for $cmd command
"
)

version:main() (
  if $option_all; then
    docker_version=$(
      docker --version |
        cut -d, -f1 |
        cut -d ' ' -f3
    )
    bash_version=${BASH_VERSION%-*}

    echo PST:
    printf '  %-12s %s\n' pst: "$(pst --version)"
    printf '  %-12s %s\n' bash: "$bash_version"
    printf '  %-12s %s\n' docker: "$docker_version"
    echo

    for lang in "${langs[@]}"; do
      version:lang "$lang"
    done

  elif [[ ${option_lang-} ]]; then
    get-lang
    version:lang "$option_lang"

  else
    print-version
  fi
)

version:lang() (
  lang=$1
  source "$root/src/$lang/cmd.bash"
  "$lang:meta"
  if func "$lang:version"; then
    echo "${language_name:-$lang}:"
    "$lang:version" || true
    echo
  fi
)
