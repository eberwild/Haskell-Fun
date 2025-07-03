import Text.Read (Lexeme(String))
import Graphics.Win32 (paintRgn)
import Data.List(nub)
import Data.Char(toLower)

main :: IO ()
main = do
    let list = doubleIfEven 10
    print list
    let divisors = divisor 12 
    print divisors
    let values = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    let only = onlyDivBy3 values
    print only    
    let words = ["Hallo" , "mein" , "Name" , "ist" , "Bob" , "und" , "ich" , "hasse" , "Haskell" , "nicht" , "mehr" , "so" , "sehr"]
    let result = pairWithLength words
    print result
    let combo = groupBylength words
    print combo
    let even = squaresOfEven values
    print even
    let startH = startsWithH words
    print startH
    

doubleIfEven :: Int -> [Int]
doubleIfEven n = [ if even x 
                    then x * 2
                    else x | x <- [1 .. n] ]

divisor :: Int -> [Int]
divisor n = [x | x <- [1 .. if even n 
                                then n `div` 2
                                else (n-1) `div` 2] ++ [n]
            , mod n x == 0 ]

onlyDivBy3 :: [Int] -> [Int]
onlyDivBy3 list = [x | x <- list , mod x 3 == 0]

pairWithLength :: [String] -> [(String , Int)]
pairWithLength list = [(x , y) | x <- list , let y = length x]

groupBylength :: [String] -> [(Int , [String])]
groupBylength list = [(x , [w | w <- list ,length w == x]) | x <- nub (map length list)]

mapMe :: [String] -> [Char] -> [(Char ,[String])]
mapMe words chars = [(c, [w | w <- words , head w == c]) | c <- chars ]

squaresOfEven :: [Int] -> [Int]
squaresOfEven list = [x^2 | x <- list , even x]

startsWithH :: [String] -> [String]
startsWithH list = [x | x <- list , toLower (head x) == 'h']

getFirstLetter :: [String] -> [Char]
getFirstLetter list = nub (map head list)



