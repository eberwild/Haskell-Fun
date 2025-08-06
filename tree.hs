data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

main :: IO()
main = do 
    let  exampleTree = Node 
                            (Leaf 1)
                            (Node (Leaf 2) (Node (Leaf 3) (Leaf 4)))

    print(getTreeHight exampleTree)
    let mirrored = mirrorTree exampleTree
    print mirrored


getTreeHight :: Tree a -> Int
getTreeHight (Leaf _)  = 1
getTreeHight (Node l r) = 1 + max ( getTreeHight l) (getTreeHight r)

mirrorTree :: Tree a -> Tree a
mirrorTree (Leaf x) = Leaf x
mirrorTree (Node l r) = Node (mirrorTree l) (mirrorTree r)