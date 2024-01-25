module Main (do_my_list, oddEven, main) where
import System.IO

do_my_list :: Int -> [Int]
do_my_list n = [n..(n + n - 1)]


-- 1 task
oddEven :: [l] -> [l]
oddEven [] = []
oddEven [l] = [l]
oddEven (a:b:y) = b : a : oddEven y

-- 2 task

insert :: [a] -> a -> Int -> [a]
insert [] a n = [a]
insert l a n = let (left, right) = splitAt (n - 1) l
                in left ++ [a] ++ right

-- 3 task


main = do
    print(oddEven [1, 2, 3])
    
    print(insert [1, 2, 3] 0 1)
