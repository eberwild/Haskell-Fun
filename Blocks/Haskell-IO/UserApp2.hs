type Name = String
type Age = Int
data User = User Name Age
type Users = [User]

myUsers :: Users
myUsers = 
    [User "Pat" 25,
     User "Zinzii" 33,
     User "Reina" 20,
     User "Gyro" 16
    ]

testUser :: User
testUser = User "Emely" 21

showUser :: User -> String
showUser (User name age) = ("User " ++ name ++ " ist " ++ (show age) ++ " Jahre alt.")

showUsers :: Users -> String
showUsers [] = ""
showUsers ((User name age):us) = "User " ++ name ++ " ist " ++ (show age) ++ " Jahre alt." 
    ++ "\n" 
    ++ showUsers us

addUser :: User -> Users -> Either String Users
addUser (User name age) [] 
    | age < 0 = Left ageErrorMessage
    | otherwise = Right [(User name age)]
    where 
        ageErrorMessage = "Alter kann nicht 0 sein."
addUser (User name age) (u:us) 
    | age < 0 = Left ageErrorMessage
    | otherwise = Right ((User name age):u:us)
    where 
        ageErrorMessage = "Alter kann nicht 0 sein."

readNumber :: String -> Either String Int
readNumber input = 
    case reads input of 
        [(number,"")] -> Right number
        _ -> Left "Alter muss eine Zahl sein."

readUser :: IO (Either String User)
readUser = do
    putStrLn "Bitte Namen eingeben:"
    name <- getLine
    putStrLn "Bitte Alter eingeben:"
    age <- getLine
    case readNumber age of
        Right n -> return (Right (User name n))
        Left message -> return (Left message)

findUser :: User -> Users -> Either String Users
findUser user [] = Left "User konnte nicht gefunden werden."
findUser (User n1 a1) ((User n2 a2):us)
    | n1 == n2 && a1 == a2 = 

userApp :: Users -> IO ()
userApp users = do
    putStrLn "1 - User anzeigen"
    putStrLn "2 - User hinzufügen"
    putStrLn "3 - User löschen"
    putStrLn "4 - Eingabe beenden"
    input <- getLine
    case input of
        "1" -> do 
            putStrLn (showUsers users)
            userApp users
        "2" -> do
            newUser <- readUser
            case newUser of 
                Right user -> do
                    let updatedUsers = addUser user users 
                    case updatedUsers of
                        Right currentUsers -> do
                            putStrLn "User erfolgreich eingefügt."
                            userApp currentUsers
                        Left message -> do
                            putStrLn message 
                            userApp users
                Left message -> do
                    putStrLn message
                    userApp users
        "4" -> putStrLn "Anwendung beendet."
        _ -> do 
            putStrLn "Ungültige Eingabe."
            userApp users



   
