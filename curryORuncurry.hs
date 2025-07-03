main :: IO()
main = do 
    -- partielle Anwendung von Funktionen durch currying
    -- wir geben das erste Argument an und speichern dies in einer Variablen
    -- das zweite Argument kann dann einfach danach an die Variable übergeben werden
    let add2 = add 2
    print (add2 5)

    let power2 = power 2
    print (power2 4)

    print (uncurryTimes (2,4))
    print (uncurryPower (2,2))

add :: Int -> (Int -> Int)
add x y = x + y

power :: Int -> Int -> Int 
power x y = x^y

uncurryPower :: (Int , Int) -> Int
uncurryPower = uncurry power

times :: Int -> Int -> Int 
times x y = x * y

-- uncurry -> zwingt die Funktion ein Tuppel entgegen zu nehmen
-- nimmt eine curry Funktion entgegen mit dem Keyword uncurry wird dies realisiert
uncurryTimes :: (Int, Int) -> Int
uncurryTimes  = uncurry times