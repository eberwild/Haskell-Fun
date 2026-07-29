type User = String
type Users = [User]

myUsers :: Users
myUsers = ["Pat" , "Zinzii" , "Reina" , "Daria" , "Pumi"]

otherUsers :: Users
otherUsers = []

addUser :: String -> Users -> Either String Users
addUser input [] 
    | inputLength < 1 = Left emptyMessage
    | otherwise = Right [input]
    where inputLength = length input
          emptyMessage = "Keine leere Eingabe erlaubt."
addUser input (u:us)
    | length input < 1 = Left emptyMessage
    | otherwise = Right (input:u:us)
    where inputLength = length input
          emptyMessage = "Keine leere Eingabe erlaubt."

findUser :: User -> Users -> Maybe User
findUser _ [] = Nothing
findUser user (u:us) = if user == u
                        then Just u
                        else findUser user us

removeUser :: User -> Users -> Either String Users
removeUser user users = 
    case findUser user users of 
        Just u -> Right (filter (\x -> x /= u) users)
        Nothing -> Left notFoundMessage
        where 
            notFoundMessage = "User konnte nicht gefunden werden."

userApp :: Users -> IO ()
userApp users = do
    putStrLn "1 - Benutzer hinzufügen"
    putStrLn "2 - Benutzer anzeigen"
    putStrLn "3 - Benutzer finden"
    putStrLn "4 - Benutzer entfernen"
    putStrLn "5 - Beenden"
    choice <- getLine -- String
    case choice of
        "1" -> do
            putStrLn "Bitte geben Sie den Namen des neuen Nutzers ein :"
            newUser <- getLine
            let newUsers = addUser newUser users
            case newUsers of
                Right newUsers -> userApp newUsers
                Left message -> putStrLn message
        "2" -> do
            putStrLn (show users)
            userApp users
        "3" -> do
            putStrLn "Welcher User wird gesucht?"
            input <- getLine
            let result = findUser input users
            case result of
                Just user -> do
                    putStrLn ("User " ++ (show user) ++ " gefunden.")
                    userApp users
                Nothing -> do
                    putStrLn "User nicht gefunden."
                    userApp users
        "4" -> do
            putStrLn "Welcher User soll entfernt werden?"
            input <- getLine
            let result = removeUser input users
            case result of 
                Right updatedUsers -> do
                    putStrLn ("User " ++ (show input) ++ " erfolgreich entfernt.")
                    userApp updatedUsers
                Left message -> do
                    putStrLn message
                    userApp users
        "5" -> putStrLn "Anwednung wird beendet."
        _ -> do
            putStrLn "Ungültige Eingabe."
            userApp users


