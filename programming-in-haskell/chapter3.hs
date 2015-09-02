-- Parenthesise the following arithmetic expressions:
-- 2↑3∗4
-- 2∗3+4∗5
-- 2+3∗4↑5
--
-- Answer:
-- (2 ↑ 3) ∗ 4
-- ((2 * 3) + (4 * 5)
-- 2 + (3 * (4 ↑ 5))

-- The script below contains three syntactic errors. Correct these errors
-- and then check that your script works properly using Hugs.
-- N = a ’div’ length xs
--     where
--      a = 10
--     xs = [1, 2, 3, 4, 5]

nfunc = a `div` length xs
  where a = 10
        xs = [1, 2, 3, 4, 5]


-- Show how the library function last that selects the last element of a non-
-- empty list could be defined in terms of the library functions introduced
-- in this chapter. Can you think of another possible definition?
last' xs = drop (length xs - 1) xs !! 0
-- or
last'' xs = head (reverse xs)
-- or
last''' xs = xs !! (length xs - 1)

-- Show how the library function init that removes the last element from
-- a non-empty list could similarly be defined in two different ways.
init' xs = take (length xs - 1) xs
init'' xs = reverse (tail (reverse xs))
