cubeIter :: Float -> Float -> Float -> Float
cubeIter guess x accuracy
  | goodEnough guess x accuracy = guess
  | otherwise = cubeIter (approxymate guess x) x accuracy

goodEnough :: Float -> Float -> Float -> Bool
goodEnough guess x accruacy = abs (cube guess - x) < accruacy

cube :: Float -> Float
cube x = square x * x

square :: Float -> Float
square x = x * x
 
approxymate :: Float -> Float -> Float
approxymate y x = 
  (x / square y + (2 * y)) / 3

-- sample output
main :: IO ()
main = do
  let res = cubeIter 1.0 8.0 0.00001
  print res
