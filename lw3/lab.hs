-- 1 task
listnums :: Int -> [Int]
listnums 1 = [1]
listnums n = if n < 1 then [-1] else (n : listnums(n - 1))

-- 2 task
secondlastlist :: [[Int]] -> [Int]
secondlastlist [] = []
secondlastlist (x:xs) = if null (x)
                        then secondlastlist xs
                        else last x : secondlastlist xs

-- 3 task
myunion :: [Int] -> [Int] -> [Int]
myunion list [] = list
myunion [] list = list
myunion list (x:xs) = if elem x list
                      then myunion list xs
                      else myunion (x : list) xs

main = do
    print(listnums 10)
    print(secondlastlist [[1, 2], [1, 2, 3], [3, 4, 5, 6]])
    print(myunion [2, 3] [3, 2])