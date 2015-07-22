# purescript-number-format

Functions for displaying numbers as strings in PureScript.

### Implementation

These are basically safety wrappers around JavaScript's various
number-to-string methods that return `Nothing` should the first arguments
result in a `RangeError`.

### Documentation

See the [`Number/Format.purs`][1] for the standard wrapped functions, and
[`Number/Format/ToString.purs`][2] for safe versions of the most common
conversions.

  [1]: /docs/Number/Format.md
  [2]: /docs/Number/Format/ToString.md
