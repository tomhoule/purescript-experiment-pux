module Models.Edition where

import Data.Maybe

type Edition =
  { title :: String
  , editor :: String
  , year :: Maybe Int
  , created_at :: String
  }
