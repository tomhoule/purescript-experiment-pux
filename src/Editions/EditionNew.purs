module Editions.EditionNew where

import Pux.DOM.HTML (mapEvent, HTML)
import Prelude (const, discard, ($))
import Pux.DOM.Events (onClick, onChange)
import Text.Smolder.Markup (text, (#!), (!))
import Text.Smolder.HTML (button, div, input)
import Text.Smolder.HTML.Attributes (className, type', value)

import Editions.Events
import Events (Event(..))
import State (State)

editionForm :: State -> HTML Event
editionForm state = mapEvent EditionForm $ markup state

markup :: State -> HTML EditionFormEvent
markup state =
  div ! className "section" $ do
    div ! className "container" $ do
      div $ text state.editionForm.status
      input ! type' "text" ! value state.editionForm.title #! (onChange $ \e -> (Edit e))
      button ! className "button" #! onClick (const $ Initialize) $ text "Initialize"
