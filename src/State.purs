module State where

import Editions (EditionsState)
import Events (Route)

type State =
  { currentRoute :: Route
  , editions :: EditionsState
  }
