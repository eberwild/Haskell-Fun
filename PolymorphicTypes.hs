-- Remember -> Lists in haskell are homogeneous

-- a gibt hier den Typ innerhalb der Liste an -> daher bekommen wir diesen auch für das einzelne Element zurück
getFirst :: [a] -> a
getFirst list =  head list

-- die sichere Variante für den Fall dass die Liste leer ist  -> mit maybe und nothing
getFirstSave :: [a] -> Maybe a
getFirstSave [] = Nothing
getFirstSave (x:_) = Just x

combine :: [a] -> [b] -> [(a,b)]
combine list1 list2 = zip list1 list2

main::IO()
main = do
    let l1 = [1,2,3,4]
    let l2 = ['a','b','c']
    let combination = combine l1 l2
    print(combination)