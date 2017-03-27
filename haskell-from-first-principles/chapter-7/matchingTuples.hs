

module TupleFunctions where


addEmUp2 :: Num a => (a, a) -> a
addEmUp2 (x, y) = x + y


fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

third3 :: (a, b, c) -> c
third3 (_, _, x) = x


{-|
-- Exercises: Variety Pack
1. Given the following declarations

k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2)) k3 = k (3, True)
k3 = k (3, True)

a) What is the type of k?
k :: (t1, t) -> t1

b) What is the type of k2? Is it the same type as k1 or k3?
k2 :: [Char]

c) Of k1, k2, k3, which will return the number 3 as the result?
k3

-}

--2. Fill in the definition of the following function:
     -- Remember: Tuples have the same syntax for their
     -- type constructors and their data constructors.

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))


-- 7.5 Case Expressions
-- data Bool = False | True

-- palindrome
pal xs =
  case xs == reverse xs of
    True -> "yes"
    False -> "no"

pal' xs =
  case y of
    True -> "yes"
    False -> "no"
  where y = xs === reverse xs
