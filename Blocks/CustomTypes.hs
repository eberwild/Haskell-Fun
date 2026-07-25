data MyPlayer = MyPlayer String Int
player1 = MyPlayer "Max" 5
player2 = MyPlayer "Anna" 8
getPoints :: MyPlayer -> Int
getPoints (MyPlayer _ score) = score

data Symbol = Herz | Karo | Kreuz | Pik
type Number = Int
data Card = Card Symbol Number
card1 = Card Herz 5
card2 = Card Karo 10
getSymbol :: Card -> Symbol 
getSymbol (Card symbol _ ) = symbol

data Zustand = Dead | Alive
type Name = String
data Player = Player Name Zustand
playerone = Player "Harry" Alive
playertwo = Player "Jude" Alive

type Kontostand = Double
newtype Kontonummer = Kontonummer Int
    deriving Show
data Konto = Konto Kontonummer Kontostand
    deriving Show
konto1 = Konto (Kontonummer 12345) 1600.00
konto2 = Konto (Kontonummer 54321) 8761.57
kontonummerToInt :: Kontonummer -> Int
kontonummerToInt (Kontonummer x) = x
getKontonummer :: Konto -> Kontonummer
getKontonummer (Konto nummer balance) = nummer
getBalance :: Konto -> Kontostand
getBalance (Konto nummer balance) = balance
isRich :: Konto -> Bool
isRich (Konto _ balance) = if balance > 5000
                            then True
                            else False
deposit :: Kontostand -> Konto -> Konto
deposit amount (Konto nummer balance) = Konto nummer (balance + amount)
withdraw :: Kontostand -> Konto -> Konto
withdraw amount (Konto nummer balance) = if balance >= amount 
                                            then Konto nummer (balance - amount)
                                            else Konto nummer balance                                        
accountInfo :: Konto -> String 
accountInfo (Konto nummer balance) = "Konto " ++ show (kontonummerToInt nummer) ++ " hat einen Kontostand von " ++ show balance



