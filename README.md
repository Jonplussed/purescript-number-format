# Module Documentation

## Module Number.Format

#### `toExponential`

``` purescript
toExponential :: Number -> Number -> Maybe String
```


#### `toFixed`

``` purescript
toFixed :: Number -> Number -> Maybe String
```


#### `toPrecision`

``` purescript
toPrecision :: Number -> Number -> Maybe String
```


#### `toString`

``` purescript
toString :: Number -> Number -> Maybe String
```



## Module Number.Format.Unsafe

#### `unsafeToExponential`

``` purescript
unsafeToExponential :: forall eff. Number -> Number -> Eff eff String
```


#### `unsafeToFixed`

``` purescript
unsafeToFixed :: forall eff. Number -> Number -> Eff eff String
```


#### `unsafeToPrecision`

``` purescript
unsafeToPrecision :: forall eff. Number -> Number -> Eff eff String
```


#### `unsafeToString`

``` purescript
unsafeToString :: forall eff. Number -> Number -> Eff eff String
```