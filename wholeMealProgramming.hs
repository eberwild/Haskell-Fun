-- Pointwhise -> element für element verarbeitung meistens rekursiv
-- Wholemeal -> abstarkte operationen auf ganze datenstrukuren anwenden

-- Pointwhise
sumEvens :: [Int] -> Int
sumEvens [] = 0
sumEvens (x:xs)
  | even x    = x + sumEvens xs
  | otherwise = sumEvens xs

-- Wholemeal
sumEvensWhole :: [Int] -> Int
sumEvensWhole = sum . filter even

-- Pointwhise
doubleList :: [Int] -> [Int]
doubleList []     = []
doubleList (x:xs) = (2 * x) : doubleList xs

-- Wholemeal
doubleListWhole :: [Int] -> [Int]
doubleListWhole = map (*2)


