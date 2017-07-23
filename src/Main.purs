module Main where

import Control.Monad.Eff.Console (log)
import Control.Monad.Eff (Eff)
import Prelude hiding (div)
import DOM.HTML (window)
import Pux (CoreEffects, EffModel, start, mapEffects, mapState)
import Pux.DOM.History (sampleURL)
import Pux.DOM.Events (onClick, onChange)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (renderToDOM)
import Text.Smolder.HTML.Attributes (className, type', value)
import Text.Smolder.HTML (button, div, h1, h2, input)
import Text.Smolder.Markup (text, (#!), (!))

import Editions as Editions
import Effects (AppEffects)
import Events (Event(..))

type State = {
    editionForm :: Editions.EditionFormState
  }

foldp :: Event -> State -> EffModel State Event AppEffects
foldp (EditionForm e) s = Editions.foldp e s.editionForm
  # mapEffects EditionForm
  # mapState \st -> s { editionForm = st }

header :: HTML Event
header =
  div ! className "hero is-primary" $ do
    div ! className "hero-body" $ do
      div ! className "container" $ do
        h1 ! className "title" $ text "Locutions"
        h2 ! className "subtitle" $ text "Ethica"
        h2 ! className "subtitle" $ text "Spinoza"

view :: State -> HTML Event
view state = do
  header
  div ! className "section" $ do
    div ! className "container" $ do
      div $ text state.editionForm.status
      input ! type' "text" ! value state.editionForm.title #! (onChange $ \e -> EditionForm (Editions.Edit e))
      button ! className "button" #! onClick (const $ EditionForm Editions.Initialize) $ text "Initialize"

main :: Eff (CoreEffects AppEffects) Unit
main = do
    log "Much types, very wow"
    url <- sampleURL =<< window
    app <- start
        { initialState:
          { editionForm: Editions.emptyEdition }
        , view
        , foldp
        , inputs: []
    }
    renderToDOM "#app" app.markup app.input
