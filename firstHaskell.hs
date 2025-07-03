main :: IO ()
main = do
    let c = 1  -- Beispielwert für c (hier z.B. 2 für zweiziffrige Zahlen)
    let list = [(x, y) | x <- [10^(c-1)..10^c - 1],
                         y <- [10^(c-1)..10^c - 1],
                         y >= 2 * x,
                         (x + y) < 10^c]
    print list  -- Gibt die Liste der Paare aus
    let result = addTwoNumbers 5 7 
    print result
    let bigger = findMax 3 4
    print bigger
    let bigger2 = findMaxWithGuards 4 7
    print bigger2

addTwoNumbers :: Integer -> Integer -> Integer
addTwoNumbers x y = x + y

findMax :: Integer -> Integer -> Integer
--findMax x y = if x > y then x else y
findMax x y =  max x y 

-- alternativ mit sogenannten Guards
findMaxWithGuards :: Integer -> Integer -> Integer
findMaxWithGuards x y
    | x > y     = x
    | otherwise = y


