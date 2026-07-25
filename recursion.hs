import Data.Char(toLower)
import Data.List(sort)

main :: IO()
main = do
    let numbers = [1,9,3,4,8,6,7,5,2]
    let toReverse = [1,2,3,4,5]
    let word = "Lakukaratscha"
    let facultät = fac 5
    print facultät
    let myFib = fib 6
    print myFib
    
sumUp :: [Int] -> Int
sumUp [] = 0
-- head -> erstes Element einer Liste 
-- tail -> der Rest der Liste ohne Head
-- Syntax beachten ( head : tail)
sumUp (first : rest) = first + sumUp rest

evenSum :: [Int] -> Int
evensum [] = 0
evenSum (first:rest) = if even first
                        then first + evenSum rest
                        else evenSum rest

countChar :: Char -> String -> Int
countChar c  []  = 0
countChar c  (first : rest) = if toLower first == toLower c
                            then 1 + countChar c rest 
                            else countChar c rest

findMax :: [Int] -> Int
findmax [] = 0
findMax [x] = x
findMax (first : rest) = max first (findMax rest)

squaredSum :: [Int] -> Int
squaredSum [] = 0
squaredSum [x] = x^2
squaredSum (first : rest) = (first^2) + squaredSum rest

lengthOfList :: [a] -> Int
lengthOfList [] = 0
lengthOfList [x] = 1
lengthOfList (first : rest) = 1 + lengthOfList rest

reverseList :: [a] -> [a]
reverseList [] = []
reverseList [x] = [x]
reverseList (first : rest) = reverseList rest ++ [first]

squareOdd :: [Int] -> [Int]
squareOdd [] = []
squareOdd (first : rest) = if odd first 
                            then (first^2) : squareOdd rest 
                            else squareOdd rest


countStartWith :: Char -> [String] -> Int
countStartWith c [] = 0
countStart c (first : rest) = if toLower (head first) == toLower c
                                then 1 + countStartWith c rest
                                else countStartWith c rest

fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)