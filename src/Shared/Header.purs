module Shared.Header where

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div, h1, h2, ul, li)
import Text.Smolder.HTML.Attributes (className)
import Text.Smolder.Markup (text, (!))
import Prelude (discard, ($))

import Events
import Shared.Components (link, linkWithAttrs)
import State (State)

header :: State -> HTML Event
header state =
  div ! className "hero is-primary" $ do
    div ! className "hero-body" $ do
      div ! className "container" $ do
        h1 ! className "title" $ text "Ethica"
        h2 ! className "subtitle" $ text "More geometrico demonstrata"
        h2 ! className "subtitle" $ text "Spinoza"
    div ! className "hero-foot" $ do
      div ! className "tabs is-boxed is-fullwidth" $ do
        div ! className "container" $ do
          ul $ do
            li ! className "is-active" $ link "/pars1" $ text "Pars prima"
            li $ link "/pars1" $ text "Pars secunda"
            li $ link "/pars1" $ text "Pars tertia"
            li $ link "/pars1" $ text "Pars quarta"
            li $ link "/pars1" $ text "Pars quinta"
