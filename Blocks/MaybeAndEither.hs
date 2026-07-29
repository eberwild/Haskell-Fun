safeHead :: [a] -> Maybe a 
safeHead [] = Nothing
safeHead (x:_) = Just x

safeDivide :: Double -> Double -> Either String Double
safeDivide _ 0 = Left "Dont divide by Zero.."
safeDivide x y = Right (x/y)

fromMaybe :: a -> Maybe a -> a
fromMaybe x Nothing = x
fromMaybe _ (Just y ) = y

swapEither :: Either a b -> Either b a
swapEither (Left x) = (Right x)
swapEither (Right y) = (Left y)

applyMaybe :: (a -> b) -> Maybe a -> Maybe b
applyMaybe _ Nothing = Nothing
applyMaybe f (Just x) = Just(f(x))


