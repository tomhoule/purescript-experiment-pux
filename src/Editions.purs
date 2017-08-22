module Editions where

import Data.Maybe (Maybe)
import Prelude (($), map)
import Pux (EffModel, onlyEffects, noEffects)

import Effects (AppEffects)
import Editions.Events (EditionFormEvent(..))
import Models (Edition, EditionNew(..))
import Models (EditionNew)

type EditionsState =
  { form :: EditionNew
  , index :: Maybe (Array Edition)
  }

foldp :: EditionFormEvent -> EditionsState -> EffModel EditionsState EditionFormEvent AppEffects
foldp (Edit l) st = noEffects $ st{form = l st.form}
foldp Index st = onlyEffects st []
