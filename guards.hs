import Distribution.Simple.Program.HcPkg (list)
-- Guards -> formuliert verschiedenen Bedingungen ähnlich wie if-else
--           es werden Funktionsdefinitionen benutzt
--           bieten eine klarere Struktur als if-elseif-elseif-else 
--           Die Reihenfolge der Guards ist bei überlappenden Bedingungen wichtig !!
--             -> wird von oben nach unten gechecked

--funktionName parameter
--  | bedingung1 = ausdruck1
--  | bedingung2 = ausdruck2
--  | otherwise  = ausdruckStandard


-- otherwise spiegelt hier den default-Fall wieder

main :: IO()
main = do   
        let numbers = [1,2,3,4,5]
        let one = [1]
        let empty = []
        print (pointsToGrade 88) -- gut
        print (pointsToGrade 45) -- nicht besstanden
        print (maxElement 3 4) -- 4
        print (maxElement 5 5) -- 0
        print (listInfo numbers) -- Die Liste hat mehrere Elemente
        print (listInfo one) -- Die Liste hat ein Element 
        print (listInfo empty) -- Die Liste ist leer

pointsToGrade :: Int -> String
pointsToGrade n 
        | n >= 90 = "Sehr gut"
        | n >= 80 = "Gut"
        | n >= 70 = "Befriedigend"
        | n >= 60 = "Ausreichend"
        | otherwise = "nicht bestanden"

maxElement :: Int -> Int -> Int
maxElement a b 
        | a > b = a
        | b > a = b
        | otherwise  = 0

-- "die Funktion angewandt auf eine Liste mit folgender Bedingung ergibt das"
listInfo :: [a] -> String
listInfo list | null list = "Die Liste ist leer"
listInfo list | length list == 1 = "Die Liste hat ein Element"
-- anstatt 'otherwise' einfach Bedingung weglassen
listInfo list   = "Die Liste hat mehrere Elemente"

-- Task 1
numberDetails :: Int -> String
numberDetails n 
        | n < 0 = "Die Zahl ist negativ"
        | n > 0 = "Die Zahl ist positiv"
        | otherwise = "Die Zahl ist 0"

-- Task 2
bmiCategory :: Double -> String
bmiCategory n
        | n < 18.5 = "Untergewicht"
        | n >= 18.5 && n <= 24.9 = "Normalgewicht"
        | n > 24.9 && n <= 29.9 = "Übergewicht"
        | otherwise = "Adipositas"

-- Task 3 
triangleType :: Double -> Double -> Double -> String
triangleType a b c 
        | not isTriangle = "kein Dreieck"
        | a == b && a == c = "gleichseitiges Dreieck"
        | a == b || a == c || b == c = "gleichschenkliges Dreieck"
        | otherwise = "ungleichseitiges Dreickeck"
        where 
            isTriangle = a < (b+c) && b < (a+c) && c < (a+b)
            