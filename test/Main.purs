module Test.Main where

import Test.Unit

import qualified Test.Number.Format.Eff    as Eff
import qualified Test.Number.Format.Maybe  as Maybe

main = runTest do
  Eff.tests
  Maybe.tests
