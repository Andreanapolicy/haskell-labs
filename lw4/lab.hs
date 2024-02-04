
-- The 'intersperse' function takes an element and a list
-- and `intersperses' that element between the elements of the list. For
-- example,
--
-- >>> intersperse ',' "abcde"
-- "a,b,c,d,e"
myintersperse :: a -> [a] -> [a]
myintersperse _ [] = []
myintersperse _ [x] = [x]
myintersperse separator (x:xs) = x : separator : myintersperse separator xs


main = do
    print(myintersperse '-' "123")