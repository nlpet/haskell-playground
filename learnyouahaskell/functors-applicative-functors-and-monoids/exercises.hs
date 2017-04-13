import Data.Char
import Data.List
import Control.Applicative

{-|
Functors are things that can be mapped over (like lists, Maybes, trees, etc).
They are described by the typeclass Functor, which has only one typeclass
method fmap, which has the type of

fmap :: (a -> b) -> fa -> fb

accepts a function that takes a and returns b and a box that takes a inside it
and returns a box with a b (or several) inside it

URL: http://learnyouahaskell.com/functors-applicative-functors-and-monoids
-}

-- Functors redux

-- instance Functor IO where
--   fmap f action = do
--     result <- action
--     return (f result)


main = do line <- getLine
          let line' = reverse line
          putStrLn $ line ++ "backwards is " ++ line'



-- with fmap
main' = do line <- fmap reverse getLine
           putStrLn $ "Your line backwards is " ++ line


main'' = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
            putStrLn line



{-|

Implementation of Functor from Control.Monads.Instances

instance Functor ((->) r) where
    fmap f g = (\x -> f (g x))


The first functor law states that if we map the id function over a functor,
the functor that we get back should be the same as the original functor.

fmap id = id

The second law says that composing two functions and then mapping the resulting
function over a functor should be the same as first mapping one function over
the functor and then mapping the other one.

Formally written, that means that

fmap (f . g) = fmap f . fmap g

Or to write it in another way, for any functor F, the following should hold:

fmap (f . g) F = fmap f (fmap g F).

-}


-- Applicative functors

{-|

class (Functor f) => Applicative f where
    pure :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b

pure f <*> x equals fmap f x

Control.Applicative exports a function called <$> (fmap as an infix operator):

(<$>) :: (Functor f) => (a -> b) -> f a -> f b
f <$> x = fmap f x

(++) <$> Just "Hello" <*> Just " world"

pure (+) <*> Just 3 <*> Just 5 == Just 8

pure f <*> x equals fmap f x

(<$>) :: (Functor f) => (a -> b) -> f a -> f b
f <$> x = fmap f x


[ x*y | x <- [2,5,10], y <- [8,10,11]]  == (*) <$> [2,5,10] <*> [8,10,11]

filter (>50) $ (*) <$> [2,5,10] <*> [8,10,11]
-}

getUserInput :: IO String
getUserInput = do
    a <- getLine
    b <- getLine
    return $ a ++ b

getUserInputApplicative :: IO String
getUserInputApplicative = (++) <$> getLine <*> getLine


{-|
-- (->) r is a functor
instance Applicative ((->) r) where
    pure x = (\_ -> x)
    f <*> g = \x -> f x (g x)

-- Some ZipList examples

getZipList $ (+) <$> ZipList [1,2,3] <*> ZipList [100,100,100] == [101,102,103]
getZipList $ (+) <$> ZipList [1,2,3] <*> ZipList [100,100..] == [101,102,103]
getZipList $ max <$> ZipList [1,2,3,4,5,3] <*> ZipList [5,3,1,2] == [5,3,3,4]
getZipList $ (,,) <$> ZipList "dog" <*> ZipList "cat" <*> ZipList "rat"
 == [('d','c','r'),('o','a','a'),('g','t','t')]

-}


-- we can take two applicative functors and combine them into one applicative
-- functor that has inside it the results of those two applicative functors in a list.
comb2AppF n = fmap (\x -> [x]) (Just n)

comb2AppFLists n lst = liftA2 (:) (Just n) (Just lst)


{-|

sequenceA :: (Applicative f) => [f a] -> f [a]
sequenceA [] = pure []
sequenceA (x:xs) = (:) <$> x <*> sequenceA xs

sequenceA :: (Applicative f) => [f a] -> f [a]
sequenceA = foldr (liftA2 (:)) (pure [])

-- Some examples

sequenceA [Just 3, Just 2, Just 1]  == Just [3,2,1]
sequenceA [(+3),(+2),(+1)] 3  == [6,5,4]

map (\f -> f 7) [(>4),(<10),odd]  == sequenceA [(>4),(<10),odd] 7

and $ map (\f -> f 7) [(>4),(<10),odd] == and $ sequenceA [(>4),(<10),odd] 7

sequenceA [[1,2],[3,4]]  == [[x,y] | x <- [1,2], y <- [3,4]]
-}
