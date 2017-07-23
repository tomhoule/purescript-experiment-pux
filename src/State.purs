module State where

import Editions
import Events (Route)

type State =
  { currentRoute :: Route
  , editionForm :: EditionFormState
  }
