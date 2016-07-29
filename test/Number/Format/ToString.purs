module Test.Number.Format.ToString (tests) where

import Number.Format.ToString
import Prelude
import Test.Unit
import Test.Unit.Assert

tests :: forall e. TestSuite e
tests = do
  suite "Safe toString formatters" do
    test "Number.Format.ToString.toBinString" do
      assert "toBinString 64" $ toBinString 64.0 == "1000000"
      assert "toBinString 128" $ toBinString 128.0 == "10000000"

    test "Number.Format.ToString.toDecString" do
      assert "toDecString 64" $ toDecString 64.0 == "64"
      assert "toDecString 128" $ toDecString 128.0 == "128"

    test "Number.Format.ToString.toHexString" do
      assert "toHexString 64" $ toHexString 64.0 == "40"
      assert "toHexString 128" $ toHexString 128.0 == "80"

    test "Number.Format.ToString.toOctString" do
      assert "toOctString 64" $ toOctString 64.0 == "100"
      assert "toOctString 128" $ toOctString 128.0 == "200"
