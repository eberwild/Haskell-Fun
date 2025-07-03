import Data.Char (toLower)
import Data.List ( sort )

main :: IO()
main = do
        let word1 = "sILenT"
        let word2 = "LiStEN"
        let a = test word1 word2
        print a
        let charAt = showCharAt 3 word1
        print charAt

test :: String -> String -> Bool
test a b = sort (map toLower a) == sort (map toLower b)

-- '_' sagt aus : es ist ein Wert vorhanden , aber dieser interessiert jetzt niemanden
showCharAt :: Int -> String -> Maybe Char
showCharAt _ [] = Nothing
showCharAt 1 (first : _ ) = Just first
showCharAt n ( _ : rest) = showCharAt (n-1) rest
