-- Fairly terse translation of repeats.py into Haskell, for easy speed gain
-- while probably even gaining some abstraction, rather than losing it.

import Control.Monad
import Data.List

possible_divisors :: [Integer]
possible_divisors = map (^2) (2:3:(concat $ transpose [[5,11..], [7,13..]]))

check_squares :: Integer -> [Integer]
check_squares n = (filter ((==0) . (mod t)) .
                   takeWhile (<= t)) possible_divisors
                  where t = 10^n + 1

main :: IO ()
main = do
    forM_ [1..16] (print . check_squares)