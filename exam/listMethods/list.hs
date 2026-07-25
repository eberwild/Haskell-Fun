-- map = wendet eine funktion auf jedes element einer liste an -> gibt eine neue liste aus
-- map :: (a -> b) -> [a] -> [b]
-- filter = behält nur die werte in einer liste welche eine bestimmte bedingung erfüllen -> gibt eine neue liste aus
-- filter :: (a -> Bool) -> [a] -> [a]
-- foldr = reduziert eine liste von rechts nach links zu einem wert
-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldl = reduziert eine liste von links nach rechts zu einem wert
-- foldl :: (b -> a -> b) -> b -> [a] -> b

main :: IO ()
main = do 
    -- beispiel mit einer anonymen funktion voll ausgeschrieben
    -- etaReduction = map (*2) [1,2,3,4,5]
    print (map (\x -> x * 2) [1,2,3,4,5])
    print (filter (even) [1,2,3,4,5])
    print (doubleAll [1,2,3,4,5])
    print (filterEvenGreaterThanTen [11,12,5,6,7,8,33,66,47,44])
    print (squareEvenNumbers [1,2,3,4,5,6])
    print (sumList [1,2,3,4,5])
    print (joinWords ["Hallo" , "das" , "wird" , "hoffentlich" , "ein" , "Satz"])

-- nimmt eine liste entgegen und gibt alle werte verdoppelt in einer anderen liste aus
doubleAll :: [Int] -> [Int]
doubleAll list = map (*2) list

-- nimmt eine liste und gibt alle werte in einer anderen liste aus welche gerade und größer als 10 sind
filterEvenGreaterThanTen :: [Int] -> [Int]
filterEvenGreaterThanTen list = filter (\x -> even x && x > 10) list 

-- nimmt eine liste entgegen und gibt eine neue liste mit allen geraden werden quadriert aus
squareEvenNumbers :: [Int] -> [Int]
squareEvenNumbers list = map (\x -> x * x) (filter (\x -> even x) list) 

-- nimmt eine liste entgegen und gibt die summe aller werte aus
sumList :: [Int] -> Int
sumList list = foldl (\acc x -> acc + x) 0 list

-- nimmt eine liste von wörtern und bildet einen satz mit leerzeichen zwischen jedem wort
joinWords :: [String] -> String
joinWords list = foldr (\word acc -> word ++ " " ++ acc) "" list

foldlSub :: [Int] -> Int
foldlSub list = foldl (\acc x -> acc - x) 0 list                         