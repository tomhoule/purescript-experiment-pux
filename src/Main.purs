module Main where

import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (log)
import Control.Monad.Eff (Eff)
import Data.Foreign (toForeign)
import Data.Maybe (Maybe(..))
import DOM.Event.Event (preventDefault)
import DOM.HTML (window)
import DOM.HTML.History (pushState, URL(..), DocumentTitle(..))
import DOM.HTML.Window (history)
import Prelude hiding (div)
import Pux (CoreEffects, EffModel, start, mapEffects, mapState, noEffects, onlyEffects)
import Pux.DOM.History (sampleURL)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (renderToDOM)
import Signal ((~>))

import Editions as Editions
import Effects (AppEffects)
import Events (Event(..), Route(..))
import Routes as R
import State (State)
import Shared.Header (header)

foldp :: Event -> State -> EffModel State Event AppEffects
foldp (EditionForm e) st = Editions.foldp e st.editionForm
  # mapEffects EditionForm
  # mapState \s -> st { editionForm = s }
foldp (PageView route) st = noEffects $ st { currentRoute = route }
foldp (Navigate url ev) st =
  onlyEffects st [ liftEff do
                     preventDefault ev
                     h <- history =<< window
                     pushState (toForeign {}) (DocumentTitle "") (URL url) h
                     pure $ Just $ R.match url
                 ]

view :: State -> HTML Event
view state = do
  header state
  R.page state.currentRoute state

main :: Eff (CoreEffects AppEffects) Unit
main = do
    log "Much types, very wow"

    url <- sampleURL =<< window
    let routeSignal = url ~> R.match

    app <- start
        { initialState:
          { currentRoute: Home
          , editionForm: Editions.emptyEdition }
        , view
        , foldp
        , inputs: [routeSignal]
    }

    renderToDOM "#app" app.markup app.input
