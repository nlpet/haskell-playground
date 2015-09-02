-- Chapter 4: Types and Classes

-- if f :: A → B and e :: A, then f e :: B


-- ----------------------------------------------------------------------------
-- Basic Types
-- ----------------------------------------------------------------------------
-- Bool:    logical values (True, False)
-- Char:    single characters ('a', 'A', '3', '_')
-- String:  strings of chars
-- Int:     fixed-precision integers (-100, 0, 999, range(-21^31, 2^31))
-- Integer: arbitrary-precision integers (2 ↑ 31)
-- Float:   single-precision floating-point numbers (-15.34, 1.1...)


-- ----------------------------------------------------------------------------
-- List Types
-- ----------------------------------------------------------------------------
-- [False, True, False ]          :: [Bool]
-- [’a’, ’b’, ’c’, ’d’]           ::  [Char]
-- [ "One", "Two", "Three" ]      ::  [String]
-- [[’a’, ’b’], [’c’, ’d’, ’e’]]  :: [[Char]]


-- ----------------------------------------------------------------------------
-- Tuple Types
-- ----------------------------------------------------------------------------
-- (False , True )          ::  (Bool , Bool )
-- (False , ’a’, True )     ::  (Bool , Char , Bool )
-- ("Yes", True , ’a’)      ::  (String , Bool , Char )
-- (’a’, (False , ’b’))     ::  (Char , (Bool , Char ))
-- ([’a’,’b’],[False,True]) ::  ([Char],[Bool])
-- [(’a’,False),(’b’,True)] ::  [(Char,Bool)]


-- ----------------------------------------------------------------------------
-- Function Types
-- ----------------------------------------------------------------------------
--  ¬      :: Bool → Bool
-- isDigit :: Char → Bool
--
-- add      :: (Int,Int) → Int
-- add(x,y) = x+y
--
-- zeroto   ::  Int → [Int]
-- zeroto n =   [0..n]


-- ----------------------------------------------------------------------------
-- Curried Functions
-- ----------------------------------------------------------------------------
-- add′     ::    Int → (Int → Int)
-- add′xy   =     x + y
-- add      ::    (Int,Int) → Int
-- add′     ::    Int → (Int → Int)


-- ----------------------------------------------------------------------------
-- Polymorphic Types
-- ----------------------------------------------------------------------------
-- length [1, 3, 5] , ["Yes", "No"]
-- length :: [ a ] → Int
-- fst :: (a,b)→a
-- head :: [a]→a
-- take :: Int→[a]→[a]
-- zip :: [a] → [b] → [(a,b)] id ::a→a


-- ----------------------------------------------------------------------------
-- Overloaded Types
-- ----------------------------------------------------------------------------
-- 1 + 2; 1.1 + 2.2
-- (+) :: Num a ⇒ a → a → a
-- (−) :: Num a ⇒ a → a → a
-- (*) ::  Num a ⇒ a → a → a
-- negate :: Num a ⇒ a → a
-- abs ::  Num a ⇒ a → a
-- signum ::  Num a ⇒ a → a


-- ----------------------------------------------------------------------------
-- Basic Classes
-- ----------------------------------------------------------------------------
-- Eq: equality types
-- (==) :: a → a → Bool
-- (̸=) :: a → a → Bool

-- Ord: ordered types
-- (<) :: a → a → Bool
-- (<=􏰀) :: a → a → Bool
-- (>) :: a → a → Bool
-- (>=􏰁) :: a → a → Bool
-- min :: a → a → a
-- max :: a → a → a

-- Show: showable types
-- show :: a → String
-- > show False
--   "False"
-- > show ’a’
--   "’a’"
-- > show 123
--   "123"
-- > show [1,2,3]
--   "[1,2,3]"
-- > show (’a’,False)
--   "(’a’,False)"

-- Read: readable types
-- read :: String → a

-- Num: numeric types
-- (+) :: a → a → a
-- (−) :: a → a → a

-- Integral: integral types
-- This class contains types that are instances of the numeric class Num,
-- but in addition whose values are integers, and as such support the methods
-- of integer division and integer remainder:
-- div :: a → a → a
-- mod :: a → a → a

-- Functional: functional types
-- (/) :: a → a → a
-- recip :: a → a

-- Exercises

-- What are the types of the following values?
-- :t [ ’a’, ’b’, ’c’ ] == [Char]
-- :t ('a', 'b', 'c') == (Char, Char, Char)
-- :t [(False, 'O'), (True, '1')] == [(Bool, Char)]
-- :t ([False,True],[’0’,’1’]) == ([Bool], [Char]])
-- :t [tail, reverse, init] == [[a] -> [a]]

-- What are the types of the following functions?
second :: [a] -> a
second xs = head (tail xs)

swap :: (a, b) -> (b, a)
swap (x,y) = (y, x)

pair :: a -> b -> (a, b)
pair x y = (x,y)

double :: (Num a) => a -> a
double x = x * 2

palindrome :: (Eq a) => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f (f x)
