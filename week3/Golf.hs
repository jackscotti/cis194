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
