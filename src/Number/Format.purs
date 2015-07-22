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


-- | Takes a scale and a number. Returns a `Nothing` if the scale is outside of
-- | the range 0-20 or a `Just String` otherwise.
toExponential :: Int -> Number -> Maybe String
toExponential scale num = runPure (errorAsNothing $ Just <$> unsafeToExponential scale num)

-- | Takes a scale and a number. Returns a `Nothing` if the scale is outside of
-- | the range 0-20 or a `Just String` otherwise.
toFixed :: Int -> Number -> Maybe String
toFixed scale num = runPure (errorAsNothing $ Just <$> unsafeToFixed scale num)

-- | Takes a precision and a number. Returns a `Nothing` if the precision is
-- | outside of the range 1-22 or a `Just String` otherwise.
toPrecision :: Int -> Number -> Maybe String
toPrecision prec num = runPure (errorAsNothing $ Just <$> unsafeToPrecision prec num)

-- | Takes a radix and a number. Returns a `Nothing` if the radix is outside of
-- | the range 2-36 or a `Just String` otherwise.
toString :: Int -> Number -> Maybe String
toString radix num = runPure (errorAsNothing $ Just <$> unsafeToString radix num)

-- private functions

errorAsNothing :: forall eff a. Eff (err :: EXCEPTION | eff) (Maybe a) -> Eff eff (Maybe a)
errorAsNothing = catchException (return <<< const Nothing)
