module State where

import Data.Maybe
import Models (Schema)
import Editions (EditionsState)
import Events (Route)
import Config

type State =
  { config :: Config
  , currentRoute :: Route
  , schema :: Maybe Schema
  , editions :: EditionsState
  }
