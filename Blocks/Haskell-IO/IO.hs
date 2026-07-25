greet :: IO ()
greet = do
    putStrLn "Wie heißt du?"
    name <- getLine
    putStrLn ("Hallo " ++ name)

askName :: IO String
askName = do
    putStrLn "Wie heißt du?"
    name <- getLine
    return name

welcome :: IO ()
welcome = do
    name <- askName
    putStrLn ("Willkommen " ++ name)

readNumber :: String -> Maybe Int
readNumber input =
    case reads input of
        [(number, "")] -> Just number
        _              -> Nothing

askAge :: IO ()
askAge = do
    putStrLn "Wie alt bist du?"
    age <- getLine
    let intAge = readNumber age
    case intAge of
        Just value -> putStrLn ("Du bist " ++ age ++ " Jahre alt.")
        Nothing -> putStrLn "Alter muss eine Zahl sein."

checkAge :: IO ()
checkAge = do
    putStrLn "Wie alt bist du?"
    age <- getLine
    let intAge = readNumber age
    case intAge of 
        Just value -> if value >=18 
                        then putStrLn "Du bist volljährig."
                        else putStrLn "Du bist leider nicht volljährig."
        Nothing -> putStrLn "Bitte gib eine Zahl ein.."

----------------------------------------------------------------------------------------------

askNumber :: IO (Either String Int)
askNumber = do
    putStrLn "Bitte eine Zahl eingeben."
    number <- getLine
    let intNumber = readNumber number
    case intNumber of
        Just value -> return (Right value)
        Nothing -> return (Left "Keine gültige Eingabe.")

addTwoNumbers :: IO ()
addTwoNumbers = do
    putStrLn "Bitte Zahl 1 eingeben."
    num1 <- getLine
    putStrLn "Bitte Zahl 2 eingeben."
    num2 <- getLine
    let num1Int = readNumber num1
    let num2Int = readNumber num2
    case num1Int of
        Just x -> 
            case num2Int of
                Just y -> do
                    let summ = x + y
                    putStrLn ("Summe: " ++ show summ)
                Nothing -> putStrLn "Die zweite Eingabe war nicht gültig."
        Nothing -> putStrLn "Die erste Eingabe war nicht gültig."

----------------------------------------------------------------------------------------------

checkPassword :: String -> Either String ()
checkPassword password
    | password == "haskell123" = Right ()
    | otherwise = Left "Falsches Passwort."

login :: Int -> IO ()
login attempts 
    | attempts < 3 = do
        putStrLn "Please enter your password."
        password <- getLine
        let valid = checkPassword password
        case valid of
            Right _ -> putStrLn "Login erfolgreich."
            Left message -> do
                putStrLn (message ++ "Tries remain :" ++ show (3 - attempts))
                login (attempts +1)
    | otherwise = putStrLn "Zugriff verweigert."

startLogin :: IO ()
startLogin = login 0

----------------------------------------------------------------------------------------------

checkAnswer :: String -> Either String Int
checkAnswer answer 
    | answer == "Haskell" = Right 10
    | otherwise = Left "Diese Antwort war falsch."

quiz :: IO ()
quiz = do
    putStrLn "Was ist die beste funktionale Programmiersprache?"
    answer <- getLine
    let result = checkAnswer answer
    showResult result
    
showResult :: Either String Int -> IO ()
showResult result = 
    case result of 
        Right x -> putStrLn ("Korrekt , du bekommst " ++ show x ++ " Punkte.")
        Left message -> putStrLn message

----------------------------------------------------------------------------------------------

analyzeText :: String -> Either String Int
analyzeText text 
    | textLength > 0 = Right textLength
    | otherwise = Left "Keinen Text eingegeben."
    where 
        textLength = length text

textAnalyzer :: IO ()
textAnalyzer = do
    putStrLn "Bitte gib einen Text ein."
    text <- getLine
    let result = analyzeText text
    case result of
        Right x -> putStrLn ("Anzahl der Zeichen: " ++ show x)
        Left message -> putStrLn message

repeatAnalyzer :: Int -> IO ()
repeatAnalyzer value 
    | value > 0 = do
        textAnalyzer 
        repeatAnalyzer (value-1)
    | otherwise = putStrLn "Eingabe beendet."

startAnalyze :: IO ()
startAnalyze = repeatAnalyzer 3

----------------------------------------------------------------------------------------------
type Notes = [String]

myNotes :: Notes 
myNotes = ["Einkaufen" , "Kochen"]

addEntry :: String -> Notes -> Notes
addEntry entry (x:xs) = (entry:x:xs)

notesApp :: Notes -> IO ()
notesApp notes = do
    putStrLn "1 - Notiz hinzufügen"
    putStrLn "2 - Notizen anzeigen"
    putStrLn "3 - Beenden"
    choice <- getLine

    case choice of 
        "1" -> do
            putStrLn "Was soll hinzugefügt werden?"
            entry <- getLine
            let updatedNotes = addEntry entry notes
            notesApp updatedNotes
        "2" -> do 
            putStrLn (show notes)
            notesApp notes
        "3" -> putStrLn "Eingabe beendet."
        "_" -> putStrLn "Ungültige Eingabe."

        

