module Number.Format.ToString
( toBinString
, toHexString
, toOctString
) where

import Data.Maybe.Unsafe (fromJust)
import Number.Format (toString)

toBinString :: Number -> String
toBinString = fromJust <<< toString 2

toHexString :: Number -> String
toHexString = fromJust <<< toString 16

toOctString :: Number -> String
toOctString = fromJust <<< toString 8
