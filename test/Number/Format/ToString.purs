module Test.Number.Format.ToString (tests) where

import Number.Format.ToString
import Test.Unit

tests = do

  test "Safe toString formatters" do
    test "Number.Format.ToString.toBinString" do
      assert "toBinString 64" $ toBinString 64 == "1000000"
      assert "toBinString 128" $ toBinString 128 == "10000000"

    test "Number.Format.ToString.toHexString" do
      assert "toHexString 64" $ toHexString 64 == "40"
      assert "toHexString 128" $ toHexString 128 == "80"

    test "Number.Format.ToString.toOctString" do
      assert "toOctString 64" $ toOctString 64 == "100"
      assert "toOctString 128" $ toOctString 128 == "200"
