firstElement :: [a] -> Maybe a 
firstElement [] = Nothing
firstElement (x:_) = Just x

lastElement :: [a] -> Maybe a
lastElement [] = Nothing
lastElement [x] = Just x
lastElement (x:xs) = lastElement xs

sumList :: Num a => [a] -> a
sumList [] = 0
sumList (x:xs) = x + sumList xs

lengthList :: [a] -> Int
lengthList [] = 0
lengthList (x:xs) = 1 + lengthList xs

contains :: Eq a => a -> [a] -> Bool
contains _ [] = False
contains value (x:xs) 
    | value == x = True
    | otherwise = contains value xs

mapList :: (a -> b) -> [a] -> [b]
mapList _ [] = []
mapList f (x:xs) = f x : mapList f xs

filterList :: (a -> Bool) -> [a] -> [a]
filterList _ [] = []
filterList f (x:xs) 
    | f x = x : filterList f xs
    | otherwise = filterList f xs

foldRight :: (a -> b -> b) -> b -> [a] -> b
foldRight f _ acc [] =  acc
foldRight f acc (x:xs) = x f acc f foldRight f xs acc