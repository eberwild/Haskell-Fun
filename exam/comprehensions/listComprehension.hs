-- [operation | generator(en) , bedingung(en)]   -> aufbau einer list comprehension
-- operation = was wird mit dem/den elementen gemacht
-- generator = woher kommen die werte
-- bedingung = filter mit welchen werten wir arbeiten wollen
main :: IO ()
main = do
    let myList = [1,2,3,4,5]
    let myOtherList = [1,3,5,7,9]
    let words = ["Hallo" , "Haskell" , "ist" , "garnicht" , "so" , "schlimm"]
    let wordlength = wordlengths words
    let newList = doubleListElements myList
    let tuppelList = biggerYwithX myList myOtherList
    let pairEvenTuppel = pairEvenSum myList
    print newList
    print tuppelList
    print pairEvenTuppel
    print wordlength

-- nimmt eine liste mit int werten entgegen und gibt eine liste mit 
-- verdoppelten werten für alle geraden integr aus der input list aus
doubleListElements :: [Int] -> [Int]
doubleListElements [] = []
doubleListElements list = [x*2 | x <- list , even x]

-- nimmt 2 listen entgegen und gibt eine liste von tuppeln aus in welcher
-- alle werte aus der zweiten liste größer als ein element aus der ersten liste ist
biggerYwithX :: [Int] -> [Int] -> [(Int,Int)]
biggerYwithX list1 list2 = [(x,y) | x <- list1 ,
                                    y <- list2 , 
                                    y > x]

-- nimmt eine liste aus integern entgegen und gibt eine liste aus tuppeln zurück in der
-- y größer als x ist und die summe aus x und y gerade ist
pairEvenSum :: [Int] -> [(Int,Int)]
pairEvenSum list = [(x,y) | x <- list ,
                            y <- list ,
                            y > x ,
                            even (x+y)]

-- nimmt eine liste von strings entgegen und gibt eine liste mit der länge jedes wortes 
-- in der richtigen reihenfolge aus
wordlengths :: [String] -> [Int]
wordlengths list = [length x | x <- list , length x > 0]

-- nimmt einen char und eine liste mit strings und gibt eine liste aus einem tuppel mit dem char 
-- und einer liste mit allen wörtern welche mit diesen char beginnen
filterForFirstLetter :: Char -> [String] -> [(Char , [String])]
filterForFirstLetter c list = [(c , [word | word <- list , head word == c])]