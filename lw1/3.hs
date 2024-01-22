main :: IO ()
main = do
-- 1 way
  let oddsFirst = filter odd [1..40]
  print oddsFirst

-- 2 way
  let oddSecond = map (\x -> x * 2 - 1) [1..20]
  print oddSecond