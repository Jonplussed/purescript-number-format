module Test.Main where

import Test.Unit

import qualified Test.Number.Format         as Safe
import qualified Test.Number.Format.Unsafe  as Unsafe

main = runTest do
  Safe.tests
  Unsafe.tests
