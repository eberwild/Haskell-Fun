-- take n list -> gibt die ersten n Elemente einer Liste zurück 
--         take 3 [1,2,3,4,5,6,7,8,9] -> [1,2,3]

-- drop n list  -> gibt die Liste ohen die ersten n Elemente zurück
--         drop 3 [1,2,3,4,5,6,7,8,9,] -> [4,5,6,7,8,9]

-- null list  -> gibt an ob eine Liste leer ist 
--         null [] -> true   

-- length list -> gibt die Länge einer Liste zurück , also die Anzahl der Elemente
--         length [1,2,3] -> 3    

-- head list -> gibt das erste Element einer Liste zurück 
--         head [1,2,3] -> 1      

-- tail list -> gibt die Liste ohne das erste Element zurück
--           -> tail [1,2,3,4,5] -> [2,3,4,5]

-- last list -> gibt das letzte Element einer Liste zurück
--         last  [1,2,3] -> 3

-- init list -> gibt die Liste ohne das letzte Element zurück 
--         init [1,2,3,4,5] -> [1,2,3,4]

-- splitAt n  list -> teilt die Liste an der Stelle n durch ein Kommata
--         splitAt 3 "abcdefg" -> ("abc","defg")

-- list !! n -> gibt das Element der Liste zurück welches am Index n ist wobei der Index bei 0 startet
--         "abcdefg" !! 3 -> d

-- reverse list -> dreht die Liste um
--         reverse "abc" -> "cba"

-- list ++ list -> konkatiniert 2 Listen zu einer Liste
--         "abc" ++ "def" -> "abcdef"

-- zip list list -> führt die Elemente der beiden Listen an den gleichen Indizes zu einem Tupel zusammen -> Liste aus Tuppel
--               -> wenn eine Liste länger ist , dann wird diese abgeschnitten
--         zip [1,2,3] [4,5,6] -> [(1,4) , (2,5) , (3,6)]

-- concat list[list,list] -> fügt Listen innerhalb einer anderen Liste zu einer einzigen Liste zusammen
--         concat [[1,2,3], [4,5]] -> [1,2,3,4,5]
--                WICHTIG -> concat arbeitet nur auf der obersten Ebene , eine Ebene von Listen wird entfernt
--                        -> Haskell : keine unterschiedlichen Datentypen in einer Liste    [Int] != Int
--         concat [[1,2,3], [4,[5],6],[7]] -> [1,2,3,4,[5],6,7] : würde aufgrund von unterschiedlichen Datentypen einen Fehler ausgeben

-- map (funktion) List -> wendet eine Funktione auf alle Elemente einer Liste an
--         map(\x -> x*2)[1,2,3] -> [2,4,6]   hier mit anonymer Funktion

-- filter (Bedingung) List -> behält nur die Elemente die auch die Bedingung erfüllen
--         filter(\x -> x > 3) [1,2,3,4,5] -> [4,5]  hier mit anonymer Funktion

-- foldr (Funktion) (Init Value) (List) -> faltet die Liste von rechts nach links
--         foldr (\x new -> new ++ [x]) [] [1,2,3]