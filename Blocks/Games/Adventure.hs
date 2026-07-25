type Name = String
type Gold = Int
type Inventar = [String]
newtype HP = HP Int
    deriving Show
data Hero = Hero Name HP Gold Inventar
    deriving Show

hero1 = Hero "Luffy" (HP 100) 0 ["Strohhut" , "Sandalen"]
hero2 = Hero "Zoro" (HP 100) 50 ["Schwert" , "Schwert" , "Schwert"]
hero3 = Hero "Nami" (HP 50) 200 ["Orangen" , "Klimastock" , "Zeus"]

addItem :: String -> Hero -> Hero
addItem item (Hero name hp gold inventar) =
    (Hero name hp gold (item : inventar))

removeItem :: String -> Hero -> Hero
removeItem item (Hero name hp gold inventar) =
    (Hero name hp gold (filter (\x -> x /= item) inventar))

collectGold :: Gold -> Hero -> Hero
collectGold amount (Hero name hp gold inventar ) =
    (Hero name hp newGold inventar )
    where newGold = gold + amount

buyItem :: Gold -> String -> Hero -> Maybe Hero
buyItem amount item (Hero name hp gold inventar)
    | gold >= amount = Just (Hero name hp (gold - amount) (item : inventar))
    | otherwise = Nothing

richHeros :: Gold -> [Hero] -> [Hero]
richHeros amount heroList = filter (\(Hero name hp gold inventar) -> gold > amount) heroList

totalGold :: [Hero] -> Gold
totalGold heroList = foldr (\(Hero _ _ gold _) acc -> gold + acc ) 0  heroList

    
