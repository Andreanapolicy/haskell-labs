-- 1 task
listnums :: Int -> [Int]
listnums 1 = [1]
listnums n = if n < 1 then [-1] else (n : listnums(n - 1))


main = do
    print(listnums 10)