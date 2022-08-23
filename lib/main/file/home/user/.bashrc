source /etc/profile.d/bash_completion.sh

[[ $PST_SET_X ]] && set -x

{
  ps1=$PS1

  source "$HOME/.bpan/.rc"

  source "$HOME/dlang/dmd-2.100.0/activate"

  source "$HOME/.cargo/env"

  source <(~/miniforge3/bin/conda shell.bash hook)

  source ~/.opam/opam-init/init.sh &> /dev/null
  source <(opam env 2>/dev/null)

  PS1=$ps1

  unset ps1
}

{
  path=(
    ~/.deno/bin
    /usr/local/go/bin
    ~/.config/guix/current/bin
    /usr/local/haxe-4.2.5
    /usr/local/neko-2.3.0-linux64
    ~/.nimble/bin
    ~/node_modules/.bin
    /opt/rakudo-pkg/bin
    /opt/rakudo-pkg/share/perl6/site/bin
    ~/.raku/bin
    ~/.local/share/coursier/bin
    /opt/rakudo-pkg/bin
  )
  export PATH=$(printf '%s:' "${path[@]}")$PATH
  unset path
}

{
  export DENO_INSTALL=~/.deno
  export NEKOPATH=/usr/local/neko-2.3.0-linux64
  export HAXE_STD_PATH=/usr/local/haxe-4.2.5/std
  export LD_LIBRARY_PATH=/usr/local/neko-2.3.0-linux64:$LD_LIBRARY_PATH

  export LANG=en_US.UTF-8
  export LANGUAGE=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
}

[[ -f /me/bashrc ]] &&
  source /me/bashrc

set +x
