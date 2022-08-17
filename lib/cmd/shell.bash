shell:getopt() {
  getopt_spec="\
$app [<$app-opts>] $command <$command-opts>

Use ${APP}_SHELL to set default

Note: ash = dash, csh = tcsh

'$app $command' Options:
--
b,bash        Start 'bash' shell
d,dash        Start 'dash' shell
f,fish        Start 'fish' shell
k,ksh         Start 'ksh'  shell
t,tcsh        Start 'tcsh' shell
z,zsh         Start 'zsh'  shell

v,versions    Print shell versions
h,help        Get help for $command command
"
}

shell:main() (
  if $option_versions; then
    shell:versions
    return
  fi

  var=${APP}_SHELL
  if [[ ${!var-} ]]; then
    shell:runner "${!var}"
    return
  fi

  for shell in $(shell:shells); do
    opt=option_$shell
    if ${!opt}; then
      shell:runner "$shell"
    return
    fi
  done

  shell:runner bash
)

shell:runner() (
  shell=$1
  run sh -c "run-parts /etc/update-motd.d/ && exec $shell"
)

shell:versions() (
  for shell in $(shell:shells); do
    echo-y "$shell --version"
    if [[ $shell == dash ]]; then
      echo Unavailable
    else
      run "$shell" --version | head -n1 || true
    fi
    echo
  done
)

shell:shells() (
  shell:getopt
  while IFS=', ' read -r x shell rest; do
    echo "$shell"
  done < <(
    grep 'shell$' <<<"$getopt_spec"
  )
)
