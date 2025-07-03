
main :: IO()
main = do
    let myList = [1,2,3,4,5]
    let names = ["Albert" , "Bruno" , "Ceasar" , "Dustin" , "Alex"]
    print (calcSum myList)
    let myTuppel = map (\x -> (head x , x)) names
    print myTuppel
    let mySum = foldr (\x acc -> x + acc) 0  myList
    print mySum
    let test = buildTupple names
    print test
    
calcSum :: [Int] -> Int
calcSum [] = 0
calcSum (first:rest) = first + calcSum rest

buildTupple :: [String] ->  [(Char , [String])]
buildTupple [] = 
buildTupple (first : rest) = [(head first ,[first])] ++ buildTupple rest



