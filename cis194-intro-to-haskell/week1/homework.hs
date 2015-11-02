-- CIS 194 : Homework 1


-- Exercise 1
toDigits :: Integer -> [Integer]
toDigits n = if n <= 0 then []
  else toDigits (n `div` 10) ++ [n `mod` 10]


toDigitsRev :: Integer -> [Integer]
toDigitsRev n = if n <= 0 then []
  else reverse (toDigits (n `div` 10) ++ [n `mod` 10])


-- Exercise 2
doubleFrom0 [] = []
doubleFrom0 (x:xs) = (x * 2) : head xs : doubleFrom0 (tail xs)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther (xs) = if length xs `mod` 2 == 0
  then doubleFrom0 xs
  else head xs : doubleFrom0 (tail xs)


-- Exercise 3
sumDigits :: [Integer] -> Integer
sumDigits xs = sum [sum (toDigits x) | x <- xs]


-- Exercise 4
validate :: Integer -> Bool
validate n = (sumDigits (doubleEveryOther (toDigits n))) `mod` 10 == 0


-- Exercise 5 (Towers of Hanoi)
type Peg = String
type Move = (Peg, Peg)
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
