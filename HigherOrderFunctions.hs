-- normale funktion mit 2 input werten 
add:: Int -> Int -> Int
add num1 num2 = num1 + num2

-- higher ordered funktion -> nimmt eine andere Funktion als input entgegen
higher :: (Int -> Int -> Int) -> Int -> Int -> Int
higher func x y = func x y

add3 :: Int -> Int
add3 x = x +3

higher3 :: (Int -> Int) -> Int -> Int
higher3 func x = func x

main:: IO()
main = do
    let result = higher add 3 4
    let result2 = higher3 add3 5
    print result
    print result2
    
    