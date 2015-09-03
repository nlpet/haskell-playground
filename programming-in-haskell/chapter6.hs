-- List Comprehensions

ps = [(1, True), (2, False), (3, True), (4, False)]
x = [x | (x, True) <- ps]

length' :: [a] -> Int
length' xs = sum [1 | _ <- xs]

lc = [(x,y) | x <- [1,2,3],y <- [4,5]]
-- [(1, 4), (1, 5), (2, 4), (2, 5), (3, 4), (3, 5)]

lc1 = [(x,y) | x <- [1..3], y <- [x..3]]
-- [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]

concat' :: [[a]] -> [a]
concat' xss = [x | xs <- xss, x <- xs]

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = if (length (factors n)) == 2 then True else False

prime' :: Int -> Bool
prime' n = factors n == [1,n]

primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]

find :: (Eq a) => a -> [(a,b)] -> [b]
find k t = [v | (k', v) <- t,k == k']
-- > find ’b’ [ (’a’, 1), (’b’, 2), (’c’, 3), (’b’, 4) ]
--   [2,4]

pairs :: [a] -> [(a, a)]
pairs xs = zip xs (tail xs)

sorted :: (Ord a) => [a] -> Bool
sorted xs = and [x <= y | (x,y) <- pairs xs]

positions :: (Eq a) => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0..n], x == x']
  where n = length xs - 1


-- String Comprehensions
-- "adsgfhte" !! 1
-- take 2 "fgwr"
-- length "wgrgwg"

-- The term comprehension comes from the "axiom of comprehension" in set theory,
-- which makes precise the idea of constructing a set by selecting all values satisfying
-- a given property.

-- Exercises

-- Using a list comprehension, give an expression that calculates the
-- sum of 1^2 + 2^2 + ... + 100^2 of the first one hundred integer squares
sqlc :: Int -> [Int]
sqlc n = [x * x | x <- [1..n]]


-- In a similar way to the function length, show how the library function
-- replicate :: Int -> a -> [a] that produces a list of identical elements can be
-- defined using a list comprehrension

repl :: Int -> a -> [a]
repl n x = [x | _ <- [1..n]]


-- A triple (x, y, z) of positive integers is pythagorean if x2 + y 2 = z 2 .
-- Using a list comprehension, define a function pythagoreans :: Int →
-- [(Int, Int, Int )] that returns the list of all pythagorean triples whose
-- components are at most a given limit. For example:

pythagoreans :: Int -> [(Int, Int, Int)]
pythagoreans n = [(x,y,z) | x <- lst,
                            y <- lst,
                            z <- lst,
                            x^2 + y^2 == z^2]
  where lst = [1..n]

-- A positive integer is perfect if it equals the sum of its factors, excluding
-- the number itself. Using a list comprehension and the function factors,
-- define a function perfects :: Int → [Int ] that

exclfactors :: Int -> [Int]
exclfactors n = [x | x <- [1..(n-1)], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], (sum (exclfactors x)) == x]

perfects' :: Int -> [Int]
perfects' n = [x | x <- [1..n], sum (init (factors x)) == x]

-- The scalar product of two lists of integers of the same length is the sum
-- of the products of successive numbers from the two lists. Using a list
-- comprehension, define a function scalarproduct :: [Int ] → [Int ] → Int
-- that returns the scalar product of two lists. For example:
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [x * y | (x,y) <- zip xs ys]

-- Redefine the function positions using the function find .
positions' :: (Eq a) => a -> [a] -> [Int]
positions' x xs = find x (zip xs [0..n])
  where n = length xs - 1
