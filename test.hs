main :: IO()
main = 
    do
    let numbers = [1,2,3,4,5,6,7,8,9]
    let players = ["Player1" , "Player2" , "Player3" , "Player4" , "Player5"]
    print (onlyeven numbers)
    print (addone numbers)
    print (doubleEven 10)
    print (toLists players numbers)
    print (zip players numbers)
    print ( guardstest 5)

guardstest :: Int -> Int
guardstest x 
        | x > 0 = 1
        | x < 0 = -1
        | otherwise = 0

-- even x stellt hier die Bedingung da um in die neue Liste zu kommen
onlyeven :: [Int] -> [Int]
onlyeven list = [x | x <- list , even x]

-- hier wird keine Bedingung wie beim Filtern angegeben sondern im linken Teil steht was in der neuen Liste landen soll -> rechts woraus
addone :: [Int] -> [Int]
addone list = [x + 1 | x <- list ]

-- wir können ebenso angeben aus welcher liste die Werte für x kommen sollen 
doubleEven :: Int -> [Int]
doubleEven n = [ if even x 
                 then x * 2
                 else x | x <- [1 .. n]]

-- kann mit zip list1 list2 leichter erreicht werden
toLists :: [a] -> [b] -> [(a,b)]
toLists [][] = []
toLists list1 [] = []
toLists [] list2 = []
toLists (head1 : rest1) (head2 : rest2) = (head1 , head2) : toLists rest1 rest2
