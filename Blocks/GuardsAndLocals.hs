grade :: Int -> String
grade x 
    | x >= 90 = "A"
    | x >= 75 = "B"
    | x >= 60 = "C"
    | otherwise = "F"

bmi :: Double -> Double -> String
bmi weight height
    | result < 18.5 = "underweight"
    | result < 25 = "normal"
    | result < 30 = "overweight"
    | otherwise = "obese"
    where result = weight / (height*height)

describeNumber :: Int -> String
describeNumber x 
    | mod x 5 == 0 && mod x 3 == 0 = "Fizzbuzz"
    | mod x 3 == 0 = "Fizz"
    | mod x 5 == 0 = "Buzz"
    | otherwise = show x
    
classifyList :: [Int] -> String
classifyList list 
    | null list = "empty"
    | listSum > 100 = "big"
    | otherwise = "small"
    where 
        listSum = foldr (\x acc -> x + acc) 0 list

circleArea :: Double -> String
circleArea radius =
    let 
        area = pi * radius*radius
    in 
        "Area: " ++ show area

