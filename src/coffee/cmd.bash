coffee:meta() {
  language_name="CoffeeScript"
  tag_line="A little language that compiles into JavaScript"
  language_description="\
Underneath that awkward Java-esque patina, JavaScript has always had a
gorgeous heart. CoffeeScript is an attempt to expose the good parts of
JavaScript in a simple way.  The golden rule of CoffeeScript is: \"It’s just
JavaScript.\" The code compiles one-to-one into the equivalent JS, and there
is no interpretation at runtime. You can use any existing JavaScript
library seamlessly from CoffeeScript (and vice-versa). The compiled output
is readable, pretty-printed, and tends to run as fast or faster than the
equivalent handwritten JavaScript.
"
}

coffee:main() (
  npm "$@"
)

# shellcheck disable=2088
coffee:version() (
  version coffee '~/node_modules/.bin/coffee --version' 3
  version npm 1
)
