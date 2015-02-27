module Number.Format
( toExponential
, toFixed
, toPrecision
, toString
) where

import Control.Monad.Eff (runPure)
import Control.Monad.Eff.Exception (catchException)
import Data.Maybe (Maybe (..))
import Number.Format.Unsafe

toExponential :: Number -> Number -> Maybe String
toExponential scale num = runPure (catchException (return <<< const Nothing) (Just <$> unsafeToExponential scale num))

toFixed :: Number -> Number -> Maybe String
toFixed scale num = runPure (catchException (return <<< const Nothing) (Just <$> unsafeToFixed scale num))

toPrecision :: Number -> Number -> Maybe String
toPrecision prec num = runPure (catchException (return <<< const Nothing) (Just <$> unsafeToPrecision prec num))

toString :: Number -> Number -> Maybe String
toString radix num = runPure (catchException (return <<< const Nothing) (Just <$> unsafeToString radix num))
