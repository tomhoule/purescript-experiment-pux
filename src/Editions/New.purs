module Editions.New where

import Optic.Core
import Data.Maybe (Maybe(..))

emptyEdition :: EditionFormState
emptyEdition = { status: "Uninitialized", title: "", editor: "", year: Nothing }

type EditionFormState =
  { status :: String
  , title :: String
  , editor :: String
  , year :: Maybe Int
  }

_status :: Lens' EditionFormState String
_status = lens (\f -> f.status) (\f s -> f{status = s})

_editor :: Lens' EditionFormState String
_editor = lens (\f -> f.editor) (\f s -> f{editor = s})

_title :: Lens' EditionFormState String
_title = lens (\f -> f.title) (\f s -> f{title = s})

_year :: Lens' EditionFormState (Maybe Int)
_year = lens (\f -> f.year) (\f s -> f{year = s})
