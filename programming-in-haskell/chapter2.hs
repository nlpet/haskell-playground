-- Exercises

-- Give another possible calculation for the result of double (double 2)
double x = x + x
double' x = x * x * x

-- Show that sum [x] = x for any number x
sum' :: [Integer] -> Bool
sum' x = sum x == x !! 0

-- Define a function product that produces the product of a list of numbers,
-- and show using your definition that product [2, 3, 4] = 24.
product' :: [Integer] -> Integer
product' [] = 0
product' [x] = x
product' (x:xs) = x * product' xs


-- How should the definition of the function qsort be modified so that it
-- produces a reverse sorted version of a list?
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerSorted = quicksort [a | a <- xs, a > x]
      biggerSorted = quicksort [a | a <- xs, a <= x]
  in smallerSorted ++ [x] ++ biggerSorted
