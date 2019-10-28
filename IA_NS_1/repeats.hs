-- Fairly terse translation of repeats.py into Haskell, for easy speed gain
-- while probably even gaining some abstraction, rather than losing it.

import Control.Monad
import Data.List
import Text.Read
import Data.Maybe
import System.Environment

possible_divisors :: [Integer]
-- Explicitly use an Integer literal just so -Wall doesn't complain
possible_divisors = map (^(2 :: Integer))
                        (concat $ transpose [[5,11..], [7,13..]])

check_squares :: Integer -> [Integer]
check_squares n = (filter ((==0) . (mod t)) .
                   takeWhile (<= t)) possible_divisors
        where t = 10^n + 1

main :: IO ()
main = do
    args <- getArgs
    let n = case args of
         []    -> 16
         (s:_) -> fromMaybe 16 $ readMaybe s
    forM_ [1..n] (print . check_squares)
