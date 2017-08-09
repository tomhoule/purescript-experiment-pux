module State where

import Data.Maybe
import Models (Schema)
import Editions (EditionsState)
import Events (Route)

type State =
  { currentRoute :: Route
  , schema :: Maybe Schema
  , editions :: EditionsState
  }
