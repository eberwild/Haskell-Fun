findPattern :: [Integer] -> Bool
findPattern [] = False
findPattern xs =
    hasZeroSum xs || findPattern (tail xs)


hasZeroSum :: [Integer] -> Bool
hasZeroSum xs =
    check xs 0


check :: [Integer] -> Integer -> Bool
check [] _ = False
check (x:xs) sum
    | newSum == 0 = True
    | otherwise = check xs newSum
    where
        newSum = sum + x

----------------------------------------------------------------------------------------------------------------------------

hasIncreasingPair :: [Int] -> Bool
hasIncreasingPair [] = False
hasIncreasingPair [x] = False
hasIncreasingPair (x:xs) = helper x xs
    
helper :: Int -> [Int] -> Bool
helper _ [] = False
helper latest (x:xs) 
    | latest < x = True
    | otherwise = helper x xs

----------------------------------------------------------------------------------------------------------------------------

longestIncreasingRun :: [Int] -> Int
longestIncreasingRun [] = 0
longestIncreasingRun (y:ys) = g 1 1 y ys

g :: Int -> Int -> Int -> [Int] -> Int
g currentMax _ _ [] = currentMax
g currentMax currentCount latest (x:xs) 
    | latest < x = if (currentCount +1) > currentMax 
                    then g (currentCount+1) (currentCount+1) x xs
                    else g currentMax (currentCount+1) x xs
    | otherwise = g currentMax 1 x xs

----------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------

maxAndSecond :: [Int] -> Maybe (Int,Maybe Int)
maxAndSecond [] = Nothing
maxAndSecond [_] = Nothing
maxAndSecond (x:y:xs) 
    | x == y = Just (help x Nothing xs)
    | x > y = Just (help x (Just y) xs)
    | otherwise = Just (help y (Just x) xs)

help :: Int -> Maybe Int -> [Int] -> (Int,Maybe Int)
help max second [] = (max,second)
help max second (y:ys) =
    case second of 
        Nothing 
            | y == max -> help max Nothing ys
            | y > max -> help y (Just max) ys  
            | otherwise -> help max (Just y) ys   
        Just s 
            | y > max -> help y (Just max) ys
            | y > s -> help max (Just y) ys
            | otherwise -> help max (Just s) ys
                    
    

--------------------------------------------------------------------------------------------------------------------------------

secondOccurence :: Eq a => a -> [a] -> Maybe a
secondOccurence value [] = Nothing
secondOccurence value list = h value 0 list

h :: a -> a -> [a] -> Maybe a
h value count [] 
    | count == 2 = Just value
    | otherwise = Nothing
h value count (x:xs)  
    | count == 2 = Just value
    | otherwise = if value == x 
                    then h value (count+1) xs
                    else h value count xs
    
