import Text.Read (readMaybe)

data Color =  Yellow | Red | Blue | Green | Blank
    deriving Show
data Card = Card Color Value
    deriving Show
type Value = Int
type Deck = [Card]

createNormalDeck :: Deck
createNormalDeck = [(Card x y) | x <- [Yellow,Red,Blue,Green]  , y <- [1..13]] 

createSpecialDeck :: Deck 
createSpecialDeck = [(Card x y) | x <- [Blank] , y <- [14,14,14,14,0,0,0,0]]

gameReadyDeck :: Deck
gameReadyDeck = createNormalDeck ++ createSpecialDeck

----------------------------------------------------------------------------------------

data Player = Player Name Wanted Actuall Points
    deriving Show
data GameFinishedPlayer = End Name Points
    deriving Show
type Name = String
type Wanted = Int
type Actuall = Int
type Points = Int

testPlayer :: Player 
testPlayer = Player "Karl" 0 0 0

testList :: [Player]
testList = [(Player "Gina" 0 0 0) , (Player "Borni" 0 0 0) , (Player "Kevin" 0 0 0)]

-- einzelner player wird anhand seiner schätzung punktemäßig aktualisert
calculatePoints :: Player -> Player 
calculatePoints (Player name wanted actuall points) = 
    case wanted == actuall of
        True -> Player name 0 0 (points + 20 + (actuall*10))
        False -> Player name 0 0 (points - (abs ((wanted - actuall) * 10)))

ioWhile :: a -> (a -> Bool) -> (a -> IO a) -> IO a
ioWhile start p body = loop start
  where
    loop x =
      if p x
        then do
          x' <- body x
          loop x'
        else
          return x

simulateRounds :: IO ()
simulateRounds = do
    putStrLn "Wie viele Spieler machen mit (3-6) ?"
    rounds <- getLine
    case readMaybe rounds::Maybe Int of
        Nothing -> do
            putStrLn "Eingabe muss eine Ganzzahl sein."
            simulateRounds
        Just 0 -> putStrLn "Anwendung beendet -> durch return () ohne Ausgabe."
        Just n -> case playerToRounds n of 
                    Nothing -> putStrLn "Unzulässige Anzahl an Spielern."
                    Just n -> do
                        (_ , players , _) <- ioWhile (n , testList , 1)
                                (\(n,_,_) -> n > 0)
                                (\(n , playerlist, counter) -> do
                                    updatedHits <- getHits playerlist
                                    putStrLn ("Runde " ++ (show counter) ++ " ist vorbei.")
                                    let newRound = updatePlayerList updatedHits
                                    putStrLn (show newRound)
                                    return ((n-1) , newRound , (counter+1))
                                )
                        putStrLn (show (convertPlayer players))

-- wandelt die anzahl der spieler in die dafür vorgesehende rundenzahl um
playerToRounds :: Int -> Maybe Int
playerToRounds value 
    | value < 3 = Nothing
    | value == 3 = Just 20
    | value == 4 = Just 15
    | value == 5 = Just 12
    | value == 6 = Just 10
    | otherwise = Nothing

-- playerliste wird anhand der eingegebenen hits aktualisiert zurückgegeben
getHits :: [Player] -> IO [Player]
getHits [] = return []
getHits ((Player name _ _ points):ps) = do
    putStrLn ("Erwartet von " ++ name)
    wanted <- readLn
    putStrLn ("Bekommen von " ++ name)
    got <- readLn
    updatedPlayers <- getHits ps
    return (Player name wanted got points : updatedPlayers)
    

-- für jeden player werden die punkte berechnet und die updated list wird zurückgegeben
updatePlayerList :: [Player] -> [Player]
updatePlayerList [] = []
updatePlayerList (p:ps) = calculatePoints p : updatePlayerList ps

-- entfernt felder welche zur berechnung des endergebnisses nicht mehr gebraucht werden
convertPlayer :: [Player] -> [GameFinishedPlayer]
convertPlayer [] = []
convertPlayer ((Player name _ _ points) : ps) =
    (End name points) : convertPlayer ps

-- sortiert die playerliste von platz 1 an abfallend




        
                

    

    




