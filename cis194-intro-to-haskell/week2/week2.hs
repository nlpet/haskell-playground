
data BookInfo = Book Int String [String]
                deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)


myInfo = Book 9780135072455 "Algebra of Programming"
         ["Richard Bird", "Oege de Moor"]


type CustomerID = Int
type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving (Show)

testCreditCard = CreditCard "2901650221064486" "Thomas Gradgrind" ["Dickens", "England"]


a = ("Porpoise", "Grey")
b = ("Table", "Oak")

-- :t a == :t b


data Cetacean = Cetacean String String
data Furniture = Furniture String String

c = Cetacean "Porpoise" "Grey"
d = Furniture "Table" "Oak"

-- :t c /= :t d


---------------------------

-- x and y coordinates or lengths
data Cartesian2D = Cartesian2D Double Double
                   deriving (Eq, Show)

-- Angle and distance (magnitude)
data Polar2D = Polar2D Double Double
               deriving (Eq, Show)


type Vector = (Double, Double)

data Shape = Circle Vector Double
             | Poly [Vector]



-- Pattern Matching

sumList (x:xs) = x + sumList xs
sumList []     = 0


bookID       (Book id title authors) = id
bookTitle    (Book id title authors) = title
bookAUthors  (Book id title authors) = authors

myBook = (Book 3 "Probability Theory" ["E.T.H. Jaynes"])
myBookID = bookID myBook
myBookTitle = bookTitle myBook
myBookAuthors = bookAUthors myBook


nicerID      (Book id _     _      ) = id
nicerTitle   (Book _  title _      ) = title
nicerAuthors (Book _  _     authors) = authors


-- Record syntax
data Customer = Customer {
         customerID      :: CustomerID
       , customerName    :: String
       , customerAddress :: Address
       } deriving (Show)

customer1 = Customer 271828 "J.R. Hacker"
            ["255 Syntax Ct",
             "Milpitas, CA 95134",
             "USA"]


-- more verbose notation
customer2 = Customer {
              customerID = 271828
            , customerAddress = ["1048576 Disk Drive",
                                 "Milpitas, CA 95134",
                                 "USA"]
            , customerName = "Jane Q. Citizen"
            }


-- recursive types
data List a = Cons a (List a)
              | Nil
                deriving (Show)
-- Cons 2 (Cons 1 (Cons 0 Nil))


data Tree a = Node a (Tree a) (Tree a)
              | Empty
                deriving (Show)

simpleTree = Node "parent" (Node "left child" Empty Empty)
                           (Node "right child" Empty Empty)


indexer :: (Show a) => [a] -> Int -> [Char]
indexer xs n = if length xs < n
       then "Index out of bounds"
       else show (xs !! n)


safeIndexer :: [a] -> Int -> Maybe a
safeIndexer [] _ = Nothing
safeIndexer xs n = if length xs < n
       then Nothing
       else Just (xs !! n)


tidySecond :: [a] -> Maybe a
tidySecond (_:x:_) = Just x
tidySecond _ = Nothing


-- local variables
lend amount balance = let reserve    = 100
                          newBalance = balance - amount
                      in if balance < reserve
                         then Nothing
                         else Just newBalance


-- where clause
lend2 amount balance = if amount < reserve * 0.5
                      then Just newBalance
                      else Nothing
    where reserve    = 100
          newBalance = balance - amount


pluralise :: String -> [Int] -> [String]
pluralise word counts = map plural counts
              where plural 0 = "no " ++ word ++ "s"
                    plural 1 = "one " ++ word
                    plural n = show n ++ " " ++ word ++ "s"
