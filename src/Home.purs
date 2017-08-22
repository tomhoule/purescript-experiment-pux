module Home where

import Models (Edition(..))
import Data.Foldable (foldMap)
import Data.Maybe (maybe)
import Events (Event)
import Pux.DOM.HTML (HTML)
import State
import Prelude (($), discard)
import Text.Smolder.HTML (div, br)
import Text.Smolder.Markup (text, (!))
import Text.Smolder.HTML.Attributes (className)

import Shared.Components (link)

home :: State -> HTML Event
home st =
  div ! className "section" $ do
    div ! className "container" $ do
      div $ text "This is the homepage"
      link "/editions/new" $ text "To the edition form"
      br
      link "/pars1" $ text "To the first part"
      div $ do
        maybe (text "No edition") (\editions -> foldMap (\(Edition ed) -> div $ text ed.title) editions) st.editions.index
