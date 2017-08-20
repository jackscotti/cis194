-- http://www.seas.upenn.edu/~cis194/spring13/hw/01-intro.pdf
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

separateDigitsInList :: [Integer] -> [Integer]
separateDigitsInList numbers = (concat (map separateDigits (doubleEveryOtherReverse numbers)))

-- • Calculate the remainder when the sum is divided by 10
remainder :: [Integer] -> Integer
remainder numbers = (sum numbers) `mod` 10

isRemainderValid :: Integer -> Bool
isRemainderValid n
  | n == 0    = True
  | otherwise = False

isCreditCardNumberValid :: Integer -> Bool
isCreditCardNumberValid numbers =
  isRemainderValid $
  remainder $
  separateDigitsInList $
  doubleEveryOther $
  separateDigits numbers

main :: IO()
main =
  print (isCreditCardNumberValid 4012888888881882)
