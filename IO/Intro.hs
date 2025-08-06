import Text.Read (readMaybe)

main :: IO()
main = do 
    putStrLn "Bitte den Namen eingeben:"
    name <- getLine        -- name wird von einem IO-String zu einem normalem String
    putStrLn ("Hallo, " ++ name ++ "!")

    putStrLn "Zahl Nummer 1:"
    input1 <- getLine
    let number1 = read input1 :: Int
    putStrLn "Zahl Nummer 2:"
    input2 <- getLine
    let number2 = read input2 :: Int
    let added = number1  + number2 
    print(show number1 ++ "+" ++ show number2 ++ "="  ++ show added)

    zahl <- validSquare
    print zahl

validSquare :: IO Int
validSquare = do 
    putStrLn "Bitte eine Zahl eingeben :"
    input <- getLine
    case readMaybe input :: Maybe Int of
        Just n -> return (n^2)
        Nothing -> do
            putStrLn "Keine gültige Eingabe erkannt."
            validSquare 

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
            return Nothing