import Text.Read (readMaybe)

-- funktion welche ein zahl entgegennimmt und die anzahl der additionen bestimmt
-- mit either : left und right sind beide vom selben typen (either string int) welcher aus einer IO aktion entsteht
-- mit left und right ändern wir nur den typ von dem was wir zurückgeben -> zu Either String Int
-- durch return ( return :: a -> IO a) wird dann der typ der rückgabe getroffen -> IO (Either String Int)
getNumberOfInput :: IO (Either String Int)
getNumberOfInput = do
    putStrLn "Please enter the amount of numbers you want to insert:"
    input <- getLine
    case readMaybe input :: Maybe Int of
        Nothing -> return (Left "Not a valid number..")
        Just n -> multiplyInput n 1

-- funktion die so lange zahlen entgegennimmt und aufsummiert bis die anzahl erreicht ist
getInput :: Int -> Int -> IO (Either String Int)
getInput 0 acc = return (Right acc)
getInput n acc = do
    putStrLn "Enter a number to work with!"
    input <- getLine
    case readMaybe input :: Maybe Int of
        Nothing -> do
            putStrLn "That was not a valid number.."
            getInput n acc
        -- eingabe = 0 -> bis hierher aufsummierter acc wird ausgegeben
        -- dadurch wird das programm ohne fehler beendet aber mit einer ausgabe
        Just 0 -> return (Right acc)
        Just x -> getInput (n-1) (acc + x)

-- gibt nicht mehr Just n aus , sondern nur noch n oder einen fehlerString im fall von nothing
-- entfernt praktisch die box maybe in der vielleicht der passende wert enthalten ist oder eben nicht
fromJust :: Maybe a -> Either String a
fromJust (Just x)  = Right x
fromJust Nothing = Left "No valid value found : Nothing"

-- nimmt eine zahl entgegen und gibt diese verdoppelt wieder aus
doubleInput :: IO()
doubleInput = do
    putStrLn "Please enter a number to be doubled."
    number <- getLine
    case readMaybe number :: Maybe Int of
        Nothing -> 
            putStrLn "This was not a valid number.."
        Just n -> 
            putStrLn ("Doubled: " ++ show (n*2))

-- multipliziert n zahlen miteinander und überspringt bei der eingabe 1 und gibt bei eingabe 0 das zwischenergebnis aus
multiplyInput :: Int -> Int -> IO (Either String Int)
multiplyInput 0 acc = return (Right acc)
multiplyInput n acc = do
    putStrLn "Enter a number to add to the calculation:"
    input <- getLine
    case readMaybe input :: Maybe Int of
        Nothing -> do
            putStrLn "Please enter a valid number.."
            multiplyInput n acc
        Just 0 -> return (Right acc)
        Just 1 -> multiplyInput n acc
        Just x -> multiplyInput (n-1) (acc * x)