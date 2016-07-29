module Number.Format.ToString
( toBinString
, toDecString
, toHexString
, toOctString
) where

import Data.Maybe
import Number.Format (toString)
import Partial.Unsafe

import Prelude

toBaseXString :: Int -> Number -> String
toBaseXString x = unsafePartial fromJust <<< toString x

toBinString :: Number -> String
toBinString = toBaseXString 2

toDecString :: Number -> String
toDecString = toBaseXString 10

toHexString :: Number -> String
toHexString = toBaseXString 16

toOctString :: Number -> String
toOctString = toBaseXString 8
