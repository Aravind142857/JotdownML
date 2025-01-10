module Pretty (prettyPrintProject) where
    import Syntax

    -- | Pretty print a single Task
    prettyPrintTask :: Task -> String
    prettyPrintTask t = 
        "<h3>" ++ show (getTaskName t) ++ "</h3>\n"
        ++ "<p>Status: " ++ show (getStatus t) ++ "</p>"
        ++ "<p>Assigned To: " ++ show (getAssignedTo t) ++ "</p>"
        ++ "<p>Progress: " ++ show (getProgress t) ++ "</p>"
        ++ "<p>Deadline: " ++ show (getDeadline t) ++ "</p>\n"

    -- | Pretty print a Milestone
    prettyPrintMilestone :: Milestone -> String
    prettyPrintMilestone m =
        "<h2>" ++ show (getMilestoneName m) ++ "</h2>\n"
        ++ concatMap prettyPrintTask (getTasks m)

    -- | Pretty print a project
    prettyPrintProject :: Project -> String
    prettyPrintProject p =
        "<h1>" ++ show (getProjectName p) ++ "</h1>\n"
        ++ concatMap prettyPrintMilestone (getMilestones p)