main :: IO()
main = do
        let myNumbers = [1,2,3,4,5,6,7,8,9]
        print ("Alle Zahlen quadrieren : " ++ show (squares myNumbers))
        print ("Nur gerade quadrieren : " ++ show (evenSquares myNumbers))
        print ("Tuppel : " ++ show (pairDivisible myNumbers))
        print ("Ohne Elemente aussen : " ++ show (getMiddle myNumbers))
       -- print ("Array halbiert : " ++ show (splitHalf myNumbers))

-----------------------------List Comprehension Tasks-----------------------------

-- quadriere alle Zahlen einer Liste
squares :: [Int] -> [Int]
squares list = [x^2 | x <- list]

-- quadriere nur gerade Zahlen einer Liste
evenSquares :: [Int] -> [Int]
evenSquares list = [x^2 | x <- list , even x]

-- Tuppel in einer Liste finden bei denen x durch y teilbar ist aber x nicht gleich y ist
pairDivisible :: [Int] -> [(Int,Int)]
pairDivisible list = [(x,y) | x <- list , y <- list , x `mod` y == 0 
                                                    , x /= y ]

-----------------------------List Operation Tasks-----------------------------  

-- entferne das erste und das letzte Element einer Liste
getMiddle :: [Int] -> [Int]
getMiddle list = tail (init list)

-- gibt 2 gleich große Teillisten einer Liste zurück -> wenn ungerade ist der erste Teil kürzer
--splitHalf :: [Int] ->([Int],[Int])
--splitHalf list = 
       -- let n = length list
       -- if n `mod` 2 == 0 
          --  then splitAt n list
         --   else splitAt ((n-1) / 2)