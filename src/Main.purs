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
import Prelude (Unit, bind, discard, pure, (#), ($), (<#>), (=<<))
import Pux (CoreEffects, EffModel, start, mapEffects, noEffects, onlyEffects)
import Pux.DOM.History (sampleURL)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (renderToDOM)
import Signal ((~>))

import Editions as Editions
import Editions.New (emptyEdition)
import Effects (AppEffects)
import Events (Event(..), Route(..))
import Routes as R
import State (State)
import Shared.Header (header)
import API (schema)
import Signal.Channel (channel, send, subscribe)
import Config

foldp :: Event -> State -> EffModel State Event AppEffects
foldp (EditionForm e) st = Editions.foldp e st
  # mapEffects EditionForm
foldp Initialize st = onlyEffects st [
  schema st <#> \a -> Just (ReceiveSchema a)
  ]
foldp (ReceiveSchema s) st = noEffects $ st { schema = Just s }
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
    initChannel <- channel Initialize

    let config = Config { apiURL: "http://localhost:8000" }

    app <- start
        { initialState:
          { config: config
          , currentRoute: Home
          , schema: Nothing
          , editions:
            { form: emptyEdition
            , index: Nothing
            , single: Nothing
            }
        }
        , view
        , foldp
        , inputs: [routeSignal, subscribe initChannel]
    }

    send initChannel Initialize

    renderToDOM "#app" app.markup app.input
