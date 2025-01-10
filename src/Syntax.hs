module Syntax where

-- | Name for the Task
newtype TaskName = TaskName String deriving (Show, Eq)

-- | Status for the Task: completed or in-progress or not started
data Status = Completed | InProgress | NotStarted deriving(Show, Eq, Read)

-- | Person assigned to the task
data AssignedTo = AssignedTo { name :: String, numTasks :: Int } deriving (Show, Eq)

-- | Progress on the task as a percentage
newtype Progress = Progress Float deriving (Show, Eq)

-- | Deadline as a string
newtype Deadline = Deadline String deriving (Show, Eq)

-- | A task structure
data Task = Task { getTaskName :: TaskName, getStatus :: Maybe Status, getAssignedTo :: AssignedTo, getProgress :: Progress, getDeadline :: Deadline } deriving (Show, Eq)

-- | A Milestone: a name and a list of tasks
data Milestone = Milestone { getMilestoneName :: String, getTasks :: [Task]} deriving (Show, Eq)

-- | A Project: a name and a list of milestones
data Project = Project { getProjectName :: String, getMilestones :: [Milestone]} deriving (Show, Eq)

x = do
 putStrLn "Hello there"
 putStrLn ("Please see my favorite odd numbers: " ++ show (filter odd [10..20]))