data User = User UserId Name Cart [Order]
    deriving Show
data Product = Product Name ProductId Cost Available
    deriving Show
data Order = Order UserId Cart Cost
    deriving Show
data Available = Yes | No
    deriving (Show , Eq)
type ProductId = Int
type UserId = Int
type Name = String
type Cart = [Product]
type Cost = Double
type Products = [Product]

products :: Products
products =
    [ Product "Laptop" 1 999.99 Yes
    , Product "Mouse" 2 25.50 Yes
    , Product "Keyboard" 3 80.00 Yes
    , Product "Monitor" 4 250.00 No
    , Product "USB Cable" 5 10.00 Yes
    ]

users :: [User]
users =
    [ User 1 "Pat" [Product "Laptop" 1 999.99 Yes , Product "Mouse" 2 25.50 Yes] [Order 1 [Product "Laptop" 1 999.99 Yes,
                                                                                           Product "Mouse" 2 25.5 Yes] 
                                                                                           1025.49]
    , User 2 "Alex" [] []
    ]

myUser :: User 
myUser = User 3 "Piet" products [Order 1 [Product "Laptop" 1 999.99 Yes,
                                        Product "Mouse" 2 25.5 Yes] 
                                        1025.49]

myProduct :: Product
myProduct = Product "Printer" 6 65.95 Yes

findProduct :: ProductId -> Products -> Maybe Product
findProduct _ [] = Nothing
findProduct id ((Product name pid price inStock):ps) 
    | id == pid = Just (Product name pid price inStock)
    | otherwise = findProduct id ps

addToCart :: Product -> User -> User 
addToCart item (User id name [] orders) = User id name [item] orders
addToCart item (User id name cart orders) = User id name (item:cart) orders

addToCartSafe :: Product -> User -> Either String User 
addToCartSafe (Product pname pid price inStock) (User id name cart orders)
    | inStock == Yes = Right (User id name (newProduct:cart) orders)
    | otherwise = Left "Produkt nicht auf Lager."
    where 
        newProduct = (Product pname pid price inStock)

cartSum :: Cart -> Cost
cartSum [] = 0
cartSum ((Product name id price inStock): ps) = 
    price + cartSum ps

checkOut :: User -> Either String Order
checkOut (User _ _ [] _) = Left "Keine Produkte im Warenkorb."
checkOut (User id _ cart _) = Right (Order id cart (cartSum cart))

removeProduct :: ProductId -> Cart -> Cart
removeProduct _ [] = []
removeProduct id cart = filter (\(Product _ pid _ _ ) -> id /= pid ) cart

findUser :: UserId -> [User] -> Maybe User
findUser _ [] = Nothing
findUser uid (User id name cart orders: us) 
    | uid == id = Just (User id name cart orders)
    | otherwise = findUser uid us

addProductToUserCart :: UserId -> Product -> [User] -> [User]
addProductToUserCart uid product users = 
    case findUser uid users of
        Nothing -> users
        Just user -> case addToCartSafe product user of
            Left _ -> users
            Right safeUser -> safeUser : (filter (\(User id _ _ _) -> id /= uid) users)

unavailableProducts :: Products -> Products
unavailableProducts products = filter (\(Product _ _ _ inStock) -> inStock /= Yes) products
    
rekursiveUnavailable :: Products -> Products
rekursiveUnavailable [] = []
rekursiveUnavailable (Product name id price inStock : ps) 
    | inStock == No = (Product name id price inStock) : rekursiveUnavailable ps
    | otherwise = rekursiveUnavailable ps

placeOrder :: User -> Either String User
placeOrder user@(User id name cart orders) = 
        case checkOut user of
            Left message -> Left message
            Right order -> Right (User id name [] (order:orders))

placeOrderForUser :: UserId -> [User] -> Either String [User]
placeOrderForUser uid users = 
    case findUser uid users of 
        Nothing -> Left "User konnte nicht gefunden werden."
        Just user -> case placeOrder user of
            Left message -> Left message
            Right updatedUser -> Right (updatedUser : filter (\(User id _ _ _ ) -> id /= uid) users)

userRevenue :: User -> Cost
userRevenue (User id name cart []) = 0
userRevenue user@(User id name cart ((Order _ items cost):orders)) = 
    cost + userRevenue (User id name cart orders)



