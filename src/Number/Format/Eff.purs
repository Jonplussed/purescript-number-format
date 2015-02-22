module Number.Format.Eff
( toExponential
, toFixed
, toPrecision
, toString
) where

import Control.Monad.Eff (Eff ())

foreign import toExponential """
  function toExponential(scale) {
    return function (number) {
      return function () {
        return number.toExponential(scale);
      }
    }
  }
""" :: forall eff. Number -> Number -> Eff eff String

foreign import toFixed """
  function toFixed(scale) {
    return function (number) {
      return function () {
        return number.toFixed(scale);
      }
    }
  }
""" :: forall eff. Number -> Number -> Eff eff String

foreign import toPrecision """
  function toPrecision(prec) {
    return function (number) {
      return function () {
        return number.toPrecision(prec);
      }
    }
  }
""" :: forall eff. Number -> Number -> Eff eff String

foreign import toString """
  function toString(radix) {
    return function (number) {
      return function () {
        return number.toString(radix);
      }
    }
  }
""" :: forall eff. Number -> Number -> Eff eff String
