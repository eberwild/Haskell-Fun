main :: IO ()
main = do
    -- Aufgabe 1 -> einfach nur verdoppeln
    let zahlen = [1,2,3,4]
    let doubled = map (* 2) zahlen
    print doubled

    -- Aufgabe 2 -> erst Filtern , dann verdopplen
    let zahlen2 = [1,2,3,4,5,6,7,8,9]
    let evenZahlen2 = filter (\x -> x `mod` 2 == 0) zahlen2
    let doubleEven = map (\x -> x*2) evenZahlen2
    print doubleEven

    -- Aufgabe 3 -> Text aus Liste mit Tuppeln machen
    let gameinfo = [("Anna" , 34) , ("Bernd" , 31) , ("Christian" , 29)]
    let generalInfo = map (\(player,points) -> player ++ " hat " ++ show points ++ " Punkte.") gameinfo
    print generalInfo

    let zahlenfoldr = [1,2,3,4,5]
    let sum = foldr(\x acc -> x + acc) 0 zahlenfoldr
    print sum
    
    let reversed = foldr(\x acc -> acc ++ [x] ) [] zahlenfoldr
    print reversed

    
