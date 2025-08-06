import Text.Read (readMaybe)

main :: IO()
main = do 
    zahl1 <- validSquare
    print zahl1

    zahl2 <- normalSquare
    print zahl2

checkPassword :: String -> Either String Bool
checkPassword word 
    | length word > 5 = Right True
    | otherwise = Left "Fehlerhafte Eingabe."

-- nimmt vom Nutzer ein Passwort entgegen und testet ob e slang genug ist -> wenn nicht Warnung und erneute Eingabe erforderlich
validPasswort :: IO String
validPasswort = do 
    putStrLn "Bitte Passwort eingeben."
    input <- getLine
    if length input > 5 
        then do 
            putStrLn $ "Passwort ist valide."
            return input
        else do
            putStrLn "Das Passwort muss mindestens 6 Zeichen enthalten."
            validPasswort

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