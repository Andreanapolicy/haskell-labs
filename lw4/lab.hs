
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


-- Update a value at a specific key with the result of the provided function.
-- When the key is not
-- a member of the map, the original map is returned.
--
-- > adjust ("new " ++) 5 (fromList [(5,"a"), (3,"b")]) == fromList [(3, "b"), (5, "new a")]
-- > adjust ("new " ++) 7 (fromList [(5,"a"), (3,"b")]) == fromList [(3, "b"), (5, "a")]
-- > adjust ("new " ++) 7 empty                         == empty
-- Проверяем индекс, если он невалиден, возвращаем список. 
-- Иначе разбиваем список на 2 части по индексу, и формируем новый: 1 часть, обработка головы второй части, хвост 2 части
myadjust :: (a -> a) -> Int -> [a] -> [a]
myadjust function index list = 
  if index < 0 || index >= length list
    then list
  else 
    let (before, after) = splitAt index list
    in before ++ [function (head after)] ++ tail after


-- \n character to each input string, then concatenates the
-- results
-- >>> unlines ["Hello", "World", "!"]
-- "Hello\nWorld\n!\n"
myunlines :: [String] -> String
myunlines [] = ""
myunlines (x:xs) = x ++ "\n" ++ myunlines xs

main = do
    print(myintersperse '-' "123")

    print(myadjust (\x -> x + 1) 2 [1, 2, 3, 4, 5])
    print(myadjust (\_ -> "hello") 0 ["world", "apple", "orange"])
    print(myunlines ["world", "apple", "orange"])
    