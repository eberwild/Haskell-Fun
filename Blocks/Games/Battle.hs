type Name = String
newtype ATK = ATK Int
    deriving Show
newtype HP = HP Int
    deriving Show
data Player = Player Name ATK HP
    deriving Show

player1 = Player "Ruffy" (ATK 10) (HP 65)
player2 = Player "Kaido" (ATK 35) (HP 150)
player3 = Player "Shanks" (ATK 30) (HP 75)

getHP :: Player -> HP
getHP (Player _ _ hp) = hp

hptoInt :: HP -> Int
hptoInt (HP x) = x

getATK :: Player -> ATK
getATK (Player _ atk _) = atk

atktoInt :: Player -> ATK
atktoInt (ATK x) = x

damage :: Int -> Player -> Player
damage value (Player name atk hp) 
    | restHP >= 0 = Player name (HP restHP)
    | otherwise = Player name (HP 0)
    where intHP = hptoInt hp
          restHP = intHP - value

isDead :: Player -> Bool 
isDead (Player name atk hp) 
    | hpInt > 0 = False
    | otherwise = True
    where hpInt = hptoInt hp

attack :: Player -> Player -> Player
attack (Player name1 atk1 hp1) (Player name2 hp2 atk2) =
    (Player name2 atk2 (newHP))
    where newHP = ((hptoInt hp2) - (atktoInt atk1))

heal :: Int -> Player -> Player 
heal value (Player name atk hp) 
    | newHP > 100 = (Player name atk (HP 100))
    | otherwise = (Player name atk (HP newHP))
    where hpInt = hptoInt hp
          newHP = hpInt + value

fightround :: Int -> Player -> Player -> (Player , Player)
fightround value p1 (Player n2 hp2) = (p1 , Player n2 (HP newHP))
    where hpInt = hptoInt hp2
          newHP = hpInt - value

winner :: Player -> Player -> Maybe Player
winner p1 p2 
    | isDead p1 = Just p2
    | isDead p2 = Just p1
    | otherwise = Nothing