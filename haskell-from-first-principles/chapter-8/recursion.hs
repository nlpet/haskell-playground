
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial(n - 1)

-- 𝑡𝑖𝑚𝑒𝑠 is a variable representing the number of times the incrementing function
-- should be applied to the argument 𝑛.
incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes times n = 1 + (incTimes (times - 1) n)


-- apply times - composition
applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f . applyTimes (n - 1) f $ b
-- applyTimes 5 (+1) 5 == 10


-- 8.3 Bottom

-- ⊥ or bottom is a term used in Haskell to refer to computations
-- that do not successfully result in a value.

-- data Maybe a = Nothing | Just a

f :: Bool -> Maybe Int
f False = Just 0
f _ = Nothing
