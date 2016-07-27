module Test.Main where

import Test.Unit.Main (runTest)

import Test.Number.Format           as Safe
import Test.Number.Format.Unsafe    as Unsafe
import Test.Number.Format.ToString  as ToString

import Prelude

main = runTest do
  Safe.tests
  Unsafe.tests
  ToString.tests
