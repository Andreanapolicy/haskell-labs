getTriangleNumbers :: Int -> [Int]
getTriangleNumbers count = [sum[1..x] | x <- [1..count]]

main :: IO ()
main = do
  let maxCount = 50
  print(getTriangleNumbers maxCount)