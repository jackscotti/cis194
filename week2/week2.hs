module DataTypes where

  data Thing = Shoe
             | Ship
             | SealingWax
             | Cabbage
             | King
    deriving Show

  shoe :: Thing
  shoe = Shoe

  listOfThings :: [Thing]
  listOfThings = [Shoe, SealingWax, King, Cabbage, King]

  isSmall :: Thing -> Bool
  isSmall Shoe = True
  isSmall SealingWax = True
  isSmall Ship = False
  isSmall _ = False

  data FailableDouble = Failure
                    | OK Double
                    deriving Show

  safeDiv :: Double -> Double -> FailableDouble
  safeDiv _ 0 = Failure
  safeDiv x y = OK (x / y)

  failureToZero :: FailableDouble -> Double
  failureToZero Failure = 0
  failureToZero (OK d)  = d

  data Person = Person String Int Thing
    deriving Show

  getAge :: Person -> Int
  getAge (Person _ a _) = a

  baz :: Person -> String
  baz p@(Person n _ _) = "The name field of (" ++ show p ++ ") is " ++ n

  foo :: Person -> String
  foo p@(Person _ x _) = "The age field of (" ++ show p ++ ") is " ++ show x

  caseExpression :: String -> Int
  caseExpression x =  case x of
           []      -> 3
           ('H':s) -> length s
           _       -> 7

  failureToZero' :: FailableDouble -> Double
  failureToZero' x = case x of
    Failure -> 0
    OK d    -> d

  data IntList = Empty | Cons Int IntList
  intListProd :: IntList -> Int
  intListProd Empty      = 1
  intListProd (Cons x l) = x * intListProd l
