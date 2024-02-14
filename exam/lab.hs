import Data.List
import qualified Data.Map.Strict as Map


-- task 1
partitionN :: [a] -> Int -> [[a]]
partitionN _ n | n <= 0 = error "The number of sections cannot be less than 1"
partitionN xs n = go xs (length xs `div` n) (length xs `mod` n)  where
    go [] _ _ = []
    go ys len 0 = take len ys : go (drop len ys) len 0
    go ys len rem = take (len + 1) ys : go (drop (len + 1) ys) len (rem - 1) 


-- task 2
elemIndices :: Eq a => a -> [a] -> [Int]
elemIndices _ [] = []
elemIndices e xs = go e xs 0
  where
    go _ [] _ = []
    go e (y:ys) index
      | e == y = index : go e ys (index + 1)
      | otherwise = go e ys (index + 1)

-- task 3
powersList :: Int -> Int -> [[Int]]
powersList n maxNum = [[i^p | p <- [1..n]] | i <- [1..maxNum]]

-- task 4
wordCount :: FilePath -> FilePath -> IO ()
wordCount inputFile outputFile = do
  input <- readFile inputFile
  let wordList = words input
      wordMap = foldl' (\acc x -> Map.insertWith (+) x 1 acc) Map.empty wordList
      sortedList = sortBy (\(_, a) (_, b) -> compare b a) $ Map.toList wordMap
      formattedOutput = unlines $ map (\(w, c) -> w ++ ":" ++ show c) sortedList
  writeFile outputFile formattedOutput


main = do
    print ("-- task 1")
    print $ partitionN [1,2,3,4,5,6,7] 3
    print $ partitionN [1,2,3,4,5,6,7] 4
    print $ partitionN [1,2,3,4,5,6,7] 5
    print $ partitionN [1,2,3,4,5,6,7] 6
    print $ partitionN [1,2,3,4,5,6,7] 8
    print $ partitionN [1,2,3,4,5,6,7] 7
    print $ partitionN [1, 2] 0
    print $ partitionN [1, 2] 4

    print ("-- task 2")
    print $ elemIndices 0 [1, 2, 3, 4, 5]
    print $ elemIndices 1 [1, 2, 3, 4, 5]
    print $ elemIndices 3 [1, 2, 3, 4, 5]
    print $ elemIndices 2 [2, 2, 3, 2, 5, 2]

    print ("-- task 3")
    print $ powersList 2 4
    [[1,1],[2,4],[3,9],[4,16]]

    print ("-- task 4")
    wordCount "input_empty.txt" "output_empty.txt"
    wordCount "input_one_word.txt" "output_one_word.txt"
    wordCount "input_few_same_words.txt" "output_few_same_words.txt"
    wordCount "input_different_words.txt" "output_different_words.txt"
