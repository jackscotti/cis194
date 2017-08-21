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

  footer :: String
  footer = "==========\n0123456789"

  -- buildLine :: [Integer] -> String
  -- buildLine [] _ = "          "
  -- buildLine x:xs

  -- buildLineWithString :: [Integer] -> String -> Integer -> String
  -- buildLineWithString [] row _ = row
  -- buildLineWithString (x:xs) row counter = do
  --   let newChar = if x == counter then '*' else ' '
  --   buildLineWithString xs (row ++ [newChar]) (counter + 1)

  buildLineWithString :: [Integer] -> String -> [Integer] -> String
  buildLineWithString _ row [] = row
  buildLineWithString (x:xs) row (y:ys) = do
    let newChar = if x == y then '*' else ' '
    buildLineWithString xs (row ++ [newChar]) ys
  buildLineWithString [] row (_:ys) = buildLineWithString [] (row ++ " ") ys
