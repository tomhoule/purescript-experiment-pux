module Home where

import Events (Event(Navigate))
import Pux.DOM.HTML (HTML)
import Pux.DOM.Events (onClick)
import State
import Prelude (($), discard)
import Text.Smolder.HTML (div, a)
import Text.Smolder.Markup (text, (#!), (!))
import Text.Smolder.HTML.Attributes (className, href)

home :: State -> HTML Event
home s =
  div ! className "section" $ do
    div ! className "container" $ do
      div $ text "This is the homepage"
      a ! href "/edition-new" #! onClick (Navigate "/editions/new") $ text "To the edition form!"
