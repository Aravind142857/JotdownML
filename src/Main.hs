module Main (main) where
import Parsing (parseProject)
import Pretty (prettyPrintProject)

main :: IO ()
main = do
  input <- readFile ".jotdown"

  -- Parse the Input
  case parseProject input of
    Left err -> putStrLn $ "Parse error: " ++ show err
    Right project -> do
      putStrLn "Pretty-printed project:\n"
      let output = prettyPrintProject project
      putStrLn output
      -- Write to index.html
      writeFile "index.html" output


-- [Ship the product]
--   - Task: Create CLI that will create the HTML
--     - Status: Not Started
--     - Assigned To: 
--     - Deadline: 
--     - Progress: 

--   - Task: Create a webpage that will convert and display
--     - Status: Not Started
--     - Assigned To: 
--     - Deadline: 
--     - Progress:

-- [---]