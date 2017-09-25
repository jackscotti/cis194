module Funcs where

  fun2 :: Integer -> Integer
  fun2 1 = 0
  fun2 n | even n = n + fun2 (n `div` 2)
         | otherwise = fun2 (3 * n + 1)


  oddOp f n = fun2 (3 * n + 1)
  evenOp f n = n + fun2 (n `div` 2)


  --
  -- func2 :: Integer -> Integer
  -- func2 1 = 0
  -- func2 n | even n = evenOp func2 n
  --         | otherwise = oddOp func2 n

  -- funct2 :: Integer -> Integer
  -- funct2 1 = 0
  -- funct2 n | even n = evenOp func2 n
  --          | otherwise = oddOp func2 n
  --
  evenOrOdd number | number == 1 = 0
  evenOrOdd number | even number = evenOp number
  evenOrOdd number | otherwise = oddOp number
