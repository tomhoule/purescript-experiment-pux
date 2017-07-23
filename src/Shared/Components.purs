module Shared.Components where

import Data.Monoid (mempty)
import DOM.Event.Types as DE
import Pux.DOM.Events (onClick)
import Text.Smolder.HTML (a, input)
import Text.Smolder.HTML.Attributes (href)
import Text.Smolder.Markup (Attribute, Markup, (#!), (!))

import Events (Event(Navigate))

link :: String -> Markup (DE.Event -> Event) -> Markup (DE.Event -> Event)
link url = linkWithAttrs mempty url

linkWithAttrs :: Attribute -> String -> Markup (DE.Event -> Event) -> Markup (DE.Event -> Event)
linkWithAttrs attr url = a ! attr ! href url #! onClick (Navigate url)
