module Editions where

import Control.Monad.Aff
import Data.Maybe(Maybe(..))
import Prelude (($), (<*>), (<$>), (>>=), pure, (<#>))
import Pux (EffModel, onlyEffects, noEffects)

import API (createEdition)
import Effects (AppEffects)
import Editions.Events (EditionFormEvent(..))
import State
import Models (Edition, EditionNew(..))

foldp :: EditionFormEvent -> State -> EffModel State EditionFormEvent AppEffects
foldp (Edit s) st = noEffects $ st{editions {form = s st.editions.form}}
foldp (Submit f) st = onlyEffects st [
    createEdition f st <#> \ed -> Just $ ReceiveEdition ed
  ]
foldp Index st = onlyEffects st []
foldp (ReceiveEdition ed) st = noEffects $ st{editions {single = Just ed}}
