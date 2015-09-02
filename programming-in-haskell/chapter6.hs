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


-- Up to zip -- 
