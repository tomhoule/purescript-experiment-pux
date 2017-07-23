module Routes where

import Control.Alt ((<|>))
import Prelude (($), (<*), (*>), (<$))
import Data.Maybe (fromMaybe)
import Pux.DOM.HTML (HTML)
import Pux.Router (router, lit, end)

import Editions.Elements (editionForm)
import Home as HomeP
import State (State)
import Events (Route(..), Event(..))

match :: String -> Event
match url = PageView $ fromMaybe NotFound $ router url $
  Home <$ end
  <|>
  EditionNew <$ (lit "editions" *> lit "new") <* end

page :: Route -> (State -> HTML Event)
page Home = HomeP.home
page EditionNew = editionForm
page NotFound = HomeP.home
