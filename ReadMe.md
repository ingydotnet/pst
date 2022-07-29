PST
===

Package Super Tool — Package Management for All Programming Languages

## Synopsis

```
usage: pst [<options>] <cmd> [<cmd-opts...>] [<cmd-args>]

    Commands:

    help          Get help for a command
    cmds          List available commands
    list          List all the supported languages
    info          Get info about a language/env
    version       Show version(s) of language tools

    new           Create a new package
    repl          Start a REPL for the language
    shell         Start pst shell for package
    build         Build the package
    test          Test the package
    publish       Publish the package
    search        Search for published packages
    clean         Remove the build files and dirs

    run           Run a shell command on pst server
    server        --start, --stop, --status --restart

    Options:

    -l, --lang ...        Programming language of package
    -a, --all             Apply cmd to all languages
    -r, --root            Run server commands as root
    -R, --restart         Restart server before command

    -v, --verbose         Print more output
    -q, --quiet           Print less output

    -h, --help            Show the command summary
    -V, --version         Display pst version
    -x, --debug           Print lots of debugging info
```

## Description

The `pst` command is a wrapper tool around 35 programming languages and their
package managers.

The current languages are: Ada, Bash, Common Lisp, Clojure, C++, Crystal, C#,
D, Dart, Deno, Elixir, Fortran, Go, Groovy, Guile, Haskell, Haxe, Java, Julia,
Lua, Nim, Node.js, Objective C, OCaml, Octave, Perl, PHP, Python, R, Racket,
Raku, Ruby, Rust, Scala and Swift.

The `pst` command provides a consistent API that uses the same basic commands,
regardless of the target language.

It provides a working environment to explore, code, test and publish software
in any of the languages, or many of them at the same time.

## Installation

Installing PST is extremely simple:

```
# Clone the PST Git repository:
git clone git@github.com:ingydotnet/pst /path/to/pst

# Run this command and/or add it to your shell rc file:
source /path/to/pst/.rc

# Start using PST:
pst --help
```

### Prerequisites

PST uses Docker to package all the languages (their compilers, runtimes,
tools, etc)  so that you don't need to install anything except these ubiquitous
tools that you very likely have installed on your computer already:

* Docker
* Bash
* Git

## Authors

* Ingy döt Net <ingy@ingy.net>

## Copyright and License

Copyright 2022 by Ingy döt Net

This is free software, licensed under:

The MIT (X11) License
