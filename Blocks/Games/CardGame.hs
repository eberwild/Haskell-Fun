data Symbol = Herz | Karo | Pik | Kreuz
    deriving (Show,Eq)
type Value = Int
type Name = String
data Card = Card Symbol Value
    deriving Show
data Player = Player Name [Card]
    deriving Show

player1 = Player "Hawkins" []

cardSymbols :: [Symbol]
cardSymbols = [Herz,Pik,Karo,Kreuz]

createDeck :: [Card]
createDeck = [(Card symbol value) | symbol <- cardSymbols , value <- [1..13]]

countCards :: [Card] -> Int
countCards [] = 0
countCards (x:xs) = 1 + countCards xs

getCardsOfSymbol :: Symbol -> [Card] -> [Card]
getCardsOfSymbol arg deck = [ (Card symbol value) | (Card symbol value) <- deck , arg == symbol]

cardSymbol :: Symbol -> [Card] -> [Card]
cardSymbol _ [] = []
cardSymbol arg ((Card symbol value):xs)
    | arg == symbol = (Card symbol value) : cardSymbol arg xs
    | otherwise = cardSymbol arg xs

getCardValues :: [Card] -> [Value]
getCardValues [] = []
getCardValues (Card _ value : xs) = value : getCardValues xs

countSymbol :: Symbol -> [Card] -> Int
countSymbol _ [] = 0
countSymbol arg (Card symbol value : xs) 
    | arg == symbol = 1 + countSymbol arg xs
    | otherwise = countSymbol arg xs

drawCard :: Player -> Card -> Player
drawCard (Player name cards) card = (Player name (card:cards))

sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

handValue :: Player -> Int
handValue (Player _ cards) = (sumList . getCardValues) cards

player = Player "Kilian Mbappe" [Card Herz 7 , Card Pik 1 , Card Pik 8 , Card Karo 6]

getValue :: Card -> Value
getValue (Card _ value) = value

highestCard :: Player -> Maybe Card
highestCard (Player _ []) = Nothing
highestCard (Player _ (x:xs)) = Just (findMax x xs)
    where 
        findMax :: Card -> [Card] -> Card
        findMax currentMax [] =  currentMax
        findMax currentMax (y:ys) 
            | getValue currentMax >= getValue y = findMax currentMax ys
            | otherwise = findMax y ys

hasWon :: Player -> Bool
hasWon player = (handValue player) >= 21

winner :: Player -> Player -> Maybe Player 
winner player1 player2 
    | hasWon player1 && hasWon player2 = Nothing
    | hasWon player1 && not (hasWon player2) = Just player1
    | hasWon player2 && not (hasWon player1) = Just player2
    | otherwise = Nothing
    
higherHand :: Player -> Player -> Player 
higherHand p1 p2
    | handp1 > handp2 = p1
    | handp2 > handp1 = p2
    | otherwise = p1
    where 
        handp1 = handValue p1
        handp2 = handValue p2

highCard :: [Card] -> Maybe Card
highCard [] = Nothing
highCard (x:xs) = Just (findMax x xs)
    where
        findMax :: Card -> [Card] -> Card
        findMax currentMax [] = currentMax
        findMax currentMax (y:ys) 
            | getValue currentMax >= getValue y = findMax currentMax ys
            | otherwise = findMax y ys

disCardHighest :: Player -> Maybe Player
discardHighes (Player _ []) = Nothing
disCardHighest (Player name cards) = 
    Just (Player name (filter (\card -> getValue card < maxCard) cards))
    where maxCard = (getValue . getCard . highCard) cards

getCard :: Maybe Card -> Card
getCard (Just card) = card
