-- definiert einen neuen Typen Alias aber keinen neuen Typ
-- nur ein andere name 
-- Compiler behandelt Pos und (Int,Int) gleich
type Pos = (Int,Int)

main :: IO ()
main = do 
        let origin = (0,0)
        print (goLeft origin)

goLeft :: Pos -> Pos
goLeft (x,y) = (x-1,y)

goRight :: Pos -> Pos
goRight (x,y) = (x+1,y)
