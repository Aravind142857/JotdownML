module Pretty (prettyPrintProject, indentDocument) where
    import Syntax

    -- | Pretty print a single Task
    prettyPrintTask :: Task -> String
    prettyPrintTask t = 
        "<h3 style='padding-left:8%'>" ++ show (getTaskName t) ++ "</h3>\n<div style='padding-left:10%'>"
        ++ "<p>Status: " ++ show (getStatus t) ++ "</p>"
        ++ "<p>Assigned To: " ++ show (getAssignedTo t) ++ "</p>"
        ++ "<p>Progress: " ++ show (getProgress t) ++ "</p>"
        ++ "<p>Deadline: " ++ show (getDeadline t) ++ "</p></div>\n"

    -- | Pretty print a Milestone
    prettyPrintMilestone :: Milestone -> String
    prettyPrintMilestone m =
        "<h2 style='padding-left:5%'>" ++ getMilestoneName m ++ "</h2>\n"
        ++ concatMap prettyPrintTask (getTasks m)

    -- | Pretty print a project
    prettyPrintProject :: Project -> String
    prettyPrintProject p =
        "<h1><center>" ++ getProjectName p ++ "</h1>\n"
        ++ concatMap prettyPrintMilestone (getMilestones p)

    -- | Add CSS to document
    indentDocument :: String -> String
    indentDocument doc = 
        "<div style='padding-left:15%;padding-right:15%'>" ++ doc ++ "</div>"

-- Next: Parse Deadline as Date, obtain number of tasks per person. styling. flattening structures.