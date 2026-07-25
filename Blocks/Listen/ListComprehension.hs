-- [Ergebnis | Generator , Bedingung]

evenNumbers :: [Int]
evenNumbers = [x | x <- [1..20] , even x ]

squareNumbers :: [Int]
squareNumbers = [x^2 | x <- [1..10]]

oddSquares :: [Int]
oddSquares = [x^2 | x <- [1..15] , odd x]

pairs :: [(Int,Int)] 
pairs = [(x,y) | x <- [1..3] , y <- [1..3]]

ascendingPairs :: [(Int,Int)]
ascendingPairs = [(x,y) | x <- [1..5] , y <- [1..5] , y > x]

products :: [(String,Int)]
products =
    [("Brot",3),
     ("Milch",2),
     ("TV",700),
     ("Laptop",1200),
     ("Apfel",1)]

expensiveProducts :: [(String,Int)] -> [String]
expensiveProducts list = [product | (product,price) <- list , price >= 100 ]

items :: [(String,Int)]
items = [("Brot",3),("Milch",2),("Apfel",3),("TV",700),("Monitor",700)]
type Cart = [(String,Int)]
duplicatedPrice :: Cart -> [String]
duplicatedPrice cart = [p1| (p1,price1) <- cart , (p2,price2) <- cart , p1 /= p2 , price1 == price2 ]



