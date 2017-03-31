module RegisteredUser where

newtype Username = Username String
newtype AccountNumber = AccountNumber Integer

data User = UnregisteredUser
    | RegisteredUser Username AccountNumber


printUser :: User -> IO ()
printUser UnregisteredUser = putStrLn "UnregisteredUser"
printUser (RegisteredUser (Username name)
                          (AccountNumber accNum))
          = putStrLn $ name ++ " " ++ show accNum

-- et myUser = (Username "callen")
-- let myAcc = (AccountNumber 31465)
-- printUser $ RegisteredUser myUser myAcc

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f (a, b) (c, d) = ((b, d), (a, c))


data Employee = Coder
              | Manager
              | Veep
              | CEO
              deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO ()
reportBoss e e' =
  putStrLn $ show e ++ " is the bos of " ++ show e'


employeeRank :: (Employee -> Employee -> Ordering)
              -> Employee
              -> Employee
              -> IO ()

employeeRank f e e' =
  case f e e' of
    GT -> reportBoss e e'
    EQ -> putStrLn "Neither employee is the boss"
    LT -> (flip reportBoss) e e'


-- Guards
myAbs :: Integer -> Integer
myAbs x
  | x < 0 = (-x)
  | otherwise = x


pythagoreanTriangle :: (Num a, Eq a) => a -> a -> a -> String
pythagoreanTriangle a b c
  | a^2 + b^2 == c^2 = "Yes"
  | otherwise        = "No"


dogYears :: Integer -> Integer
dogYears x
  | x <= 0    = 0
  | x <= 1    = x * 15
  | x <= 2    = x * 12
  | x <= 4    = x * 8
  | otherwise = x * 6



avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
  | y >= 0.9   = 'A'
  | y >= 0.8   = 'B'
  | y >= 0.7   = 'C'
  | y >= 0.59  = 'D'
  | y <  0.59  = 'F'
  where y = x / 100


-- Functional composition
-- (.) :: (b -> c) -> (a -> b) -> a -> c

ns = negate . sum $ [1, 2, 3]

tf = take 5 . reverse $ [1..10]

-- Point free style
-- (f . g) x = f (g x)

print' :: Show a => a -> IO ()
print' a = (putStrLn . show) a
