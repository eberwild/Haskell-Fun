import Data.Char (toLower)

isPalindrome :: String -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome word =
        let (left,right) = splitAt (length word `div` 2) word
        in helper left (reverse right)

helper :: String -> String -> Bool
helper [] [] = True
helper [] [_] = True
helper (x:xs) (y:ys) 
    | toLower x == toLower y = helper xs ys
    | otherwise = False

-------------------------------------------------------------------------------------------------------------

theEvensAre :: [Int] -> [Int]
theEvensAre [] = []
theEvensAre list = filter (\x -> even x) list

-------------------------------------------------------------------------------------------------------------

allAreEven :: [Int] -> Bool
allAreEven [] = True
allAreEven (x:xs) 
    | even x = allAreEven xs
    | otherwise = False
   
-------------------------------------------------------------------------------------------------------------
-- [1,2,3,3,4,5,5] -> [1,2,3,4,5] = entfernt gleiche Nachbarn
compress :: [Integer] -> [Integer]
compress []   = []
compress list = 
  [x | (x,y) <- neighbours , x /= y] ++ [last list]
  where neighbours = zip list (tail list)

-------------------------------------------------------------------------------------------------------------

myreplicate :: Int -> a -> [a]
myreplicate 0 _ = []
myreplicate count element 
    | count > 0 = element : myreplicate (count-1) element
    | otherwise = []

-------------------------------------------------------------------------------------------------------------

divideAndConquer :: (a -> Bool) -> (a -> b) -> (a -> (a, a)) -> (b -> b -> b) -> a -> b
divideAndConquer simpleEnough simpleCases splitFunction combineFunction =
  recursively
  where
    recursively input =
      if simpleEnough input then simpleCases input
      else
        let
          (left, right) = splitFunction input
        in
          combineFunction (recursively left) (recursively right)

sum :: [Integer] -> Integer
sum =
  divideAndConquer
    (\xs -> length xs <= 1)
    (\xs -> case xs of
        [] -> 0
        [x] -> x)
    (\xs -> splitAt (length xs `div` 2) xs)
    (+)

-------------------------------------------------------------------------------------------------------------

original :: [ (Integer, Integer) ]
original = [ (x, y) | x <- [-50 .. 50], y <- [x .. 50], abs (x + y) > 35 ]

alternative :: [ (Integer, Integer) ]
alternative = concat (map ( \ x -> map ( x , ) (filter ( \ y -> abs (x + y) > 35 ) [x .. 50]) ) [-50 .. 50])

-------------------------------------------------------------------------------------------------------------

maxAdjanced :: [Int] -> [Int]
maxAdjanced [] = []
maxAdjanced [x] = []
maxAdjanced (x:y:xs) = f x y xs

f :: Int -> Int -> [Int] -> [Int]
f current next [] 
    | current >= next = [current]
    | otherwise = [next]
f current next (y:ys)
    | current >= next = current : f next y ys
    | otherwise = next : f next y ys

stabilizeSteps :: [Int] -> [[Int]]
stabilizeSteps list = f2 [list] list

f2 :: [[Int]] -> [Int] -> [[Int]]
f2 steps [] = steps 
f2 steps list =
    case isStable list of
        True -> steps
        False -> f2 (steps ++ [workedlist]) workedlist
        where 
            workedlist = maxAdjanced list

isStable :: [Int] -> Bool
isStable [] = True
isStable [_] = True
isStable (x:xs) = f3 x xs

f3 :: Int -> [Int] -> Bool
f3 _ [] = True
f3 element (x:xs) 
    | element == x = f3 element xs
    | otherwise = False

-------------------------------------------------------------------------------------------------------------

data Ratio = Ratio Integer Integer
  deriving Show

numerator :: Ratio -> Integer
numerator (Ratio n _) = n

denominator :: Ratio -> Integer
denominator (Ratio _ d) = d

add :: Ratio -> Ratio -> Ratio
add (Ratio n1 d1) (Ratio n2 d2) 
    | d1 == d2 = Ratio (n1+n2) d1
    | otherwise = Ratio ((n1*d2) + (n2*d1)) (d1*d2)

minus :: Ratio -> Ratio -> Ratio
minus (Ratio n1 d1) (Ratio n2 d2)
    | d1 == d2 = (Ratio (n1-n2) d1)
    | otherwise = Ratio ((n1*d2) - (n2*d1)) (d1*d2)

multiply :: Ratio -> Ratio -> Ratio
multiply (Ratio n1 d1) (Ratio n2 d2) = 
    Ratio (n1*n2) (d1*d2)

divide :: Ratio -> Ratio -> Ratio 
divide (Ratio n1 d1) (Ratio n2 d2) =
    Ratio (n1*d2) (d1*n2)

-------------------------------------------------------------------------------------------------------------

data Player = P1 | P2
    deriving (Eq , Show)

type Situation = ([Int],[Int])

initSituation :: Situation
initSituation = ([],[])

taken :: Int -> Situation -> Maybe Player
taken value (cardsP1,cardsP2) 
    | value `elem` cardsP1 = Just P1
    | value `elem` cardsP2 = Just P2
    | otherwise = Nothing

remainingChoices :: Situation -> [Int]
remainingChoices (cardsP1,cardsP2) = [x | x <- [1..9] , x `notElem` cardsP1 && x `notElem` cardsP2]

takeNumber :: Player -> Int -> Situation -> Situation
takeNumber player card (cardsP1,cardsP2) =
    case taken card (cardsP1,cardsP2) of
        Just _ -> (cardsP1,cardsP2)
        Nothing -> if player == P1 
                    then (card : cardsP1 , cardsP2)
                    else (cardsP1 , card : cardsP2)
            
data Result = Draw | Won Player
    deriving (Show)

gamefinished :: Situation -> Maybe Result 
gamefinished (cardsP1,cardsP2)
    | hasWinningTriple cardsP1 = Just (Won P1)
    | hasWinningTriple cardsP2 = Just (Won P2)
    | length cardsP1 + length cardsP2 == 9 = Just Draw
    | otherwise = Nothing

hasWinningTriple :: [Int] -> Bool
hasWinningTriple [] = False
hasWinningTriple [_] = False
hasWinningTriple [_,_] = False
hasWinningTriple cards@(x:y:xs) = fun x y xs cards

fun :: Int -> Int -> [Int] -> [Int] -> Bool
fun _ _ _ [] = False
fun _ _ [] [_,_] = False
fun _ _ [] (x:y:z:rest) = fun y z rest (y:z:rest)
fun value1 value2 rest@(x:xs) cards
    | difference `elem` rest = True
    | otherwise = fun value1 x xs cards
    where 
        difference = 15 - (value1 + value2)

-------------------------------------------------------------------------------------------------------------

data Tree = Node Integer [Tree]

tree :: Tree
tree = Node 1 [Node 2 [], Node 4 [], Node 5 [], Node 6 [], Node 8 []]

contains :: Integer -> Tree -> Bool
contains seek (Node value children)
    | seek == value = True
    | otherwise = containsChildren seek children

containsChildren :: Integer -> [Tree] -> Bool
containsChildren _ [] = False
containsChildren seek (tree:trees) =
    contains seek tree || containsChildren seek trees

-------------------------------------------------------------------------------------------------------------

data Bit = O | I
  deriving (Eq, Show)

testbools :: [Maybe Bool]
testbools = [Just True , Nothing , Just True , Just False , Just False , Nothing]

encode :: [Maybe Bool] -> [Bit]
encode [] = []
encode (b:bs) 
    | b == Just True = I : I : encode bs
    | b == Just False = I : O: encode bs
    | otherwise = O : encode bs

decode :: [Bit] -> Maybe [Maybe Bool]
decode [] = Just []
decode [I] = Nothing
decode [O] = Just [Nothing]
decode (x:y:xs) 
    | x == I = case y of 
                I -> case decode xs of
                        Nothing -> Nothing
                        Just list -> Just ((Just True) : list)
                O -> case decode xs of
                        Nothing -> Nothing
                        Just list -> Just ((Just False) : list)
    | otherwise = case decode (y:xs) of
                    Nothing -> Nothing
                    Just list -> Just (Nothing : list)

-------------------------------------------------------------------------------------------------------------

original2 :: [Int] -> Int
original2 [] = 7
original2 (x : list) 
    | (x `mod` 11) == 0 = 13 + original2 list
    | otherwise         = x * original2 list

alternative2 :: [Int] -> Int
alternative2 list = foldr (\x acc -> if x `mod` 11 == 0
                                        then 13 + acc
                                        else x * acc
                                    ) 7 list

mycompare :: [Int] -> Bool
mycompare list = (original2 list) == (alternative2 list)

-------------------------------------------------------------------------------------------------------------

data List a = Nil | Cons a (List a)
  deriving (Eq, Show)

mylength :: List a -> Int
mylength Nil           = 0
mylength (Cons _ rest) = 1 + mylength rest

myreverse :: List a -> List a
myreverse Nil = Nil
myreverse (Cons value rest) = addlast value (myreverse rest)

addlast :: a -> List a -> List a
addlast value Nil = Cons value Nil
addlast value (Cons x rest) = Cons x (addlast value rest)

maplist :: (a -> b) -> List a -> List b
maplist _ Nil = Nil
maplist f (Cons value rest) = (Cons (f value) (maplist f rest))

filterlist :: (a -> Bool) -> List a -> List a
filterlist _ Nil = Nil
filterlist check (Cons value rest)
    | check value = (Cons value (filterlist check rest))
    | otherwise = filterlist check rest

example :: List Int
example = Cons 1 (Cons 2 (Cons 3 Nil))

-------------------------------------------------------------------------------------------------------------

main :: IO ()
main = do
    putStrLn "Wert für x :"
    x <- readLn
    convertHelp x 0

getNextX :: IO (Int)
getNextX = do
    putStrLn "Nächstes x : "
    newX <- readLn
    return (newX)

convertHelp :: Int -> Int -> IO ()
convertHelp x y
    | x > 0 = if even x
                then do 
                    putStrLn ("New x : " ++ (show updatedX))
                    convertHelp updatedX y
                else do
                        newX <- getNextX
                        putStrLn ("New x : " ++ (show newX))
                        convertHelp newX (y+1)
    | otherwise = putStrLn("Y : " ++ (show y))
    where 
        updatedX = x `div` 3

-------------------------------------------------------------------------------------------------------------

while :: a -> (a -> Bool) -> (a -> a) -> a
while start p body = loop start
  where
    loop x
      | p x       = loop (body x)
      | otherwise = x

reduceToOne :: Int -> Int
reduceToOne value = while 
                        value 
                        (\x -> x > 1)
                        (\x -> if even x 
                                then x `div` 2
                                else x - 1)

ioWhile :: a -> (a -> Bool) -> (a -> IO a) -> IO a
ioWhile start p body = loop start
  where
    loop x =
      if p x
        then do
          x' <- body x
          loop x'
        else
          return x

sumNumbers :: IO ()
sumNumbers = do
                putStr "Wie viele Zahlen sollen eingelesen werden ?"
                number <- readLn
                (_ , summe , valid) <- ioWhile (number , 0 , True)
                                (\(x,_,_) -> x > 0)
                                (\(x,mysum,valid) -> do
                                    putStrLn "Welche Zahl soll aufsummiert werden?"
                                    input <- readLn
                                    case input of
                                        0 -> return (0,mysum,(not valid))
                                        _ -> return ((x-1),(mysum + input) , valid)
                                )
                case valid of
                    True -> putStrLn ("Summe : " ++ show summe)
                    False -> return ()

processUntilCommand :: IO ()
processUntilCommand = do
    putStrLn "Wie vielen Zahlen möchten sie eingeben?"
    number <- readLn
    (n , summe , negative , maximum , valid) <- ioWhile (number , 0 , 0 , Nothing , True) 
                        (\(n,_,_,_,_) -> n > 0)
                        (\(n , currentSum , negativeCount , maximum , valid) -> do
                        putStrLn "Nächte Zahl : "
                        input <- readLn 
                        case input of
                            0 -> return (0 , currentSum , negativeCount , maximum , False)
                            _ ->  do 
                                case (input > 0) of
                                    True -> return ((n-1) , (currentSum + input) , negativeCount , 
                                                                                        case maximum of 
                                                                                            Nothing -> Just input
                                                                                            Just x -> Just (max x input)
                                                                                        ,
                                                                                        valid
                                                                                        )
                                    False -> return ((n-1) , currentSum ,(negativeCount+1),
                                                                                        case maximum of 
                                                                                            Nothing -> Just input
                                                                                            Just x -> Just (max x input)
                                                                                        ,
                                                                                        valid
                                                                                        )
                    ) 
    case valid of 
        False -> putStrLn "Eingabe beendet."
        True -> do
            putStrLn ("Positive Summe : " ++ (show summe))
            putStrLn ("Anzahl negativer Zahlen : " ++ (show negative))
            case maximum of
                Nothing -> putStrLn "Kein Maximum vorhanden."
                Just x -> putStrLn ("Maximum Eingabe : " ++ (show x))
            
