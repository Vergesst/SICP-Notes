square :: Int -> Int
square n = n * n

fastExpt :: Int -> Int -> Int
fastExpt _ 0 = 1
fastExpt b n
  | even n = square (fastExpt b (n `div` 2))
  | otherwise = b * fastExpt b (n - 1)

main :: IO ()
main = do
  print (fastExpt 2 4)
