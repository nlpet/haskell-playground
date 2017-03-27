-- CHAPTER 7: MORE FUNCTIONAL PATTERNS

myNum :: Num a => a
myNum = 1

myVal :: Num a => a -> a
myVal f = f + myNum

stillAFunction :: [a] -> [a] -> [a] -> [a]
stillAFunction a b c = a ++ b ++ c


-- Anonymous functions
-- (\x -> x * 3) :: Integer -> Integer


-- Exercises: Grab Bag
{-|
1. Which (two or more) of the following are equivalent?
a) mTh x y z = x * y * z
b) mTh x y = \z -> x * y * z
c) mTh x = \y -> \z -> x * y * z
d) mTh = \x -> \y -> \z -> x * y * z

Solution: they are all equal

2. ThetypeofmTh(above)isNum a => a -> a -> a -> a. Which is the type of mTh 3?

Solution:
mTh :: Num a => a -> a -> a -> a

3. Rewrite the f function in the where clause
-}
addOneIfOdd n = case odd n of
    True -> f n
    False -> n
    where f = (\n -> n + 1)

-- b) Rewrite the following to use anonymous lambda syntax:
-- addFive x y = (if x > y then y else x) + 5
addFive f = \x -> \y -> (if x > y then y else x) + 5


-- c) Rewrite the following so that it doesn’t use anonymous
-- lambda syntax:
-- mflip f = \x -> \y -> f y x
mflip x y = y x


-- 7.4 Pattern Matching
