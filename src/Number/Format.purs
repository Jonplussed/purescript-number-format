module Number.Format
( toExponential
, toFixed
, toPrecision
, toString
) where

foreign import toExponential """
  function toExponential(scale) {
    return function (number) {
      return number.toExponential(scale);
    }
  }
""" :: Number -> Number -> String

foreign import toFixed """
  function toFixed(scale) {
    return function (number) {
      return number.toFixed(scale);
    }
  }
""" :: Number -> Number -> String

foreign import toPrecision """
  function toPrecision(prec) {
    return function (number) {
      return number.toPrecision(prec);
    }
  }
""" :: Number -> Number -> String

foreign import toString """
  function toString(radix) {
    return function (number) {
      return number.toString(radix);
    }
  }
""" :: Number -> Number -> String
