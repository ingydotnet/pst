denojs:meta() {
  language_name="Deno"
  tag_line="A modern runtime for JavaScript and TypeScript"
  language_description="\
Deno is a simple, modern and secure runtime for JavaScript, TypeScript, and
WebAssembly that uses V8 and is built in Rust.

* Provides web platform functionality and adopts web platform standards.
* Secure by default. No file, network, or environment access, unless explicitly enabled.
* Supports TypeScript out of the box.
* Ships only a single executable file.
"
}

denojs:main() (
  run deno "$command" "$@"
)

# shellcheck disable=2088
denojs:version() (
  version deno '~/.deno/bin/deno --version' 2
  version v8 '~/.deno/bin/deno --version' 6
  version typescript '~/.deno/bin/deno --version' 8

# $ ~/.deno/bin/deno --version
# deno 1.24.1 (release, x86_64-unknown-linux-gnu)
# v8 10.4.132.20
# typescript 4.7.4

)
