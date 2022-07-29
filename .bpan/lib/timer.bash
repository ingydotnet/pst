timer-start() {
  TIMER_START=$("${TIMER_COMMAND[@]}")
  TIMER_PREV=$TIMER_START
}

timer-split() {
  local TIME
  TIME=$("${TIMER_COMMAND[@]}")
  [[ ${TIMER_START-} && ${TIMER_PREV-} ]] || {
    echo "timer-split error: timer not started" >&2
    return 1
  }
  local msg=${1:-${BASH_SOURCE[1]} ${BASH_LINENO[0]}}  # TODO set default message to caller
  printf "\e[1;34mTIMER '%s'\n  split=%sms total=%sms\n\e[0m" \
    "$msg" \
    "$(((TIME - TIMER_PREV)/1000000))" \
    "$(((TIME - TIMER_START)/1000000))" \
      >&2
  TIMER_PREV=$TIME
}

if [[ -z ${TIMER_COMMAND-} ]]; then
  TIMER_COMMAND=($(
    cmd=(date '+%s%N')
    date=$("${cmd[@]}" 2>/dev/null)
    if [[ $(wc -c <<<"$date") -eq 20 ]]; then
      echo "${cmd[*]}"
      exit
    fi
    cmd=(gdate '+%s%N')
    date=$("${cmd[@]}" 2>/dev/null)
    if [[ $(wc -c <<<"$date") -eq 20 ]]; then
      echo "${cmd[*]}"
      exit
    fi
    (
      echo "timer.bash can't find a date commamnd that does nanoseconds"
      echo "Set TIMER_COMMAND to something like 'date +%s%N'"
    ) >&2
    exit 1
  )) || return
fi

[[ ${1-} == --no-start ]] || timer-start
