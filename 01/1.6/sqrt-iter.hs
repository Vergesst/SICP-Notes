sqrtIter :: Float -> Float -> Float
sqrtIter guess x =
  if goodEnough guess x 0.00001 then guess else sqrtIter (improve guess x) x

goodEnough :: Float -> Float -> Float -> Bool
goodEnough guess x accuracy = abs (square guess - x) < accuracy

square :: Float -> Float
square x = x * x

improve :: Float -> Float -> Float
improve guess x = (guess + x / guess) / 2

sqrt' :: Float -> Float
sqrt' = sqrtIter 1.0

main :: IO ()
main = do
  let res = sqrt' 16.0
  putStrLn ("result is " ++ show res)