import Data.Char
import Data.List

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
-}
