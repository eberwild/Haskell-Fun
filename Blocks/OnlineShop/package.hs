type PackageId = Int
type Weight = Int
type Package = (PackageId,Weight)

type Warehouse = [Package]

warehouse :: Warehouse
warehouse =
    [(101,5),(102,12),(103,7),(104,20),(105,3)]

heaviestPackage :: Warehouse -> Maybe Package
heaviestPackage [] = Nothing
heaviestPackage ((pid,weight) : ps) = Just (helper (pid,weight) ps)

helper :: Package -> Warehouse -> Package
helper package [] = package
helper (pid,pmax) ((pid2,pweight) : ps) 
    | pmax > pweight = helper (pid,pmax) ps
    | otherwise = helper (pid2,pweight) ps

secondHeaviestPackage :: Warehouse -> Maybe Package
secondHeaviestPackage [] = Nothing
secondHeaviestPackage warehouse = 
    case heaviestPackage warehouse of 
        Nothing -> Nothing
        Just (maxid,maxweight) -> helper2 (maxid,maxweight) Nothing (filter (\(pid,pweight) -> pid /= maxid) warehouse )

helper2 :: Package -> Maybe Package -> Warehouse -> Maybe Package
helper2 max Nothing [] = Nothing
helper2 max (Just second) [] = Just second
helper2 max second ((currentid,currentweight) : ps) =
    case second of 
        Nothing -> helper2 max (Just (currentid,currentweight)) ps
        Just (sid,sweight) -> 
            if currentweight > sweight 
                then helper2 max (Just (currentid,currentweight)) ps
                else helper2 max (Just (sid,sweight)) ps

weightDifference :: Warehouse -> Maybe Int
weightDifference warehouse = 
    case heaviestPackage warehouse of
        Nothing -> Nothing
        Just (maxid,maxweight) -> case secondHeaviestPackage warehouse of
                                    Nothing -> Nothing
                                    Just (secid,secweight) -> Just (maxweight - secweight)
  
    