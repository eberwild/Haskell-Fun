-- Eine eigene höhere Funktion:
applyToList :: (Int -> Int) -> [Int] -> [Int]
applyToList f xs = map f xs

main :: IO ()
main = do
    let zahlen = [1..10]

    -- Tupple Beispiel
    let playerAndPoints = [("Player1" , 10) , ("Player2" , 35) , ("Player3" , 45)]
    let doubledPoints = map (\(player,points) -> (player, points * 2)) playerAndPoints
    putStrLn "DoubledPoints:"
    print doubledPoints

    -- Mit einer anonymen Funktion verdoppeln
    let verdoppelt = applyToList (\x -> x * 2) zahlen
    let easydoppelt = map (\x -> x * 2) zahlen
    putStrLn "Verdoppelte Zahlen:"
    print easydoppelt
    print verdoppelt

    -- Anonyme Funktion in filter: nur gerade Zahlen
    let gerade = filter (\x -> x `mod` 2 == 0) zahlen
    putStrLn "Gerade Zahlen:"
    print gerade

    -- Anonyme Funktion in map: quadrieren
    let quadrate = map (\x -> x * x) zahlen
    putStrLn "Quadratzahlen:"
    print quadrate

    -- Anonyme Funktion in foldr: Summe aller Zahlen
    let summe = foldr (\x acc -> x + acc) 0 zahlen
    putStrLn "Summe aller Zahlen:"
    print summe

    -- Anonyme Funktion direkt in print
    -- $ spart uns die äußeren Klammern -> alles rechts davon wird zu einem einzelnem Ausdruck
    print $ map (\x -> (x, x * 3)) zahlen
    print (map (\x -> (x, x * 3)) zahlen)

