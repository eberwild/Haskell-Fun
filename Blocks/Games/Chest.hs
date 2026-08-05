data Player = Player1 | Player2
    deriving Show
type Situation = ([Int] , [Int] , [Int])
data Result = Draw | Won Player
    deriving Show

initialSituation :: Situation
initialSituation = ([1,2,3,4,5,6,7,8] , [] , [])

test :: Situation 
test = ([1,3,4,6,8] , [2,5] , [7])

openedBy :: Situation -> Int -> Maybe Player
openedBy (closed , p1 , p2) value 
    | value `elem` p1 = Just Player1
    | value `elem` p2 = Just Player2
    | otherwise = Nothing

takeChest :: Player -> Int -> Situation -> Situation
takeChest player value (closed , p1 , p2) = 
    if value `elem` closed 
        then case player of
            Player1 -> ((filter (\x -> x /= value) closed) , (value:p1) , p2 )
            Player2 -> ((filter (\x -> x /= value) closed) , p1 , (value:p2) )
        else (closed , p1 , p2)
                                        

hasCombo :: [Int] -> Bool
hasCombo [] = False
hasCombo [_] = False
hasCombo (x:xs)
    | searchSecond x xs = True
    | otherwise         = hasCombo xs
--[1,2,3,4,5,6,7]
searchSecond :: Int -> [Int] -> Bool
searchSecond _ [] = False
searchSecond _ [_] = False
searchSecond first (y:ys)
    | needed `elem` ys = True
    | otherwise        = searchSecond first ys
    where
        needed = 15 - (first+y)







    

    
    
