-- erstellt einen echten neuen typ
-- konstruktor ist nötig um mit dem neuen datentyp zu arbeiten
-- Shape kann einer der beiden werte annehmen , argumente können auch an die werte übergeben werden
data Shape = Circle Float | Rectangle Float Float

main :: IO ()
main = do


unitSquare :: Shape
unitSquare = Rectangle 1.0 1.0

square :: Float -> Shape
square n = Rectangle n n

circle :: Float -> Shape
circle n = Circle n

calcArea :: Shape -> Float
calcArea (Circle r) = pi * r^2
calcArea (Rectangle h w) = h * w