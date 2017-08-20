module Benchmarking where

separateDigits :: Integer -> [Integer]
separateDigits x
  | x `div` 10 == 0 = [x]
  | otherwise       = separateDigits (x `div` 10) ++ [x `mod` 10]

readStr :: String -> [Integer]
readStr = map (\c -> read [c])
-- 1
toDigits :: Integer -> [Integer]
toDigits n = if n <= 0 then [] else digits n
  where digits = readStr . show

doubleEveryOther :: [Int] -> [Int]
doubleEveryOther []       = []
doubleEveryOther (x:[])   = [x]
doubleEveryOther (x:y:zs) = x : (y * 2) : doubleEveryOther zs
doubleEveryOtherReverse :: [Int] -> [Int]
doubleEveryOtherReverse numbers = reverse (doubleEveryOther (reverse numbers))

doubleEveryOther2 :: [Int] -> [Int]
doubleEveryOther2 nums = go nums [] False
  where maybeDouble n d = if d then 2 * n else n
        go :: [Int] -> [Int] -> Bool -> [Int]
        go [] a _    = a
        go ns a d    = go (init ns) (maybeDouble (last ns) d:a) (not d)
