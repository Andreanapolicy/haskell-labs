import System.Environment
import Data.Char

main = do
    args <- getArgs
    if length args /= 3
        then putStrLn "Error. Right usage: task2.hs input_file output_file symbol"
        else do
            let inputFileName = args !! 0
                outputFileName = args !! 1
                replacementChar = head (args !! 2)
            inputExists <- doesFileExist inputFileName
            if not inputExists
                then putStrLn "Input file does not exist"
                else do
                    input <- readFile inputFileName
                    let modifiedInput = map (\c -> if isPunctuation c then replacementChar else c) input
                    writeFile outputFileName modifiedInput
                    putStrLn "Success"