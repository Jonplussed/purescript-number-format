module Test.Number.Format.Unsafe (tests) where

import Control.Monad.Eff
import Control.Monad.Eff.Exception
import Number.Format.Unsafe
import Test.Unit

tests = do
  let n = 1.2345

  test "Number.Format.Unsafe.unsafeToExponential" do
    test "formatting" do
      assertFn "scale of 3" \check -> do
        formatted <- unsafeToExponential 3 n
        check $ formatted == "1.234e+0"
      assertFn "scale of 6" \check -> do
        formatted <- unsafeToExponential 6 12.345
        check $ formatted == "1.234500e+1"
    test "lower scale bound" do
      assertFn "0 doesn't error" $ shouldNotError (unsafeToExponential 0 n)
      assertFn "-1 throws a RangeError" $ shouldError (unsafeToExponential (-1) n)
    test "upper scale bound" do
      assertFn "20 doesn't error" $ shouldNotError (unsafeToExponential 20 n)
      assertFn "21 raises a RangeError" $ shouldError (unsafeToExponential 21 n)

  test "Number.Format.Unsafe.unsafeToFixed" do
    test "formatting" do
      assertFn "scale of 3" \check -> do
        formatted <- unsafeToFixed 3 n
        check $ formatted == "1.234"
      assertFn "scale of 6" \check -> do
        formatted <- unsafeToFixed 6 n
        check $ formatted == "1.234500"
    test "lower scale bound" do
      assertFn "0 doesn't error" $ shouldNotError (unsafeToFixed 0 n)
      assertFn "-1 raises a RangeError" $ shouldError (unsafeToFixed (-1) n)
    test "upper scale bound" do
      assertFn "20 doesn't error" $ shouldNotError (unsafeToFixed 20 n)
      assertFn "21 raises a RangeError" $ shouldError (unsafeToFixed 21 n)

  test "Number.Format.Unsafe.unsafeToPrecision" do
    test "formatting" do
      assertFn "precision of 3" \check -> do
        formatted <- unsafeToPrecision 3 n
        check $ formatted == "1.23"
      assertFn "precision of 4" \check -> do
        formatted <- unsafeToPrecision 4 n
        check $ formatted == "1.234"
    test "lower precision bound" do
      assertFn "1 doesn't error" $ shouldNotError (unsafeToPrecision 1 n)
      assertFn "0 raises a RangeError" $ shouldError (unsafeToPrecision 0 n)
    test "upper precision bound" do
      assertFn "22 doesn't error" $ shouldNotError (unsafeToPrecision 21 n)
      assertFn "22 raises a RangeError" $ shouldError (unsafeToPrecision 22 n)

  test "Number.Format.Unsafe.unsafeToString" do
    test "formatting" do
      assertFn "radix of 10" \check -> do
        formatted <- unsafeToString 10 n
        check $ formatted == "1.2345"
      assertFn "radix of 2" \check -> do
        formatted <- unsafeToString 2 3
        check $ formatted == "11"
    test "lower radix bound" do
      assertFn "2 doesn't error" $ shouldNotError (unsafeToString 2 n)
      assertFn "1 raises a RangeError" $ shouldError (unsafeToString 1 n)
    test "upper radix bound" do
      assertFn "36 doesn't error" $ shouldNotError (unsafeToString 36 n)
      assertFn "37 raises a RangeError" $ shouldError (unsafeToString 37 n)

shouldError :: forall eff a. Eff (err :: Exception | eff) a -> (Boolean -> Eff eff Unit) -> Eff eff Unit
shouldError fn check = do
  didError <- catchException (return <<< const true) (fn >>= return <<< const false)
  check didError

shouldNotError :: forall eff a. Eff (err :: Exception | eff) a -> (Boolean -> Eff eff Unit) -> Eff eff Unit
shouldNotError fn check = do
  didError <- catchException (return <<< const false) (fn >>= return <<< const true)
  check didError
