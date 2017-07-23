module Shared.Components where

import DOM.Event.Types as DE
import Pux.DOM.Events (onClick)
import Text.Smolder.HTML (a)
import Text.Smolder.HTML.Attributes (href)
import Text.Smolder.Markup (Markup, (#!), (!))

import Events (Event(Navigate))

link :: String -> Markup (DE.Event -> Event) -> Markup (DE.Event -> Event)
link url = a ! href url #! onClick (Navigate url)
