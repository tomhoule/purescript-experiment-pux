module Shared.Header where

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div, h1, h2)
import Text.Smolder.HTML.Attributes (className)
import Text.Smolder.Markup (text, (!))
import Prelude (discard, ($))

import Events

header :: HTML Event
header =
  div ! className "hero is-primary" $ do
    div ! className "hero-body" $ do
      div ! className "container" $ do
        h1 ! className "title" $ text "Locutions"
        h2 ! className "subtitle" $ text "Ethica"
        h2 ! className "subtitle" $ text "Spinoza"
