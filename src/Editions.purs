module Editions where

import Data.Maybe (Maybe)
import Prelude (($))
import Pux (EffModel, onlyEffects, noEffects)

import Effects (AppEffects)
import Editions.Events (EditionFormEvent(..))
import Editions.New (EditionFormState)
import Models.Edition (Edition)

type EditionsState =
  { form :: EditionFormState
  , index :: Maybe (Array Edition)
  }

foldp :: EditionFormEvent -> EditionsState -> EffModel EditionsState EditionFormEvent AppEffects
foldp (Edit l) st = noEffects $ st{form = l st.form}
foldp Index st = onlyEffects st []
