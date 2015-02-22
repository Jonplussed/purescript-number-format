module Number.Format.Maybe
( toExponential
, toFixed
, toPrecision
, toString
) where

import Data.Maybe (Maybe (..))

foreign import toExponential """
  function toExponential(scale) {
    return function (number) {
      if (scale >= 0 && scale <= 20) {
        return new Data_Maybe.Just(number.toExponential(scale));
      } else {
        return new Data_Maybe.Nothing();
      }
    }
  }
""" :: Number -> Number -> Maybe String

foreign import toFixed """
  function toFixed(scale) {
    return function (number) {
      if (scale >= 0 && scale <= 20) {
        return new Data_Maybe.Just(number.toFixed(scale));
      } else {
        return new Data_Maybe.Nothing();
      }
    }
  }
""" :: Number -> Number -> Maybe String

foreign import toPrecision """
  function toPrecision(prec) {
    return function (number) {
      if (prec >= 1 && prec <= 21) {
        return new Data_Maybe.Just(number.toPrecision(prec));
      } else {
        return new Data_Maybe.Nothing();
      }
    }
  }
""" :: Number -> Number -> Maybe String

foreign import toString """
  function toString(radix) {
    return function (number) {
      if (radix >= 2 && radix <= 36) {
        return new Data_Maybe.Just(number.toString(radix));
      } else {
        return new Data_Maybe.Nothing();
      }
    }
  }
""" :: Number -> Number -> Maybe String
