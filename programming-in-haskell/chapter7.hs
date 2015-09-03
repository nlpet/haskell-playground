-- Recursive Functions

factorial :: Int -> Int
factorial n = product [1..n]

factorial' :: Int -> Int
factorial' 0 = 1
factorial' n = n * factorial' (n - 1)

product' :: (Num a) => [a] -> a
product' [] = 1
product' (n:ns) = n * product ns

len :: [a] -> Int
len [] = 0
len (_:xs) = 1 + len xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

(+++) :: [a] -> [a] -> [a]
[] +++ ys = ys
(x:xs) +++ ys = x : (xs +++ ys)

-- Define custom xor operator
(^|) :: Bool -> Bool -> Bool
True ^| False = True
False ^| True = True
_ ^| _ = False

-- Insert value in list
insert :: (Ord a) => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys) | x <= y = x : y : ys
                | otherwise = y : insert x ys

isort :: (Ord a) => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)

-- Multiple arguments
zipt :: [a] -> [b] -> [(a,b)]
zipt [] _ = []
zipt _ [] = []
zipt (x:xs) (y:ys) = (x,y) : zipt xs ys


-- Exercises

-- Define the exponentiation operator ↑ for non-negative integers using the
-- same pattern of recursion as the multiplicat
(!^) :: Int -> Int -> Int
m !^ 0 = 1
m !^ n = m * m !^ (n - 1)
