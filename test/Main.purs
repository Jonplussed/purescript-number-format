module Test.Main where

import Test.Unit

import qualified Test.Number.Format           as Safe
import qualified Test.Number.Format.Unsafe    as Unsafe
import qualified Test.Number.Format.ToString  as ToString

main = runTest do
  Safe.tests
  Unsafe.tests
  ToString.tests
