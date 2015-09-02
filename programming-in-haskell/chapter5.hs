-- Chapter 5: Defining Functions

-- Is a character a digit
isDigit :: Char -> Bool
isDigit c = c >= '0' && c <= '9'

-- Is an int even
even' :: Integral a => a -> Bool
even' n = n `mod` 2 == 0

-- split a list at the nth element
splitList :: Int -> [a] -> ([a], [a])
splitList n xs = (take n xs, drop n xs)

-- reciprocation
reciprocal :: Fractional a => a -> a
reciprocal n = 1 / n

-- Conditional expressions
absValue :: Int -> Int
absValue n = if n >= 0 then n else -n

absValueGuarded :: Int -> Int
absValueGuarded n | n >= 0 = n
                  | otherwise = -n

-- Return the sign of an integer
signint :: Int -> Int
signint n = if n < 0 then -1 else
              if n == 0 then 0 else 1

signint' :: Int -> Int
signint' n | n < 0      = -1
           | n == 0     =  0
           | otherwise  =  1


-- Pattern Matching
frst         ::  (a, b) -> a
frst (x, _)  =   x

scnd         ::  (a, b) -> b
scnd (_, y)  =   y

null' :: [a] -> Bool
null' [] = True
null' (_:_) = False

head' :: [a] -> a
head' (x:_) = x

tail' :: [a] -> [a]
tail' (_:xs) = xs

pred' :: Int -> Int
pred' 0 = 0
pred' n = n - 1


-- Exercises

-- Using library functions, define a function
-- halve :: [ a ] → ([ a ], [ a ])
-- that splits an even-lengthed list into two halves. For example:
-- > halve [1,2,3,4,5,6]
-- ([1, 2, 3], [4, 5, 6])

halve :: [a] -> ([a], [a])
halve xs = (take mid xs, drop mid xs)
  where mid = length xs `div` 2


-- Consider a function safetail :: [ a ] → [ a ] that behaves as the library
-- function tail, except that safetail maps the empty list to itself,
-- whereas tail produces an error in this case. Define safetail using:
-- (a) a conditional expression
-- (b) guarded equations
-- (c) pattern matching

safetail xs = if null xs then [] else tail xs
safetail' xs | length xs > 0 = tail xs
             | otherwise = []

safetail'' [] = []
safetail'' xs = tail xs

-- In a similar way to ∧, show how the logical disjunction operator ∨
-- can be defined in four different ways using pattern matching.

-- True (&&) True = True
-- _ (&&) _ = False
