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
    let randomValues = [1,2,3,3,4,1,2,3,4,5,6]
    let only = onlyDivBy3 values
    print only    
    let words = ["Hallo" , "mein" , "Name" , "ist" , "Kevin" , "und" , "ich" , "hasse" , "Haskell" , "nicht" , "mehr" , "so" , "sehr"]
    let result = pairWithLength words
    print result
    let combo = groupBylength words
    print combo
    let even = squaresOfEven values
    print even
    let startH = startsWithH words
    print startH
    print( takeWhileAdjanced (\x y -> x<=y) randomValues) -- oder -> takeWhileAdjanced (<=) randomValues (ETA-reduction)
    print( takeWhileTriple (\x y z ->  x < y && y < z) randomValues)
    

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
-- nub (map length list) -> gibt die Länge von allen Wörtern in der Liste aus , nub entfernt nur Duplikate
groupBylength list = [(x , [w | w <- list ,length w == x]) | x <- nub (map length list)]

mapMe :: [String] -> [Char] -> [(Char ,[String])]
mapMe words chars = [(c, [w | w <- words , head w == c]) | c <- chars ]

squaresOfEven :: [Int] -> [Int]
squaresOfEven list = [x^2 | x <- list , even x]

startsWithH :: [String] -> [String]
startsWithH list = [x | x <- list , toLower (head x) == 'h']

getFirstLetter :: [String] -> [Char]
getFirstLetter list = nub (map head list)

takeWhileAdjanced :: (a -> a -> Bool) -> [a] -> [a]
takeWhileAdjanced _ [] = []
takeWhileAdjanced _ [x] = [x]
takeWhileAdjanced function (x:y:rest) 
    | function x y = x : takeWhileAdjanced function (y:rest)
    | otherwise = [x]   -- kurz für x : []

takeWhileTriple :: (a -> a -> a -> Bool) -> [a] -> [a]
takeWhileTriple _ [] = []
takeWhileTriple _ [x] = [x]
takeWhileTriple _ [x,y] = [x,y]
takeWhileTriple function (x:y:z:rest)
    | function x y z = x : takeWhileTriple function (y:z:rest)
    | otherwise = [x]



