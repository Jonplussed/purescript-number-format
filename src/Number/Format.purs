module Number.Format
( toExponential
, toFixed
, toPrecision
, toString
) where

import Control.Monad.Eff (Eff (), runPure)
import Control.Monad.Eff.Exception (EXCEPTION (), catchException)
import Data.Maybe (Maybe (..))

import Number.Format.Unsafe
import Prelude

toExponential :: Int -> Number -> Maybe String
toExponential scale num = runPure (errorAsNothing $ Just <$> unsafeToExponential scale num)

toFixed :: Int -> Number -> Maybe String
toFixed scale num = runPure (errorAsNothing $ Just <$> unsafeToFixed scale num)

toPrecision :: Int -> Number -> Maybe String
toPrecision prec num = runPure (errorAsNothing $ Just <$> unsafeToPrecision prec num)

toString :: Int -> Number -> Maybe String
toString radix num = runPure (errorAsNothing $ Just <$> unsafeToString radix num)

-- private functions

errorAsNothing :: forall eff a. Eff (err :: EXCEPTION | eff) (Maybe a) -> Eff eff (Maybe a)
errorAsNothing = catchException (return <<< const Nothing)
