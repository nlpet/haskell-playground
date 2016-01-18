-- curried
compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)


-- zipWith' (+) [1,1] [2,2]
-- zipWith' max [1,1] [2,2]
-- zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"]
-- zipWith' (*) (replicate 5 2) [1..]
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys


flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f y x = f x y


-- filter (>3) [1,5,3,2,1,6,4,3,2,1]
-- filter (== 3) [1,2,3,4]
-- filter even [1..10]
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x       = x : filter' p xs
  | otherwise = filter' p xs


largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [1000, 999..])
  where p x = x `mod` 13 == 0


largestDivisible' :: (Integral a) => a -> a -> a
largestDivisible' h n = head (filter p [h, h - 1..])
  where p x = x `mod` n == 0


-- the sum of all odd squares that are smaller than 100.
-- sum (takeWhile (<100) (filter odd (map (^2) [1..])))
-- sum (takeWhile (<100) [n^2 | n <- [1..], odd (n^2)])


-- Collatz sequences
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | even n = n:chain (n `div` 2)
  | odd n = n:chain (n*3 + 1)


-- Lambdas
numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))

-- zipWith (\a b -> (a,b)) [1,2,3] [4,5,6]


-- Function application with $
-- f (g (z x)) == f $ g $ z x
($) :: (a -> b) -> a -> b
f $ x = f x


-- Function composition
(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)

-- Turn a list of numbers into negative numbers
-- map (\x -> negate (abs x)) [5,1,3,-5,-7]
-- map (negate . abs) [5,-3,-6,7,-3,2,-19,24]
