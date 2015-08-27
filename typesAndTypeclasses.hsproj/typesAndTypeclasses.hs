-- check the type of an expression :t <exp>

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

factorial :: Integer -> Integer
factorial n = product [1..n]

-- Float (single point precision)
circumference :: Float -> Float
circumference r = 2 * pi * r

-- Double (double point precision)
circumference' :: Double -> Double
circumference' r = 2 * pi * r

-- :t (==)
-- :t head
-- read "8.0" + 3
-- read "5" :: Int
-- (read "5" :: Float) * 4
--  read "[1,2,3,4]" :: [Int]
-- read "(3, 'a')" :: (Int, Char)

a = ['a' .. 'e']
c = [LT .. GT]
n = [3,5 .. 10]


-- Bounded members
mbi = minBound :: Int
mbc = maxBound :: Char
mbc' = minBound :: Char
mbb = maxBound :: Bool
mbb' = minBound :: Bool
bl = maxBound :: (Bool, Int, Char)
