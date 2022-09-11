cmds:getopt() (
  echo "\
$app <$app-opts> $cmd <$cmd-opts>

'$app $cmd' Options:
--
q,quiet       Print less output
h,help        Get help for $cmd command
"
)

cmds:main() (
  grep -E '^  \w+  ' <<<"$getopt_spec" |
    sort |
    (
      if $option_quiet; then
        cut -d' ' -f3
      else
        cut -c3-
      fi
    )
)
