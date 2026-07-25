f xs = (map (\x -> x * 2) . filter even) xs

increment x = x + 1
double x = x * 2
square x = x ^ 2
reverse xs = reverseList xs
process1 x = (double . increment) x
process2 x = (square . double . increment) x 
process3 xs = (map (*2) . filter even) xs
process4 xs = (reverseList . incrementAll) xs


reverseList :: [a] -> [a]
reverseList xs = foldl (\acc x -> x : acc) [] xs

incrementAll :: Num a => [a] -> [a]
incrementAll xs = map (+1) xs