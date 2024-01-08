PST
===

Package Super Tool — Package Management for All Programming Languages

## Synopsis

```
$ pst --help
usage: pst [<pst-opts>] <cmd> [<cmd-opts>] [<cmd-args>]
   or: pst --help       # This overview
   or: pst help         # Full documentation for pst
   or: pst help <cmd>   # Documentation for a command

    Try:
      $ pst --all version
      $ pst shell

    Project Commands:
      new           Create a new project/package
      build         Build the project
      test          Run the project tests
      run           Run project's main function
      register      Register a new project
      publish       Publish the project package
      repo          Show project repo information
      update        Update template files and deps
      deps          List declared deps
      fetch         Install declared deps
      add           Add a package dep to a project
      rm            Remove a package dependency
      clean         Remove the build files and dirs
      lint          Run linters for project
      fmt           Run code formatters for project
      bench         Run benchmarks
      bump          Bump the project version
      change        Add a changelog entry

    Language Commands:
      list          List all the supported languages
      repl          Start a REPL for the language
      version       Show version(s) of language tools
      info          Get info about a language + tools
      login         Login to language host system
      whoami        Show your user info for host
      lsp           Start LSP server

    Package Commands:
      search        Search for published packages
      install       Install a package
      uninstall     Uninstall a package
      meta          Show meta info for a package
      doc           Show documentation for package
      source        Shell into a package source dir
      url           Show URL(s) for a package
      star          Star a package
      unstar        Unstar a package
      watch         Watch a package
      unwatch       Unwatch a package

    System Commands:
      shell         Start pst shell for package
      exec          Run a shell command on pst server
      config        Configure pst
      system        Show pst system information
      upgrade       Upgrade the pst command
      server        --start, --stop, --status --restart
      prune         Remove various pst artifacts
      init          Print shell init source
      complete      Print shell completion source

    Information Commands:
      help          Get help for a command
      cmds          List available commands

    Command Aliases:
    commands        = cmds
    compile         = build
    look            = source
    release         = publish

    Options:

    -l, --lang ...        Programming language of package
    -a, --all             Apply cmd to all languages
    -f, --force           Force an action
    -r, --root            Run server commands as root
    -R, --restart         Restart server before command

    -v, --verbose         Print more output
    -q, --quiet           Print less output

    -h, --help            Show the command summary
    -V, --version         Display pst version
    -x, --debug           Print lots of debugging info
```

## Description

The `pst` command is a wrapper tool around 38 programming languages and their
package managers.

The current languages are: Ada, Bash, C++, C#, Clojure, CoffeeScript, Common
Lisp, Crystal, D, Dart, Deno, Elixir, Erlang, Fortran, Go, Groovy, Guile,
Haskell, Haxe, Java, Julia, Lua, Nim, Node.js, Objective C, OCaml, Octave,
Perl, PHP, Python, R, Racket, Raku, Ruby, Rust, Scala, Swift, TypeScript.

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

Copyright 2022-2024 by Ingy döt Net

This is free software, licensed under:

The MIT (X11) License
