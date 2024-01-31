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

listSumm :: Num a => [a] -> [a] -> [a]
listSumm [] [] = []
listSumm xs [] = xs
listSumm [] ys = ys
listSumm (x:xs) (y:ys) = (x + y) : listSumm xs ys

--4 task

position :: [Int] -> Int -> Int
position list element | null matching = -1
                      | otherwise = head matching
                      where matching = [x | (x,y) <- zip [0..] list, y == element]


-- 5 task

sumFunction :: Int -> Int
sumFunction n = sum [1..n]

-- 6 task

sumFunctionPro :: Int -> Int
sumFunctionPro n = sum [n - i | i <- [1..n]]

main = do
    print(oddEven [1, 2, 3])
    
    print(insert [1, 2, 3] 0 1)

    print(listSumm [0, 2] [1, 2, 3])
    
    print(position [] 1)
    
    print(sumFunction 3)
    
    print(sumFunctionPro 3)