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
  localMaxima [x,y,z] = [y | isMaxima x y z]
  localMaxima (x:y:z:remainder) = do
    let maxima = [y | isMaxima x y z]
    maxima ++ localMaxima (y:z:remainder)


  isMaxima :: Integer -> Integer -> Integer -> Bool
  isMaxima x y z = x < y && y > z
