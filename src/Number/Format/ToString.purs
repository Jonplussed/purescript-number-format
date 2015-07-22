module Number.Format.ToString
( toBinString
, toDecString
, toHexString
, toOctString
) where

import Data.Maybe.Unsafe (fromJust)
import Number.Format (toString)

import Prelude

toBinString :: Number -> String
toBinString = fromJust <<< toString 2

toDecString :: Number -> String
toDecString = fromJust <<< toString 10

toHexString :: Number -> String
toHexString = fromJust <<< toString 16

toOctString :: Number -> String
toOctString = fromJust <<< toString 8
