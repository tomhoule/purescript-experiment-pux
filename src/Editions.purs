module Editions where

import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (log)
import Data.Array
import Data.Maybe (Maybe(..))
import Prelude (pure, ($), (*>))
import Pux (onlyEffects, noEffects)
import Pux.DOM.Events (targetValue)
import Pux (EffModel)

import Effects (AppEffects)
import Editions.Events (EditionFormEvent(..))
import Editions.New
import Models.Edition

type EditionsState =
  { form :: EditionFormState
  , index :: Maybe (Array Edition)
  }

foldp :: EditionFormEvent -> EditionsState -> EffModel EditionsState EditionFormEvent AppEffects
foldp (Edit l) st = noEffects $ st{form = l st.form}
foldp Index st = onlyEffects st []
