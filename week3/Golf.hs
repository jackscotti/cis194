module Golf where

  skips :: [a] -> [[a]]
  skips []  = []
  skips [x] = [[x]]
  skips list@(_:_:rest) = [list, takeEverySecondItem list] ++ convertListIntoListOfLists rest

  takeEverySecondItem :: [a] -> [a]
  takeEverySecondItem [] = []
  takeEverySecondItem (_:second:remaining) = second : takeEverySecondItem remaining
  takeEverySecondItem (_:second) = second

  convertListIntoListOfLists :: [a] -> [[a]]
  convertListIntoListOfLists [] = [[]]
  convertListIntoListOfLists list =  map (:[]) list


  localMaxima :: [Integer] -> [Integer]
  localMaxima [] = []
  localMaxima [_] = []
  localMaxima [_,_] = []
  localMaxima [x,y,z] = maxima x y z
  localMaxima (x:y:z:remainder) = maxima x y z ++ localMaxima (y:z:remainder)

  maxima :: Integer -> Integer -> Integer -> [Integer]
  maxima a b c = [b | isMaxima a b c]

  isMaxima :: Integer -> Integer -> Integer -> Bool
  isMaxima x y z = x < y && y > z
