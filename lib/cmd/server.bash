getopt__server="\
$app [<$app-opts>] server <options>

Options:
--
s,start     Start $App Docker server
k,stop      Stop $App Docker server
R,restart   Restart $App Docker server
S,status    Get $App Docker server status

h,help      Get help for server command
"
server_opts=(start stop restart status)

server:main() (
  server:get-options "$@"
  set -- "${args[@]}"

  "server:$server_cmd" "$@"
)

server:start() (
  $option_all &&
    die "Option --all doesn't make sense for --server=start"

  if grep -q "^$base"$'\t' "$docker_servers"; then
    echo-r "A $App docker server is already running for '$base'"
    return
  fi

  id=$(
    $option_verbose && set -x
    docker run -d --rm \
      "${docker_args[@]}" \
      --hostname $app \
      --volume "$base":/host \
      --volume "$root":/$app \
      --volume "$HOME/.$app":/me \
      --volume "$bashrc:/home/user/.$app-bashrc" \
      --volume "$bash_history":/home/user/.bash_history \
      "$docker_image" \
      sleep infinity
  )

  id=${id:0:12}

  name=$(docker ps | grep -m1 "^$id ") || die
  name=${name##*\ }

  printf "%s\t%s\t%s\n" "$base" "$id" "$name" >> "$docker_servers"

  echo-y "Started $App Docker server for '$base' ($id)"
)

server:restart() (
  server:stop
  sleep 0.5
  server:start
)

server:stop() (
  get-servers-list "$@" || return 0

  for server in "${servers[@]}"; do
    read dir id name <<<"$server"
    id=$(
      $option_verbose && set -x
      docker kill "$id"
    )
    delete-server-entry "$dir"
    echo-y "Stopped $App Docker server for '$dir' ($id)"
  done
)

server:status() (
  get-servers-list "$@" || return 0

  for server in "${servers[@]}"; do
    read dir id name <<<"$server"
    echo-e "* ${G}A $App Docker server is running for directory '$base'"
    echo-y "    Docker container id '$id' ($name)"
  done
)

get-servers-list() {
  servers=()

  if [[ $# -gt 0 ]]; then
    servers=("$#")
    return 0
  fi

  local server
  local find=^$base$'\t'
  $option_all && find=.

  while read -r server; do
    servers+=("$server")
  done < <(
    grep "^$base"$'\t' "$docker_servers" || true
  )

  set -- "${servers[@]}"

  if [[ $# -eq 0 ]]; then
    if $option_all; then
      echo-r "No $App Docker servers are running at all"
    else
      echo-r "No $App Docker server is running for directory '$base'"
    fi
    return 1
  fi

  for server in "${servers[@]}"; do
    read dir id name <<<"$server"
    docker ps | grep -q "^$id " || {
      echo-r "Removing server entry that isn't actually running now:"
      echo-y "  >> $server"
      delete-server-entry "$base"
    }
  done
}

delete-server-entry() (
  dir=$1
  file=$(mktemp)
  grep -v "^$dir"$'\t' "$docker_servers" > "$file" || true
  mv "$file" "$docker_servers"
)

server:get-options() {
  local getopt_default_help=true getopt_args='@args'

  getopt "$@" <<<"$getopt__server"

  local opt
  for opt in "${server_opts[@]}"; do
    local var=option_$opt
    if "${!var}"; then
      server_cmd=$opt
    fi
  done

  [[ ${server_cmd-} ]] ||
    die "Option required for '$app server ...' command"
}
