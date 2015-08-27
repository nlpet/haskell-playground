-- Pattern matching
lucky :: (Integral a) => a -> String
lucky 7 = "Lucky number seven"
lucky x = "Sorry, you're out of luck."

-- Factorial , recursive
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)


-- tuples
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)


-- defined fst and snd for triples
first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

xs = [(1,3), (6,7),(65,23),(77,99)]
xslc = [a+b | (a,b) <- xs]

-- alternative tail implementations
tail' :: [a] -> [a]
tail' [] = error "Empty list!"
tail' xs = drop 1 xs

tail2 :: [a] -> [a]
tail2 [] = error "Empty list"
tail2 (x:xs) = xs

-- list pattern matching
tell :: (Show a) => [a] -> String
tell [] = "Empty list"
tell (x:[]) = "One element: " ++ show x
tell (x:y:[]) = "Two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "Looong list"

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

-- patterns
capital :: String -> String
capital "" = "Empty string!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- guards
max' :: (Ord a) => a -> a -> a
max' a b
  | a > b     =  a
  | otherwise =  b

max'' :: (Ord a) => a -> a -> a
max'' a b | a > b = a | otherwise = b

ratio :: (RealFloat a) => a -> a -> String
ratio x y
  | r < 1 = "Small ratio"
  | r > 1 = "Medium ratio"
  | r > 10 = "Big ratio"
  where r = x / y


initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = firstname
        (l:_) = lastname


-- let
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^2
  in sideArea + 2 * topArea


a = [let square x = x * x in (square 5, square 3, square 2)]


head' :: [a] -> a
head' [] = error "Empty list"
head' (x:_) = x

head'' :: [a] -> a
head'' xs = case xs of [] -> error "Empty list"
                       (x:_) -> x
