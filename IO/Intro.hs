import Text.Read (readMaybe)

main :: IO()
main = do 
    putStrLn "Bitte den Namen eingeben:"    -- zeigt eine Nachricht in der Konsole an
    name <- getLine                         -- name wird von einem IO-String zu einem normalem String
    putStrLn ("Hallo, " ++ name ++ "!")

    putStrLn "Zahl Nummer 1:"
    input1 <- getLine
    let number1 = read input1 :: Int        -- wandelt den Input in einen Int um
    putStrLn "Zahl Nummer 2:"
    input2 <- getLine
    let number2 = read input2 :: Int
    let added = number1  + number2 
    print(show number1 ++ "+" ++ show number2 ++ "="  ++ show added)

    -- zeigt den Ablauf mit 2 möglichen User-Eingaben
    putStrLn "Bitte erste Zahl eingeben:"
    input1 <- getLine
    putStrLn "Bitte zweite Zahl eingeben:"
    input2 <- getLine

    -- Tuppel benutzen um mehr als eine Eingabe zu verarbeiten und zu verifizieren 
    case (readMaybe input1 :: Maybe Int, readMaybe input2 :: Maybe Int) of
        (Just x, Just y) ->
            putStrLn ("Summe: " ++ show (x + y))

        (Nothing, Nothing) ->
            putStrLn "Beide Eingaben waren keine gültigen Zahlen."

        (Nothing, _) ->
            putStrLn "Die erste Eingabe war keine Zahl."

        (_, Nothing) ->
            putStrLn "Die zweite Eingabe war keine Zahl."


    