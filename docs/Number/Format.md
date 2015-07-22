## Module Number.Format

#### `toExponential`

``` purescript
toExponential :: Int -> Number -> Maybe String
```

Takes a scale and a number. Returns a `Nothing` if the scale is outside of
the range 0-20 or a `Just String` otherwise.

#### `toFixed`

``` purescript
toFixed :: Int -> Number -> Maybe String
```

Takes a scale and a number. Returns a `Nothing` if the scale is outside of
the range 0-20 or a `Just String` otherwise.

#### `toPrecision`

``` purescript
toPrecision :: Int -> Number -> Maybe String
```

Takes a precision and a number. Returns a `Nothing` if the precision is
outside of the range 1-22 or a `Just String` otherwise.

#### `toString`

``` purescript
toString :: Int -> Number -> Maybe String
```

Takes a radix and a number. Returns a `Nothing` if the radix is outside of
the range 2-36 or a `Just String` otherwise.


