data Tree a = 
    Empty 
    | Node a (Tree a) (Tree a)
    deriving Show

myTree :: Tree Int
myTree =
    Node 10
        (Node 5
            (Node 2 Empty Empty)
            (Node 7 Empty Empty))
        (Node 20
            Empty
            (Node 30 Empty Empty))

myList :: [Int]
myList = [1,2,3,4,5]

sumTree :: Tree Int -> Int
sumTree Empty = 0
sumTree (Node value left right) =
    value + sumTree left + sumTree right

countNodes :: Tree a -> Int
countNodes Empty = 0
countNodes (Node _ leftTree rightTree) = 
    1 + countNodes leftTree + countNodes rightTree

treeDepth :: Tree a -> Int
treeDepth Empty = 0
treeDepth (Node _ left right) =
    1 + (max (treeDepth left) (treeDepth right))

doubleTree :: Tree Int -> Tree Int
doubleTree Empty = Empty 
doubleTree (Node value left right) =
    (Node (value*2) (doubleTree left) (doubleTree right))

contains :: Eq a => a -> Tree a -> Bool
contains element Empty = False
contains element (Node value left right) 
    | element == value = True
    | otherwise = 
        contains element left || contains element right

flattenTree :: Tree a -> [a]
flattenTree Empty = []
flattenTree (Node value left right) =
    [value] ++ (flattenTree left) ++ (flattenTree right)

listToTree :: [a] -> Tree a
listToTree [] = Empty
listToTree (x:xs) = Node x (listToTree xs) Empty

mirrorTree :: Tree a -> Tree a
mirrorTree Empty = Empty
mirrorTree (Node value left right) = 
    Node value (mirrorTree right) (mirrorTree left)

treeMax :: Tree Int -> Maybe Int
treeMax Empty = Nothing
treeMax (Node value left right) =
    case (treeMax left , treeMax right) of
        (Nothing,Nothing) -> Just value
        (Just x , Nothing) -> Just (max value x)
        (Nothing , Just y) -> Just (max value y)
        (Just x , Just y) -> Just (max value (max x y))

    

