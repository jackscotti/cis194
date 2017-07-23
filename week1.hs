numbers :: [Integer]
numbers = [1,2,3,4,5,6,70,8]

-- • Double the value of every second digit beginning from the right.
-- That is, the last digit is unchanged; the second-to-last digit is doubled;
-- the third-to-last digit is unchanged; and so on. For example,
-- [1,3,8,6] becomes [2,3,16,6].

-- Double every other Integer in a list
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther []       = []
doubleEveryOther (x:[])   = [x]
doubleEveryOther (x:y:zs) = x : (y * 2) : doubleEveryOther zs
doubleEveryOtherReverse :: [Integer] -> [Integer]
doubleEveryOtherReverse numbers = reverse (doubleEveryOther (reverse numbers))

-- • Add the digits of the doubled values and the undoubled digits
-- from the original number. For example, [2,3,16,6] becomes
-- 2+3+1+6+6 = 18

separateDigits :: Integer -> [Integer]
separateDigits x
  | x `div` 10 == 0 = [x]
  | otherwise       = separateDigits (x `div` 10) ++ [x `mod` 10]

separateDigitsInList :: [Integer]
separateDigitsInList = (concat (map separateDigits (doubleEveryOtherReverse numbers)))

main =
  -- print (doubleEveryOtherReverse numbers)
  print separateDigitsInList
