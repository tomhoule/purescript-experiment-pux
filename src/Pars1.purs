module Pars1 where

import Data.Array ((!!))
import Data.Monoid (mempty)
import Data.Foldable (foldMap)
import Data.Maybe (maybe', maybe)
import Events (Event)
import Pux.DOM.HTML (HTML)
import State (State)
import Prelude (discard, show, ($), (<>))
import Text.Smolder.HTML (div)
import Text.Smolder.Markup (text, (!))
import Text.Smolder.HTML.Attributes (className)
import Models (Schema(..), Node(..), NumberedFragment(..), ScopeDescriptor(..))

index :: Int -> State -> HTML Event
index num s =
  div ! className "section" $ do
    div ! className "container" $ do
      maybe' (\_ -> div $ text "Loading") (\schema -> render schema num) s.schema

render :: Schema -> Int -> HTML Event
render (Schema parts) num = maybe' (\_ -> div $ text "Wrong part") renderNode (parts !! num)

renderNodes :: Array Node -> HTML Event
renderNodes node = foldMap renderNode node

simpleNode :: String -> NumberedFragment -> HTML Event
simpleNode ty (NumberedFragment nf) = div $ do
  div ! className "title" $ text $ ty <> " " <> maybe mempty show nf.num
  div ! className "left-indent" $ renderNodes nf.children

titleDiv :: HTML Event -> HTML Event
titleDiv children = div ! className "title" $ children

renderNode :: Node -> HTML Event
renderNode (AnonymousFragment (NumberedFragment nf)) = div $ do
  text $ maybe mempty show nf.num <> "- "
  renderNodes nf.children
renderNode Aliter = titleDiv $ text "aliter"
renderNode Appendix = div $ text "appendix"
renderNode (Axioma nf) = simpleNode "axioma" nf
renderNode (Caput nf) = simpleNode "caput" nf
renderNode (Corollarium nf) = simpleNode "corollarium" nf
renderNode (Definitio nf) = simpleNode "definitio" nf
renderNode Demonstratio = div ! className "title" $ text "demonstratio"
renderNode Explicatio = div ! className "title" $ text "explicatio"
renderNode (Scope (ScopeDescriptor dsc)) = div $ do
  div ! className "title" $ text dsc.title
  div ! className "left-indent" $ renderNodes dsc.children
renderNode (Pars nf) = simpleNode "pars" nf
renderNode (Propositio nf) = simpleNode "propositio" nf
renderNode (Scholium nf) = simpleNode "scholium" nf
renderNode (Praefatio) = div $ text "praefatio"
renderNode (Lemma nf) = simpleNode "lemma" nf
renderNode (Postulatum nf) = simpleNode "postulatum" nf
