-- Haskell basics

-- lines "hello\nhello\nhello\n" => ["hello", "hello", "hello"]


dropn n xs = if n <= 0 || null xs
  then xs
  else dropn (n - 1) (tail xs)

-- multiply a lst by n and return the sum
mult n lst = sum (map (n*) lst)


-- ?
y :: Int
y = y + 1
