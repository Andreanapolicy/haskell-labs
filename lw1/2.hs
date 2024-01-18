main :: IO ()
main = do
    let firstList = ['a', 'b', 'c']
        neededLetterFromFirstList = head(tail(firstList))
    putStrLn [neededLetterFromFirstList]
    
    let secondList = [['a', 'b'], ['c', 'd']]
        neededLetterFromSecondList = head(tail(head(secondList)))
    putStrLn [neededLetterFromSecondList]
    
    let thirdList = [['a', 'c', 'd'], ['a', 'b']]
        neededLetterFromThirdList = (head(tail(head(tail(thirdList)))))
    putStrLn [neededLetterFromThirdList]
    
    let thirdList = [['a','d'], ['b', 'c']]
        neededLetterFromThirdList = head(head(tail(thirdList)))
    putStrLn [neededLetterFromThirdList]