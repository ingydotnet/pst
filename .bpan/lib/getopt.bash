# getopt-long library based around `git rev-parse --parseopt`

getopt() {
  [[ ${getopt_spec-} ]] ||
    getopt_spec=$(cat)

  [[ $getopt_spec ]] ||
    getopt:error "No getopt 'spec' provided"

  local spec_parseopt=''
  local spec_required=()
  local spec_database=''

  getopt:parse-spec "$getopt_spec"

  [[ $# -gt 0 ]] ||
    set -- "${getopt_default[@]}"

  local output
  output=$(
    echo "$spec_parseopt" |
      git rev-parse --parseopt --stuck-long -- "$@"
  ) || true

  if [[ $output =~ ^cat ]]; then
    eval "$output" | getopt:pager
    exit 0
  else
    eval "$output"
  fi

  getopt:set-opts "$@"
}

getopt:reset() {
  getopt_default=()
  getopt_prefix=option_
  getopt_args=args
}

getopt:source() {
  if [[ $# -eq 0 ]]; then
    getopt:error "Use '--' (source getopt.bash --) if no args for source."
  fi
  getopt:reset
  for arg; do
    if [[ $arg == -- ]]; then
      break
    elif [[ $arg == *$'\n--\n'* ]]; then
      getopt_spec=$arg
    else
      getopt:error "Invalid source arg '$arg'. Use '--' if no args."
    fi
  done
}

# Read through the provided 'getopt_spec' to collect the various instructions.
# Save all the instructions in a structured format in 'spec_database'.
# Create a new spec 'spec_parseopt' that is compliant with rev-parse's needs.
getopt:parse-spec() {
  local option_section=false
  local top=true
  local var count

  while IFS=$'\n' read -r line; do
    # Look for getopt config variables at top of spec:
    if $top; then
      if [[ $line == getopt_* ]]; then
        eval "$line"
        continue
      elif [[ $line == '' ]]; then
        top=false
        continue
      else
        top=false
      fi
    fi

    # Check for start of options section:
    if ! $option_section; then
      if [[ $line == -- ]]; then
        option_section=true
      fi
      spec_parseopt+=$line$'\n'
      continue
    fi

    # Change an empty line to ' ' so it will appear in error messages:
    if [[ $line == '' ]]; then
      spec_parseopt+=$' \n'
      continue
    fi

    # if 's,long...' (short,long)
    if [[ $line =~ ^([a-zA-Z0-9]),([a-z][-a-z0-9]+)([=?][^\ ]*)?\  ]]; then
      short=${BASH_REMATCH[1]}
      long=${BASH_REMATCH[2]}
      kind=${BASH_REMATCH[3]:0:1}
      flag=${BASH_REMATCH[3]:1}
      name=$long

    # if 's...' (short only)
    elif [[ $line =~ ^([a-zA-Z0-9])([=?][^\ ]*)?\  ]]; then
      short=${BASH_REMATCH[1]}
      long=''
      kind=${BASH_REMATCH[2]}
      flag=${BASH_REMATCH[2]:1}
      name=$short

    # if 'long...' (long only)
    elif [[ $line =~ ^([a-z][-a-z0-9]+)([=?][^\ ]*)?\  ]]; then
      short=''
      long=${BASH_REMATCH[1]}
      kind=${BASH_REMATCH[2]}
      flag=${BASH_REMATCH[2]:1}
      name=$long

    else
      getopt:error "Bad line in getopt spec '$line'"
    fi

    var=$getopt_prefix${long:-$short}
    count=${getopt_prefix}count_${long:-$short}

    printf -v "$count" 0

    if [[ $kind == '='* ]]; then
      kind=value
      declare -a "$var"
    elif [[ $kind == '?'* ]]; then
      kind=dual
      printf -v "$var" false
    else
      kind=bool
      if [[ ${!var-} != true ]]; then
        printf -v "$var" false
      fi
    fi

    type='' mult=false

    orig=flag
    while [[ $flag ]]; do
      if [[ ${flag:0:1} == '+' ]]; then
        spec_required+=("$name")
        flag=${flag:1}
        line=${line/+/}
      elif [[ ${flag:0:1} == '@' ]] && ! $mult; then
        mult=true
        flag=${flag:1}
        line=${line/@/}
      elif [[ $flag =~ ^(str|num|file|dir|path) ]]; then
        type=${BASH_REMATCH[1]}
        flag=${flag:${#type}}
        line=${line/$type\ /\ }
      else
        getopt:error "Can't parse getopt flags '$orig' at '$flag'"
        flag=''
        exit 1
      fi
    done

    spec_parseopt+=$line$'\n'

    spec_database+="$name ${short:-_} ${long:=_} $kind ${type:-_} $mult"$'\n'
  done <<<"$1"
}

getopt:set-opts() {
  local option name var
  local need=" ${spec_required[*]}"
  local _name short long kind type mult

  option-vars() {
    name=${1#-}
    name=${name#-}
    unset value
    if [[ $name == *=* ]]; then
      value=${name#*=}
      name=${name%%=*}
    fi
    spec=$(grep "^$name " <<<"$spec_database") ||
      die "Can't grep '^$name ' in:" "$spec_database"
    read -r _name short long kind type mult <<<"$spec"
    long=${long#_}
    short=${short#_}
    show=${long:+"--$long=…"}
    show=${show:-"-$short …"}
  }

  while [[ $# -gt 0 ]]; do
    option=$1; shift

    if [[ $option == -- ]]; then
      if [[ ${need##\ } ]]; then
        for option in $need; do
          option-vars "$option"
          echo "* Option '$show' is required" >&2
        done
        getopt:error 'Missing required options'
      fi

      args=("$@")
      return
    fi

    option-vars "$option"

    need=${need/\ $name/}

    var=$getopt_prefix${long:-$short}
    count=${getopt_prefix}count_${long:-$short}

    # Set bool option variable to 'true':
    if [[ $kind == bool ]]; then
      printf -v "$var" true

    # Push value onto option array:
    elif [[ $kind == value ]]; then
      IFS=$'\n' read -r -d '' "${var}[${!count}]" <<<"$value" || true

    elif [[ $kind == dual ]]; then
      if [[ ${value-} ]]; then
        if [[ ${!var} == false ]]; then
          printf -v "$var" '%s' "$value"
        fi
      else
        printf -v "$var" true
      fi
    fi

    # Increment option_count_<name>
    # shellcheck disable=2004
    : $(( ${count} = ${!count} + 1 ))
  done

  [[ $# -eq 0 ]] ||
    getopt:error "Unexpected arguments: '$*'"
}

getopt:error() {
  die "[getopt] Error: $1"
}

getopt:pager() {
  less -FRX
}

[[ $0 == "${BASH_SOURCE[0]}" ]] ||
  getopt:source "$@"
