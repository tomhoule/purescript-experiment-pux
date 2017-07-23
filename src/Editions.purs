module Editions where

import Prelude hiding (div)
import Data.Maybe
import Pux.DOM.Events (onClick, onChange, DOMEvent, targetValue)
import Pux (EffModel)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)

import Effects

emptyEdition :: EditionFormState
emptyEdition = { status: "Uninitialized", title: "", editor: "", year: Nothing }

data EditionFormEvent = Initialize | Edit DOMEvent

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
