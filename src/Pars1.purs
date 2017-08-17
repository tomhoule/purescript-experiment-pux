module Pars1 where

import Data.Foldable
import Control.Apply
import Control.Monad.Free
import Data.Maybe
import Control.Alt ((<|>))
import Events (Event)
import Pux.DOM.HTML (HTML)
import State
import Prelude
import Text.Smolder.HTML (div)
import Text.Smolder.Markup (text, (!), MarkupM)
import Text.Smolder.HTML.Attributes (className)
import Models (Schema(..), Node(..), NumberedFragment(..))

import Shared.Components (link)

index :: State -> HTML Event
index s =
  div ! className "section" $ do
    div ! className "container" $ do
      div $ text "Pars prima"
      maybe' (\_ -> div $ text "Loading") render s.schema


render :: Schema -> HTML Event
render (Schema parts) = div $
  foldMap renderNode parts

renderNode :: Node -> HTML Event
renderNode (AnonymousFragment _) = div $ text "..."
renderNode Aliter = div $ text "aliter"
renderNode Appendix = div $ text "appendix"
renderNode (Axioma _) = div $ text "axioma"
renderNode (Caput _) = div $ text "caput"
renderNode (Corollarium _) = div $ text "corollarium"
renderNode (Definitio _) = div $ text "Definitio"
renderNode Demonstratio = div $ text "demonstratio"
renderNode Explicatio = div $ text "explicatio"
renderNode (Scope _) = div $ text "scope"
renderNode (Pars (NumberedFragment nf)) = div $ text ("pars " <> (show nf.num)) >>= \_ -> foldMap renderNode nf.children
renderNode (Propositio _) = div $ text "propositio"
renderNode (Scholium _) = div $ text "scholium"
renderNode _ = div $ text "unimplemented"
