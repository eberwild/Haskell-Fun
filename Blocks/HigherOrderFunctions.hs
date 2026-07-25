doubleAll :: [Int] -> [Int]
doubleAll list = map (\x -> x*2) list

onlyEven :: [Int] -> [Int]
onlyEven list = filter (\x -> even x) list

sumSquares :: [Int] -> Int
sumSquares list = foldr (\x acc -> x + acc) 0 (map (\x -> x * x) list) 

keepAndDoubleEvens :: [Int] -> [Int]
keepAndDoubleEvens list = map (\x -> x*2) (filter (\x -> even x) list)

countPositives :: [Int] -> Int
countPositives list = foldr (\x acc -> if x > 0 
                                        then acc +1
                                        else acc) 
                                        0 
                                        list

sumList :: [Int] -> Int
sumList list = foldl (\acc x -> acc + x) 0 list

gl :: [Int] -> Int
gl list = foldl (-) 0 list

gr :: [Int] -> Int
gr list = foldr (-) 0 list