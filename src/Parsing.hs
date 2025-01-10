module Parsing (parseProject) where
    import Text.Megaparsec
    import Text.Megaparsec.Char
    import Text.Read
    import Data.Text (Text, pack, strip, unpack,)
    import Data.Void (Void)
    import System.Environment
    import Syntax
    import Lib

    type Parser = Parsec Void Text

    parseProject :: String -> Either (ParseErrorBundle Text Void) Project
    parseProject input = parse documentP "" (pack input)  -- Parse the first argument, converting to Text
    
    -- | Document parser: handles the entire document, starting with headers and then content.
    documentP :: Parser Project
    documentP = do
        -- Parse the document header and then parse all sections
        projectTitle <- projectTitleP
        _ <- newline
        m <- many (try milestoneP)
        return $ Project projectTitle m

    projectTitleP :: Parser String
    projectTitleP = do
        _ <- char '#' -- The # at the start
        _ <- space -- Space after #
        manyTill anySingle (try newline) -- Parse till newline


    milestoneP :: Parser Milestone
    milestoneP = do
        _ <- count 2 (char '#')
        _ <- space
        title <- manyTill anySingle (try newline)
        t <- many (try taskP)
        return $ Milestone title t--"<h2>" ++ title ++ "</h2>" ++ "\n" ++ concat (task) ++ "\n"

    taskP :: Parser Task
    taskP = do
        _ <- some (char ' ' <|> char '-')
        title' <- manyTill anySingle (try newline)
        _ <- some (char ' ' <|> char '-')
        _ <- string (pack "Status")
        _ <- some (char ' ' <|> char ':')
        status' <- manyTill anySingle (try newline)
        _ <- some (char ' ' <|> char '-')
        assignedTo' <- manyTill anySingle (try newline)
        _ <- some (char ' ' <|> char '-')
        _ <- string (pack "Deadline")
        _ <- some (char ' ' <|> char ':')
        deadline' <- manyTill anySingle (try newline)
        _ <- some (char ' ' <|> char '-')
        _ <- string (pack "Progress")
        _ <- some (char ' ' <|> char ':')
        progress' <- manyTill anySingle (try newline)
        _ <- optionalNewLineP
        return $ Task (TaskName title') (stringToStatus status') (AssignedTo assignedTo' 0) (Progress (percentageToFloat progress')) (Deadline deadline')--"<h3>" ++ title ++ "</h3>" ++ "\n" ++ "<p>" ++ status ++ " " ++ assignedto ++ " " ++ deadline ++ " " ++ progress ++ "</p>" ++ "\n"

    optionalNewLineP :: Parser ()
    optionalNewLineP = optional newline >> return ()
    