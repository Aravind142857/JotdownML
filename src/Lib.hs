module Lib (percentageToFloat, stringToStatus) where
    import Syntax

    percentageToFloat :: String -> Float
    percentageToFloat pctgStr = read (init pctgStr) / 100

    stringToStatus :: String -> Maybe Status
    stringToStatus s = case s of
        "Completed" -> Just Completed
        "Not Started" -> Just NotStarted
        "In Progress" -> Just InProgress
        _ -> Nothing