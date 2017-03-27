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
