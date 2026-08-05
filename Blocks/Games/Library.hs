type BookId = Int
type Person = String

data Status = Available| Borrowed Person
    deriving Show

type Library = [(BookId, Status)]

test :: Library
test = [(1 , Available) , (2 , Borrowed "Nico Robin") , (3 , Available) , (4 , Borrowed "Biblo") , (5 , Available)]

initialLibrary :: Library 
initialLibrary = [(x , Available) | x <- [1..5]]

taken :: Library -> BookId -> Maybe Person
taken [] _ = Nothing
taken ((id , status) : xs) bid
    | id == bid = case status of
                    Available -> Nothing
                    Borrowed name -> Just name
    | otherwise = taken xs bid

borrowBook :: Person -> BookId -> Library -> Library
borrowBook _ _ [] = []
borrowBook name bid lib@((id , status) : xs) 
    | bid == id = case status of 
            Borrowed _ -> (id , status) : xs
            Available -> (id , Borrowed name) : xs
    | otherwise = (id , status) : borrowBook name bid xs

availableBooks :: Library -> Int
availableBooks [] = 0
availableBooks library = helper library 0

helper :: Library -> Int -> Int
helper [] count = count 
helper ((id , status) : xs) count = case status of
                            Available -> helper xs (count+1)
                            Borrowed _ -> helper xs count

returnBook :: BookId -> Library -> Library
returnBook bid [] = []
returnBook bid ((bookId , status) : xs) 
    | bid == bookId = case status of
                Borrowed _ -> (bookId , Available) : xs
                Available -> (bookId , status) : xs
    | otherwise = (bookId , status) : returnBook bid xs

libraryEmpty :: Library -> Maybe String
libraryEmpty [] = Nothing
libraryEmpty ((bid , status) : xs) = 
    case status of 
        Available -> libraryEmpty xs
        Borrowed _ -> Just "Books are borrowed." 

mostBooks :: Library -> Maybe Person
mostBooks [] = Nothing
mostBooks library = g library (Person , maxCount)

g :: Library ()
        
    