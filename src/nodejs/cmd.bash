nodejs:meta() {
  language_name="Node.js"
  tag_line="Node.js is a JavaScript runtime"
  language_description="\
Node.js is an open-source, cross-platform, back-end JavaScript runtime
environment that runs on the V8 engine and executes JavaScript code outside
a web browser, which was designed to build scalable network applications.
Node.js lets developers use JavaScript to write command line tools and for
server-side scripting—running scripts server-side to produce dynamic web
page content before the page is sent to the user's web browser.
"
}

nodejs:main() (
  run npm "$command" "$@"
)

nodejs:version() (
  version nodejs 1
  version npm 1
)
