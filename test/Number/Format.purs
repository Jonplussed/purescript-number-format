module Test.Number.Format (tests) where

import Data.Maybe
import Number.Format
import Test.Unit

tests = do
  let n = 1.2345

  test "Number.Format.toExponential" do
    test "formatting" do
      assert "scale of 3" $ toExponential 3 n == Just "1.234e+0"
      assert "scale of 6" $ toExponential 6 12.345 == Just "1.234500e+1"
    test "lower scale bound" do
      assert "0 returns a Just String" $ isJust $ toExponential 0 n
      assert "-1 returns Nothing" $ isNothing $ toExponential (-1) n
    test "upper scale bound" do
      assert "20 returns a Just String" $ isJust $ toExponential 20 n
      assert "21 returns Nothing" $ isNothing $ toExponential 21 n

  test "Number.Format.toFixed" do
    test "formatting" do
      assert "scale of 3" $ toFixed 3 n == Just "1.234"
      assert "scale of 6" $ toFixed 6 n == Just "1.234500"
    test "lower scale bound" do
      assert "0 returns a Just String" $ isJust $ toFixed 0 n
      assert "-1 returns Nothing" $ isNothing $ toFixed (-1) n
    test "upper scale bound" do
      assert "20 returns a Just String" $ isJust $ toFixed 20 n
      assert "21 returns Nothing" $ isNothing $ toFixed 21 n

  test "Number.Format.toPrecision" do
    test "formatting" do
      assert "precision of 3" $ toPrecision 3 n == Just "1.23"
      assert "precision of 4" $ toPrecision 4 n == Just "1.234"
    test "lower precision bound" do
      assert "1 returns a Just String" $ isJust $ toPrecision 1 n
      assert "0 returns Nothing" $ isNothing $ toPrecision 0 n
    test "upper precision bound" do
      assert "22 returns a Just String" $ isJust $ toPrecision 21 n
      assert "22 returns Nothing" $ isNothing $ toPrecision 22 n

  test "Number.Format.toString" do
    test "formatting" do
      assert "radix of 10" $ toString 10 n == Just "1.2345"
      assert "radix of 2" $ toString 2 3 == Just "11"
    test "lower radix bound" do
      assert "2 returns a Just String" $ isJust $ toString 2 n
      assert "1 returns Nothing" $ isNothing $ toString 1 n
    test "upper radix bound" do
      assert "36 returns a Just String" $ isJust $ toString 36 n
      assert "37 returns Nothing" $ isNothing $ toString 37 n
