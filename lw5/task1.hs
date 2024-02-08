import System.IO

main :: IO()
main = do
  hSetBuffering stdout NoBuffering

  putStr "Write first value: "
  first <- getLine
  
  putStr "Write count: "
  count <- getLine
  
  putStr "Write multiplicity: "
  mult <- getLine
  
  let firstValue = read first :: Int
      numberOfElements = read count :: Int
      multipleOf = read mult :: Int
      result = [firstValue, firstValue + multipleOf .. firstValue + (numberOfElements - 1) * multipleOf]
  print result
