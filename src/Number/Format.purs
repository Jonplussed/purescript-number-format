module Number.Format
( toExponential
, toFixed
, toPrecision
, toString
) where

import Control.Monad.Eff (Eff (), runPure)
import Control.Monad.Eff.Exception (Exception (), catchException)
import Data.Maybe (Maybe (..))
import Number.Format.Unsafe

toExponential :: Number -> Number -> Maybe String
toExponential scale num = runPure (errorAsNothing $ Just <$> unsafeToExponential scale num)

toFixed :: Number -> Number -> Maybe String
toFixed scale num = runPure (errorAsNothing $ Just <$> unsafeToFixed scale num)

toPrecision :: Number -> Number -> Maybe String
toPrecision prec num = runPure (errorAsNothing $ Just <$> unsafeToPrecision prec num)

toString :: Number -> Number -> Maybe String
toString radix num = runPure (errorAsNothing $ Just <$> unsafeToString radix num)

-- private functions

errorAsNothing :: forall eff a. Eff (err :: Exception | eff) (Maybe a) -> Eff eff (Maybe a)
errorAsNothing = catchException (return <<< const Nothing)
