-- built-in functions
-- succ (returns successor)

doublex x = x + x
doublexy x y = x*2 + y*2
doublexys x y = doublex x + doublex y

-- double selectively
doubleSmall x = if x > 10
                  then x
                  else x*2
                  
-- double selectively alternative syntax
doubleSmall' x = (if x > 10 then x else x*2)


-- lists
lst1 = [1,2,3,4,5]
lst2 = [6,7,8,9,10]

-- concat 2 lists
lst3 = lst1 ++ lst2

-- concat 2 strings
str = "Hello" ++ " " ++ "world"

-- concat 2 lists of chars to a string
str2 = ['w', 'o'] ++ ['o', 't']

-- cons operator (adds to the beginning)
str3 = 'A' : " small cat"
lst4 = 5 : [1,2,3,4]

-- get an element out of an array
indx = "sagan" !! 0
lst5 = [1,2,3,4,5] !! 4

-- lists of lists
b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
c = b ++ [[1,1,1,1,1]] -- concat lst to b
d = [6,6,6] : b -- prepend lst to b


-- compare lists
e = [3,2,1] > [2,1,8]

-- list operations :
--    head (returns first el)
--    tail (returns all but first el)
--    last (returns last el)
--    init (returns all but last el)
--    null (checks if lst is empty)
--    drop (drops n els from lst and returns the rest
--    minimum (returns min from lst)
--    sum, product, length, reverse, take n
--    x `elem` lst (checks if x is a member of lst)
--------------------------------------------------------
f = drop 3 [1,2,3,4,5,6]
g = 1 `elem` [1,2,3,4]


-- ranges
x = [1..100]
x' = ['a'..'z']
x'' = [1,5..20]

-- cycle takes a list and cycles it into an infinite list.
-- If you just try to display the result, it will go on 
-- forever so you have to slice it off somewhere.
h = take 10 (cycle [1,2,3])
i = take 10 (repeat 5)

-- replicate n x times
j = replicate 3 10


-- list comprehensions
lc = [x*2 | x <- [1..10]]

























