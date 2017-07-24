module Editions where

import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (log)
import Data.Maybe (Maybe(..))
import Prelude (pure, ($), (*>))
import Pux.DOM.Events (targetValue)
import Pux (EffModel)

import Effects (AppEffects)
import Editions.Events (EditionFormEvent(..))

emptyEdition :: EditionFormState
emptyEdition = { status: "Uninitialized", title: "", editor: "", year: Nothing }

type EditionFormState = {
    status :: String
  , title :: String
  , editor :: String
  , year :: Maybe Int
  }

foldp :: EditionFormEvent -> EditionFormState -> EffModel EditionFormState EditionFormEvent AppEffects
foldp (Edit e) s =
  { state: s { title = (targetValue e) }
  , effects: [ liftEff $ log s.title *> pure Nothing ] }
foldp Initialize s = { state: s { status = "Initialized" } , effects: [] }
