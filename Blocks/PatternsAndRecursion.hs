myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs  

myLast :: [a] -> a
myLast [x] = x
myLast (x:xs) = myLast xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse [x] = [x]
myReverse (x:xs) = myReverse xs ++ [x]

myInit :: [a] -> [a]
myInit [] = []
myInit [x] = []
myInit (x:xs) = x : myInit xs