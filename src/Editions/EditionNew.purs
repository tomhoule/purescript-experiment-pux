module Editions.EditionNew where

import Optic.Core (set)
import Pux.DOM.HTML (mapEvent, HTML)
import Prelude (discard, ($))
import Text.Smolder.Markup (text, (#!), (!))
import Text.Smolder.HTML (button, div, input)
import Text.Smolder.HTML.Attributes (className, type', value)
import Pux.DOM.Events (onChange, targetValue)
{-- import Data.Int as Int --}

import Models (EditionNew(..))
import Editions.New (_editor, _title)
import Editions.Events (EditionFormEvent(..))
import Events (Event(..))
import State (State)

editionForm :: State -> HTML Event
editionForm state = mapEvent EditionForm $ markup state

markup :: State -> HTML EditionFormEvent
markup state =
  let (EditionNew form) = state.editions.form
   in div ! className "section" $ do
     div ! className "container" $ do
       div ! className "field" $ do
         div ! className "label" $ text "Title"
         div ! className "control" $ do
           input ! type' "text"
                 ! className "input"
                 ! value form.title
                 #! (onChange $ \e -> Edit $ set _title (targetValue e))
       div ! className "field" $ do
         div ! className "label" $ text "Editor"
         div ! className "control" $ do
           input ! type' "text"
                 ! className "input"
                 ! value form.editor
                 #! (onChange $ \e -> Edit $ set _editor (targetValue e))
       {-- div ! className "field" $ do --}
       {--   div ! className "label" $ text "Year" --}
       {--   div ! className "control" $ do --}
       {--     input ! type' "text" --}
       {--           ! className "input" --}
       {--           ! value (maybe "" show form.year) --}
       {--           #! (onChange $ \e -> Edit $ set _year (Int.fromString $ targetValue e)) --}
       div ! className "field" $ do
         div ! className "control" $ do
           button ! className "button is-primary" $ text "Submit"
