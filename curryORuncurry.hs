-- curry -> teilt eine Funktion mit mehreren Argumenten in Einzelfunktionen auf damit diese teilweise angewendet werden können
-- uncurry -> eine Funktion muss als Input ein Tuppel entgegennehmen um einen Output zu generieren 

main :: IO()
main = do 
    -- partielle Anwendung von Funktionen durch currying
    -- wir geben das erste Argument an und speichern dies in einer Variablen
    -- das zweite Argument kann dann einfach danach an die Variable übergeben werden

    let add2 = add 2
    print (add2 5)
    print (add2 8)
    print( add 2 2)

    -- hier -> ein fester Wert wird mit jedem Element der Liste einzeln durch map verrechnet
    let numbers = [1,2,3,4]
    let multi3 = multiply 3
    print (multi3 4)
    print(map multi3 numbers)

    let power2 = power 2
    print (power2 4)

    print (uncurryTimes (2,4))
    print (uncurryPower (2,2))

-- so werden Funktionen in Haskell default dargestellt 
-- wir geben einen Input an und erhalten eine Funktion zurück die dann einen weiteren Input erwartet
add :: Int -> (Int -> Int)
add x y = x + y

uncurryadd :: (Int , Int) -> Int
uncurryadd = uncurry add

-- curry Funktionsdarstellung
multiply :: Int -> Int -> Int 
multiply x y = x * y

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