module Home where

import Events (Event)
import Pux.DOM.HTML (HTML)
import State
import Prelude (($), discard)
import Text.Smolder.HTML (div)
import Text.Smolder.Markup (text, (!))
import Text.Smolder.HTML.Attributes (className)

import Shared.Components (link)

home :: State -> HTML Event
home s =
  div ! className "section" $ do
    div ! className "container" $ do
      div $ text "This is the homepage"
      link "/editions/new" $ text "To the edition form!!!!!!"
      link "/pars1" $ text "To the first part"
