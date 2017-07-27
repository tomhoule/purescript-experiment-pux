module Models.Edition where

import Data.Generic (class Generic)
import Data.Maybe
import Network.HTTP.Affjax.Response

data Edition = Edition
  { title :: String
  , editor :: String
  , year :: Maybe Int
  , created_at :: String
  }

derive instance genericEdition :: Generic Edition
