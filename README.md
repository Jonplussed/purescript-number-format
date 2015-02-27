# Module Documentation

## Module Number.Format

#### `toExponential`

``` purescript
toExponential :: Number -> Number -> Maybe String
```
Takes a scale and a number. Returns a `Nothing` if the scale is outside of the
range 0—20 or a `Just String` otherwise.


#### `toFixed`

``` purescript
toFixed :: Number -> Number -> Maybe String
```
Takes a scale and a number. Returns a `Nothing` if the scale is outside of the
range 0—20 or a `Just` otherwise.


#### `toPrecision`

``` purescript
toPrecision :: Number -> Number -> Maybe String
```
Takes a precision and a number. Returns a `Nothing` if the precision is outside
of the range 1—22 or a `Just` otherwise.


#### `toString`

``` purescript
toString :: Number -> Number -> Maybe String
```
Takes a radix and a number. Returns a `Nothing` if the radix is outside of the
range 2—36 or a `Just` otherwise.



## Module Number.Format.Unsafe

#### `unsafeToExponential`

``` purescript
unsafeToExponential :: forall eff. Number -> Number -> Eff eff String
```
Takes a scale and a number. Throws a `RangeError` if the scale is outside of
the range 0—20, which may be caught via [`catchException`][1].


#### `unsafeToFixed`

``` purescript
unsafeToFixed :: forall eff. Number -> Number -> Eff eff String
```
Takes a scale and a number. Throws a `RangeError` if the scale is outside of
the range 0—20, which may be caught via [`catchException`][1].


#### `unsafeToPrecision`

``` purescript
unsafeToPrecision :: forall eff. Number -> Number -> Eff eff String
```
Takes a precision and a number. Throws a `RangeError` if the precision is
outside of the range 1—22, which may be caught via [`catchException`][1].


#### `unsafeToString`

``` purescript
unsafeToString :: forall eff. Number -> Number -> Eff eff String
```
Takes a radix and a number. Throws a `RangeError` if the radix is outside of
the range 2—36, which may be caught via [`catchException`][1].



  [1]: https://github.com/purescript/purescript-exceptions
