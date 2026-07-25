main :: IO ()
main =  do
    print ( factorial 5)
    print ((\c -> c * 9/5 + 32) 25)
    let nums = [1,2,3,4,5,6,7,8,9]
    print ( sumNums nums )

-- PatternMatching
coffeeType :: String -> String
coffeeType "Expresso" = "Strong and bold"
coffeeType "Cappucino" = "Milky and tasty"
coffeeType _ = "Unknown coffee type"

-- Guards
bookType :: Int -> String
bookType pages | pages < 100 = "Short story"
               | pages < 300 = "Novel"
               | pages < 1000 = "Normal book"
               | otherwise = "Very big book"

-- where clause
populationDensity :: (Float , Float) -> Float
populationDensity (population , area) = density where density = population / area

-- recursion
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

sumNums :: [Int] -> Int
sumNums [x] = x
sumNums (x:xs) = x + sumNums xs

-- higher order functions
-- example : map function value
