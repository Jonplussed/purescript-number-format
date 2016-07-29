module Test.Number.Format.Unsafe (tests) where

import Control.Monad.Eff
import Control.Monad.Eff.Exception
import Number.Format.Unsafe
import Prelude
import Test.Unit
import Test.Unit.Assert

tests :: forall e. TestSuite e
tests = do
  let n = 1.2345

  suite "Number.Format.Unsafe.unsafeToExponential" do
    test "formatting" do
      assert "scale of 3" $ runPure (unsafeToExponential 3 n) ==  "1.234e+0"
      assert "scale of 6" $ runPure (unsafeToExponential 6 12.345) == "1.234500e+1"

    test "lower scale bound" do
      assert "0 doesn't error" $ runPure $ shouldNotError (unsafeToExponential 0 n)
      assert "-1 throws a RangeError" $ runPure $ shouldError (unsafeToExponential (-1) n)
    test "upper scale bound" do
      assert "20 doesn't error" $ runPure $ shouldNotError (unsafeToExponential 20 n)
      assert "21 raises a RangeError" $ runPure $ shouldError (unsafeToExponential 21 n)

  suite "Number.Format.Unsafe.unsafeToFixed" do
    test "formatting" do
      assert "scale of 3" $ runPure (unsafeToFixed 3 n) == "1.234"
      assert "scale of 6" $ runPure (unsafeToFixed 6 n) == "1.234500"
    test "lower scale bound" do
      assert "0 doesn't error" $ runPure $ shouldNotError (unsafeToFixed 0 n)
      assert "-1 raises a RangeError" $ runPure $ shouldError (unsafeToFixed (-1) n)
    test "upper scale bound" do
      assert "20 doesn't error" $ runPure $ shouldNotError (unsafeToFixed 20 n)
      assert "21 raises a RangeError" $ runPure $ shouldError (unsafeToFixed 21 n)

  suite "Number.Format.Unsafe.unsafeToPrecision" do
    test "formatting" do
      assert "precision of 3" $ runPure (unsafeToPrecision 3 n) == "1.23"
      assert "precision of 4" $ runPure (unsafeToPrecision 4 n) == "1.234"
    test "lower precision bound" do
      assert "1 doesn't error" $ runPure $ shouldNotError (unsafeToPrecision 1 n)
      assert "0 raises a RangeError" $ runPure $ shouldError (unsafeToPrecision 0 n)
    test "upper precision bound" do
      assert "22 doesn't error" $ runPure $ shouldNotError (unsafeToPrecision 21 n)
      assert "22 raises a RangeError" $ runPure $ shouldError (unsafeToPrecision 22 n)

  suite "Number.Format.Unsafe.unsafeToString" do
    test "formatting" do
      assert "radix of 10" $ runPure (unsafeToString 10 n) == "1.2345"
      assert "radix of 2" $ runPure (unsafeToString 2 3.0) == "11"
    test "lower radix bound" do
      assert "2 doesn't error" $ runPure $ shouldNotError (unsafeToString 2 n)
      assert "1 raises a RangeError" $ runPure $ shouldError (unsafeToString 1 n)
    test "upper radix bound" do
      assert "36 doesn't error" $ runPure $ shouldNotError (unsafeToString 36 n)
      assert "37 raises a RangeError" $ runPure $ shouldError (unsafeToString 37 n)

shouldError :: forall eff a. Eff (err :: EXCEPTION | eff) a -> Eff eff Boolean
shouldError fn = do
  catchException (pure <<< const true) (fn >>= pure <<< const false)

shouldNotError :: forall eff a. Eff (err :: EXCEPTION | eff) a -> Eff eff Boolean
shouldNotError fn = do
  catchException (pure <<< const false) (fn >>= pure <<< const true)
