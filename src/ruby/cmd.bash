ruby:meta() {
  language_name="Ruby"
  tag_line="A Programmer's Best Friend"
  language_description="\
A dynamic, open source programming language with a focus on simplicity and
productivity. It has an elegant syntax that is natural to read and easy to
write.
"
}

ruby:run() (
  if [[ -e Gemfile ]]; then
    bundle exec "$@"
  else
    "$@"
  fi
)

ruby:main() (
  ruby:run gem "$@"
)

ruby:repl() (
  ruby:run pry "$@"
)

ruby:publish() (
  ruby:set-credentials
  ruby:run rake release "$@"
)

ruby:clean() (
  ruby:run rake clean "$@"
  rm -f Gemfile.lock
  rm -fr pkg
)

ruby:set-credentials() (
  get-config apitoken

  file=gem-credentials

  (
    cat <<...
---
:rubygems_api_key: $APITOKEN
:status: :ok
...
  ) > "$tmp/$file"

  chmod 0600 "$tmp/$file"

  run mkdir -p '~/.gem'
  run mv "/me/tmp/$file" '~/.gem/credentials'
)

ruby:version() (
  version ruby 2
  version gem 1
)
