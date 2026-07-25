import Text.Read (readMaybe)
-- Either wird benutzt wenn man in gewissen Situationen mehr als einen Datentyp zurückgeben möchte 
-- Left steh hierbei für einen Fehler -> Abbruch wie Nothing bei Maybe
-- Right steht hierei für den korrekten Output -> Programm läuft weiter
-- Wichtig -> Left und Right ersetzen hier abstrakt betrachtet das keyword return

main :: IO()
main = do
    print (safeDivide 2 0)
    let password = "Hell"
    print (checkPassword 4 password )

-- prüft ob ein Wort eine gewisse Mindestlänge hat -> mit Guards
checkPassword :: Int -> String -> Either String Bool
checkPassword n word 
    | length word > n = Right True
    | otherwise = Left "Fehlerhafte Eingabe : Passwort nicht lang genug."

-- Funktion um das Teilen durch 0 zu verhindern und eine Fehlermeldung auszugeben
safeDivide :: Int -> Int -> Either String Int
safeDivide _ 0 = Left "Fehlerhafte Eingabe , es kann nicht durch 0 geteilt werden."
safeDivide n 1 = Right n
safeDivide a b = Right (a `div` b)

-- Funktion um einen String in eine positiven In Wert umzuwandeln und eine Fehlermeldung auszugeben
parsePositivInt :: String -> Either String Int
parsePositivInt text = 
    case readMaybe text :: Maybe Int of 
        Nothing -> Left "Keine gültige Eingabe."
        Just n -> 
            if n > 0 
               then Right n
               else Left "Zahl muss positiv sein."

checkInput :: IO (Either String Int)
checkInput = do
    putStrLn "Bitte eine Zahl eingeben."
    input <- getLine
    case readMaybe input :: Maybe Int of
        Nothing ->return(Left "Bitte eine gültige Zahl eingeben.")
        Just n ->return (Right n)

            
    
     




