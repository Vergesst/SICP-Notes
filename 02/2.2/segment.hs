data Point = Point Float Float
  deriving (Show)

data Segment = Segment Point Point
  deriving (Show)

-- for point
xPoint :: Point -> Float
xPoint (Point x _) = x

yPoint :: Point -> Float
yPoint (Point _ y) = y

-- for segment
segStart :: Segment -> Point
segStart (Segment s _) = s

segEnd :: Segment -> Point
segEnd (Segment _ e) = e

midpoint :: Segment -> Point
midpoint (Segment s e) = 
  Point ((xPoint s + xPoint e) / 2)
        ((yPoint s + yPoint e) / 2)
