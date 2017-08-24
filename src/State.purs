module State where

import Data.Maybe (Maybe)
import Models (Schema)
import Editions.State (EditionsState)
import Events (Route)
import Config (Config)

type State =
  { config :: Config
  , currentRoute :: Route
  , schema :: Maybe Schema
  , editions :: EditionsState
  }
