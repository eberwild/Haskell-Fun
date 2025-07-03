-- ETA-Reduction
-- hierbei werden Funktionen umgeformt und überflüssige Argumente werden entfernt
-- dadurch : kürzerer Code , Ausdrucksstärker und eine klare Trennugn von Funktionen und Werten
-- f x = g x
   -- vorausgesetzt f und g haben den selben Typen und x kommt auf der 
   -- rechten Seite ausschließlich als letztes Argument vor 
   -- also am Ende der Funktionsdefinition und nur einmal verwendet !!
main :: IO()
main = do
    let hello = sayHello "Kevin"
    print hello

-- ohne ETA Reduktion
sayHello :: String -> String
sayHello name = "Hello ," ++  name

-- mit ETA Reduktion
-- name kommt nur einmal vor und ist das letzte Argument in der Funktionsdefinition
sayHello2 :: String -> String 
sayHello2 = ("Hello ,"  ++ )