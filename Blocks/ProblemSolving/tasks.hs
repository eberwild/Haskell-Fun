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

longestParityRun :: [Int] -> Int
longestParityRun [] = 0
longestParityRun [_] = 1
longestParityRun (x:xs) = myhelper 1 1 xs (even x)

myhelper :: Int -> Int -> [Int] -> Bool -> Int
myhelper maxRun _ [] _ = maxRun
myhelper maxRun currentRun (x:xs) status 
    | status == (even x) = if (currentRun+1) > maxRun 
                            then myhelper (currentRun+1) (currentRun+1) xs (even x)
                            else myhelper maxRun (currentRun+1) xs (even x)
    | otherwise = myhelper maxRun 1 xs (even x)


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

h ::Eq a => a -> Int -> [a] -> Maybe a
h value count [] 
    | count == 2 = Just value
    | otherwise = Nothing
h value count (x:xs) =
    case count of 
        2 -> Just value
        _ -> if value == x
                then h value (count+1) xs
                else h value count xs 

--------------------------------------------------------------------------------------------------------------------------------
    
longestIncreasingRunStart :: [Int] -> Maybe (Int,Int)
longestIncreasingRunStart [] = Nothing
longestIncreasingRunStart [x] = Just (x,1)
longestIncreasingRunStart (x:xs) = Just (helpme (x,1) (x,1) x xs)

helpme :: (Int,Int) -> (Int,Int) -> Int -> [Int] -> (Int , Int)
helpme (bestStart , bestRun) _  _ [] = (bestStart , bestRun)
helpme (bs , br) (cs , cr) ce (x:xs) 
    | ce < x = if br < (cr+1) 
                then helpme (cs , (cr+1)) (cs , (cr+1)) x xs
                else helpme (bs , br) (cs , (cr+1)) x xs
    | otherwise = helpme (bs , br) (x , 1) x xs

--------------------------------------------------------------------------------------------------------------------------------

hasZeroSumSubArray :: [Int] -> Bool
hasZeroSumSubArray xs = testSum 0 xs xs

testSum :: Int -> [Int] -> [Int] -> Bool
testSum sum [] [] = False
testSum sum [] (y:ys) = testSum 0 ys ys
testSum sum (x:xs) original
    | newSum == 0 = True
    | otherwise = testSum newSum xs original
    where 
        newSum = sum + x

--------------------------------------------------------------------------------------------------------------------------------

balanceIndex :: [Int] -> Maybe Int
balanceIndex [] = Nothing
balanceIndex [_] = Nothing
balanceIndex (x:xs) = h2 0 x [] xs

h2 :: Int -> Int -> [Int] -> [Int] -> Maybe Int
h2 currentIndex currentElement leftlist [] 
    | sumList leftlist == sumList [] = Just (currentIndex)
    | otherwise = Nothing
h2 currentIndex currentElement leftlist rightlist@(y:ys) 
    | sumList leftlist == sumList rightlist = Just (currentIndex)
    | otherwise = h2 (currentIndex+1) y (currentElement : leftlist) ys

sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

---------------------------------------------------------------------------------------------------


    