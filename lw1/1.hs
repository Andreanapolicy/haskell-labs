main :: IO ()
main = do
    let tuple = ((1, 'a'), "abc")
        charValue = snd (fst tuple)
    putStrLn [charValue]