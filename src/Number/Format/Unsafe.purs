module Number.Format.Unsafe
( unsafeToExponential
, unsafeToFixed
, unsafeToPrecision
, unsafeToString
) where

import Control.Monad.Eff (Eff ())

foreign import unsafeToExponential """
  function unsafeToExponential(scale) {
    return function (number) {
      return function () {
        return number.toExponential(scale);
      }
    }
  }
""" :: forall eff. Number -> Number -> Eff eff String

foreign import unsafeToFixed """
  function unsafeToFixed(scale) {
    return function (number) {
      return function () {
        return number.toFixed(scale);
      }
    }
  }
""" :: forall eff. Number -> Number -> Eff eff String

foreign import unsafeToPrecision """
  function unsafeToPrecision(prec) {
    return function (number) {
      return function () {
        return number.toPrecision(prec);
      }
    }
  }
""" :: forall eff. Number -> Number -> Eff eff String

foreign import unsafeToString """
  function unsafeToString(radix) {
    return function (number) {
      return function () {
        return number.toString(radix);
      }
    }
  }
""" :: forall eff. Number -> Number -> Eff eff String
