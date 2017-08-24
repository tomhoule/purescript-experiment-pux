module Editions.Single where

import Data.Maybe
import Pux.DOM.HTML (mapEvent, HTML)
import Prelude (discard, ($), (==))
import Text.Smolder.Markup (text, (#!), (!))
import Text.Smolder.HTML (button, div, input)
import Text.Smolder.HTML.Attributes (className, type', value)
import Pux.DOM.Events (onChange, targetValue)
{-- import Data.Int as Int --}

import Models (Edition)
import Editions.New (_editor, _title)
import Editions.Events (EditionFormEvent(..))
import Events (Event(..))
import State (State)

type EditionSlug = String

extract :: EditionSlug -> State -> Maybe Edition
extract slug st = if st.editions.single.slug == slug
  then Just st.editions.single.slug
  else Nothing

edition :: EditionSlug -> State -> HTML Event
edition slug st = maybe ?a ?b (extract slug st)

{-- edition :: Edition -> State -> HTML Event --}
{-- edition (Edition st) = --}
{--   let (Edition ed) = state.editions.single --}
{--     in div ! className "section" $ do --}
{--       div ! className "container" $ do --}
