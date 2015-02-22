module Test.Number.Format.Eff (tests) where

import Control.Monad.Eff
import Control.Monad.Eff.Exception
import Number.Format.Eff
import Test.Unit

tests = do
  let n = 1.2345

  test "Number.Format.Eff.toExponential" do
    test "formatting" do
      assertFn "scale of 3" \check -> do
        formatted <- toExponential 3 n
        check $ formatted == "1.234e+0"
      assertFn "scale of 6" \check -> do
        formatted <- toExponential 6 12.345
        check $ formatted == "1.234500e+1"
    test "lower scale bound" do
      assertFn "0 doesn't error" $ shouldNotError (toExponential 0 n)
      assertFn "-1 throws a RangeError" $ shouldError (toExponential (-1) n)
    test "upper scale bound" do
      assertFn "20 doesn't error" $ shouldNotError (toExponential 20 n)
      assertFn "21 raises a RangeError" $ shouldError (toExponential 21 n)

  test "Number.Format.Eff.toFixed" do
    test "formatting" do
      assertFn "scale of 3" \check -> do
        formatted <- toFixed 3 n
        check $ formatted == "1.234"
      assertFn "scale of 6" \check -> do
        formatted <- toFixed 6 n
        check $ formatted == "1.234500"
    test "lower scale bound" do
      assertFn "0 doesn't error" $ shouldNotError (toFixed 0 n)
      assertFn "-1 raises a RangeError" $ shouldError (toFixed (-1) n)
    test "upper scale bound" do
      assertFn "20 doesn't error" $ shouldNotError (toFixed 20 n)
      assertFn "21 raises a RangeError" $ shouldError (toFixed 21 n)

  test "Number.Format.Eff.toPrecision" do
    test "formatting" do
      assertFn "precision of 3" \check -> do
        formatted <- toPrecision 3 n
        check $ formatted == "1.23"
      assertFn "precision of 4" \check -> do
        formatted <- toPrecision 4 n
        check $ formatted == "1.234"
    test "lower precision bound" do
      assertFn "1 doesn't error" $ shouldNotError (toPrecision 1 n)
      assertFn "0 raises a RangeError" $ shouldError (toPrecision 0 n)
    test "upper precision bound" do
      assertFn "22 doesn't error" $ shouldNotError (toPrecision 21 n)
      assertFn "22 raises a RangeError" $ shouldError (toPrecision 22 n)

  test "Number.Format.Eff.toString" do
    test "formatting" do
      assertFn "radix of 10" \check -> do
        formatted <- toString 10 n
        check $ formatted == "1.2345"
      assertFn "radix of 2" \check -> do
        formatted <- toString 2 3
        check $ formatted == "11"
    test "lower radix bound" do
      assertFn "2 doesn't error" $ shouldNotError (toString 2 n)
      assertFn "1 raises a RangeError" $ shouldError (toString 1 n)
    test "upper radix bound" do
      assertFn "36 doesn't error" $ shouldNotError (toString 36 n)
      assertFn "37 raises a RangeError" $ shouldError (toString 37 n)

shouldError :: forall eff a. Eff (err :: Exception | eff) a -> (Boolean -> Eff eff Unit) -> Eff eff Unit
shouldError fn check = do
  didError <- catchException (return <<< const true) (fn >>= return <<< const false)
  check didError

shouldNotError :: forall eff a. Eff (err :: Exception | eff) a -> (Boolean -> Eff eff Unit) -> Eff eff Unit
shouldNotError fn check = do
  didError <- catchException (return <<< const false) (fn >>= return <<< const true)
  check didError
