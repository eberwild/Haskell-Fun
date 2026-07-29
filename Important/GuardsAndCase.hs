------------------------------------------------------------
-- 1) Guards
------------------------------------------------------------
-- Verwendung:
-- Bedingungen innerhalb einer Funktion prüfen
--
-- Syntax:
--
-- funktion x
--     | bedingung1 = ergebnis1
--     | otherwise  = ergebnis2
--
-- Guards benutzen "="
------------------------------------------------------------

absValue :: Int -> Int
absValue x
    | x < 0     = -x
    | otherwise = x



------------------------------------------------------------
-- 2) Case
------------------------------------------------------------
-- Verwendung:
-- Werte anhand ihrer Struktur unterscheiden
--
-- Syntax:
--
-- case wert of
--     muster1 -> ergebnis1
--     muster2 -> ergebnis2
--
-- Case benutzt "->"
------------------------------------------------------------

describe :: Maybe Int -> String
describe x =
    case x of
        Nothing -> "kein Wert"
        Just n  -> "Wert vorhanden"



------------------------------------------------------------
-- 3) Case mit Guards
------------------------------------------------------------
-- Verwendung:
-- Erst Pattern Matching,
-- danach zusätzliche Bedingungen prüfen
--
-- Syntax:
--
-- case wert of
--     muster
--         | bedingung -> ergebnis
--         | otherwise  -> ergebnis
------------------------------------------------------------

check :: Maybe Int -> String
check x =
    case x of
        Nothing -> "leer"
        Just n
            | n > 10    -> "groß"
            | otherwise -> "klein"



------------------------------------------------------------
-- Merksatz:
--
-- Guard:
-- "Welche Bedingung gilt?"
--
-- Case:
-- "Welche Form hat der Wert?"
--
-- Case + Guards:
-- "Welche Form hat der Wert und welcher Fall gilt?"
------------------------------------------------------------