module Editions where

import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Maybe
import Prelude hiding (div)
import Pux.DOM.Events (onClick, onChange, DOMEvent, targetValue)
import Pux (EffModel)

import Effects
import Editions.Events

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

