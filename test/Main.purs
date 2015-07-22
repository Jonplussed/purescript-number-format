module Test.Main where

import Test.Unit (runTest)

import qualified Test.Number.Format           as Safe
import qualified Test.Number.Format.Unsafe    as Unsafe
import qualified Test.Number.Format.ToString  as ToString

import Prelude

main = runTest do
  Safe.tests
  Unsafe.tests
  ToString.tests
