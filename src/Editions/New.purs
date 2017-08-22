module Editions.New where

import Optic.Core
import Data.Maybe (Maybe(..))
import Models (EditionNew(..))

emptyEdition :: EditionNew
emptyEdition = EditionNew { title: "", editor: "", year: 1677, language_code: "la" }

_editor :: Lens' EditionNew String
_editor = lens (\(EditionNew f) -> f.editor) (\(EditionNew f) s -> EditionNew f{editor = s})

_title :: Lens' EditionNew String
_title = lens (\(EditionNew f) -> f.title) (\(EditionNew f) s -> EditionNew f{title = s})

_year :: Lens' EditionNew Int
_year = lens (\(EditionNew f) -> f.year) (\(EditionNew f) s -> EditionNew f{year = s})
