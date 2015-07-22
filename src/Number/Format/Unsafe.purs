module Number.Format.Unsafe
( unsafeToExponential
, unsafeToFixed
, unsafeToPrecision
, unsafeToString
) where

import Control.Monad.Eff (Eff ())

foreign import unsafeToExponential :: forall eff. Int -> Number -> Eff eff String
foreign import unsafeToFixed :: forall eff. Int -> Number -> Eff eff String
foreign import unsafeToPrecision :: forall eff. Int -> Number -> Eff eff String
foreign import unsafeToString :: forall eff. Int -> Number -> Eff eff String
