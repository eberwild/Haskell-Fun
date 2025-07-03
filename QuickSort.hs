
sort :: [Integer] -> [Integer]
sort [] = []
sort [x] = [x]
sort list = 
    -- let definiert Dinge 
    let pivot = head list
        smaller = [x | x <- tail list , x <= pivot]
        greater = [x | x <- tail list , x > pivot]
    -- in nutzt die in let definierten Dinge
    in sort smaller ++ [pivot] ++ sort greater

-------------------------------------------------------------------------

sortWhere []  = []
sortWhere [x] = [x]
sortWhere list = sortWhere smaller ++ [pivot] ++ sortWhere greater
-- mit where : Definitionen nicht mit let sondern mit where
  where
    pivot   = head list
    smaller = [x | x <- tail list, x <= pivot]
    greater = [x | x <- tail list, x > pivot]


--------------------------------------------------------------------------

sortPatternMatching :: [Integer] -> [Integer]
sortPatternMatching [] = []
sortPatternMatching [x] = [x]
sortPatternMatching (x:xs) = 
    let smaller = [y | y <- xs, y <= x]
        greater = [y | y <- xs, y > x]
    in sortPatternMatching smaller ++ [x] ++ sortPatternMatching  greater

--------------------------------------------------------------------------

main = do
    let numbers = [2,5,3,7,9,1,3,6,4,8]
    print (sort numbers)
    print (sortPatternMatching numbers)