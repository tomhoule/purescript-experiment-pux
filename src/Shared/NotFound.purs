module Shared.NotFound where

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div)
import Text.Smolder.HTML.Attributes (className)
import Text.Smolder.Markup (text, (!))
import Prelude (discard, ($))

import Events
import Shared.Components (link)

notFound :: HTML Event
notFound =
  div ! className "section" $ do
    div ! className "container" $ do
      div ! className "has-text-centered subtitle is-1" $ text "¯\\_(ツ)_/¯"
      div ! className "has-text-centered subtitle is-3" $ text "Page not found"
      div ! className "has-text-centered" $ link "/" $ text "Back to the homepage"
