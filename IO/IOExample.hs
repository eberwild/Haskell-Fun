import  Text.Read (readMaybe)

main :: IO()
main = do
    let myList = [1,2,3,4,5]
    let myEmptyList = []
    print ( safeHead myList)
    print ( safeHead myEmptyList)

safeHead :: [Int] -> Int
safeHead [] = fromJust Nothing
safeHead (x:_) = fromJust (Just x)

fromJust :: Maybe Int -> Int
fromJust (Just x) = x
fromJust Nothing = 0

-- fragt den user nach ein nummer und verdoppelt diese
doubleInput :: IO()
doubleInput = do
    putStrLn "Please enter a valid number!"
    number <- getLine
    case readMaybe number :: Maybe Int of
        Nothing -> putStrLn "That was not a valid number.."
        Just number -> putStrLn ("Doubled: " ++ show (number * 2))
    

-- nimmt userInput und gibt diesen einfach wieder als IO-String aus
echoInput :: IO()
echoInput = do
    putStrLn "Please enter anything to be printed out: "
    input <- getLine
    putStrLn ("You typed: " ++ input)

getNumberOfInput :: IO()
getNumberOfInput = do 
    putStrLn "How many numbers would you like to enter ?"