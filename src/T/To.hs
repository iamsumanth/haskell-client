module T.To (spec1) where

spec1 :: Int -> Int
spec1 a = temp "a"


temp :: String -> Int
temp a = 2


--pure (*) <*> (Just 4) <*> (Just 5)


func :: Maybe Int -> Maybe Int
func a = (*) <$> Just 4 <*> a