{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where
import Log
import Data.List.Split
import Data.List

splitMessage :: String -> [String]
splitMessage message = splitOn " " message
mergeMessage :: [String] -> String
mergeMessage = intercalate " "

-- parseMessage "E 2 562 help help"
-- == LogMessage (Error 2) 562 "help help"
-- cis 194: homework 2 3
-- parseMessage "I 29 la la la"
-- == LogMessage Info 29 "la la la"
-- parseMessage "This is not in the right format"
-- == Unknown "This is not in the right format"
parseMessage :: String -> LogMessage
parseMessage message = identifyType $ splitMessage message

identifyType :: [String] -> LogMessage
identifyType x = case x of
  "E" : message -> LogMessage (Error (getMessageEntry 0 message)) (getMessageEntry 1 message) (mergeMessage $ dropNEntries 2 message)
  "I" : message -> LogMessage Info (getMessageEntry 0 message) (mergeMessage $ dropNEntries 1 message)
  "W" : message -> LogMessage Warning (getMessageEntry 0 message) (mergeMessage $ dropNEntries 1 message)
  message -> Unknown (mergeMessage message)

getMessageEntry :: Int -> [String] -> Int
getMessageEntry index message = read (message !! index)

dropNEntries :: Int -> [String] -> [String]
dropNEntries n message = drop n message
