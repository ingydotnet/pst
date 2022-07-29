objc:meta() {
  language_name="Objective C"
  tag_line="Adds Smalltalk-style messaging to C"
  language_description="\
Objective-C is a general-purpose, object-oriented programming language that
adds Smalltalk-style messaging to the C programming language. Originally
developed by Brad Cox and Tom Love in the early 1980s, it was selected by
NeXT for its NeXTSTEP operating system. Objective-C was the standard
programming language supported by Apple for developing macOS (which
descended from NeXTSTEP) and iOS applications using their respective
application programming interfaces (APIs), Cocoa and Cocoa Touch, until the
introduction of Swift in 2014.
"
}

objc:main() (
  run cocoapods "$command" "$@"
)

objc:version() (
  version clang 3
)
