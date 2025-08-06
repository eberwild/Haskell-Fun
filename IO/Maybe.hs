import Text.Read (readMaybe)

main :: IO()
main = do 
    zahl1 <- validSquare
    print zahl1

    zahl2 <- normalSquare
    print zahl2
    
-- ruft bei einer falschen Eingabe die Funktion so lange auf bis die Eingabe korrekt ist
validSquare :: IO Int
validSquare = do 
    putStrLn "Bitte eine Zahl eingeben :"
    input <- getLine
    case readMaybe input :: Maybe Int of
        Just n -> return (n^2)
        Nothing -> do
            putStrLn "Keine gültige Eingabe erkannt."
            validSquare 

-- gibt bei einer falschen Eingabe Nothing zurück und bricht damit ab
normalSquare :: IO (Maybe Int)
normalSquare = do 
    putStrLn "Bitte eine Zahl eingeben :"
    input <- getLine
    case readMaybe input :: Maybe Int of
        Just n -> do
            let square = n^2
            return (Just square)
        Nothing -> do
            putStr "Fehlerhafte Eingabe."
            return Nothing    -- kann hier nur returned werden weil return typ (Maybe Int) ist 