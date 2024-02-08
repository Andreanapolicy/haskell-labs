import System.Environment
import Data.List
import System.Directory
import Control.Exception

main = do
    args <- getArgs
    if length args /= 2
        then putStrLn "Error. Right usage: task2.hs input_file output_file"
        else do
            let inputFileName = args !! 0
                outputFileName = args !! 1
            inputExists <- doesFileExist inputFileName
            if not inputExists
                then putStrLn "Input file does not exist"
                else do
                    handleFile inputFileName outputFileName

handleFile :: FilePath -> FilePath -> IO ()
handleFile inputFileName outputFileName = do
    putStrLn "Choose command:"
    putStrLn "see - see file"
    putStrLn "add - Add new information"
    putStrLn "delete - Delete string"
    putStrLn "copy - Copy file with filter"
    putStrLn "exit - Exit"

    choiceStr <- getLine
    let choice = read choiceStr :: String
    case choice of
        "see" -> do
            contents <- readFile inputFileName
            putStrLn "File content:"
            putStrLn contents
            handleFile inputFileName outputFileName
        "add" -> do
            putStrLn "Write new info for adding:"
            newInfo <- getLine
            appendFile inputFileName ('\n' : newInfo)
            putStrLn "Info added"
            handleFile inputFileName outputFileName
        "delete" -> do
            putStrLn "Write string number to delete:"
            lineNumberStr <- getLine
            let lineNumber = read lineNumberStr :: Int
            contents <- readFile inputFileName
            let fileLines = lines contents
            let newContents = unlines $ delete (fileLines !! (lineNumber - 1)) fileLines
            writeFile inputFileName newContents
            putStrLn "String deleted"
            handleFile inputFileName outputFileName
        "copy" -> do
            putStrLn "Choose filter:"
            putStrLn "1 - Delete numbers"
            putStrLn "2 - Get strings start with upper letter"
            filterChoiceStr <- getLine
            let filterChoice = read filterChoiceStr :: Int
            contents <- readFile inputFileName
            let filteredContent = case filterChoice of
                                    1 -> filter (\c -> not $ elem c ['0'..'9']) contents
                                    2 -> unlines $ filter (\line -> length line > 0 && isUpper (head line)) (lines contents)
                                    _ -> contents
            writeFile outputFileName filteredContent
            putStrLn $ "File copied to " ++ outputFileName
            handleFile inputFileName outputFileName
        "exit" -> putStrLn "Exit"
        _ -> putStrLn "Wrong Command" >> handleFile inputFileName outputFileName