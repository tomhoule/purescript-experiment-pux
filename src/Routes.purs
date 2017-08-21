module Routes where

import Control.Alt ((<|>))
import Prelude (($), (<*), (*>), (<$), (<$>))
import Data.Maybe (fromMaybe)
import Pux.DOM.HTML (HTML)
import Pux.Router (router, lit, int, end)

import Pars1 as P1
import Editions.EditionNew (editionForm)
import Home as HomeP
import State (State)
import Events (Route(..), Event(..))
import Shared.NotFound (notFound)

match :: String -> Event
match url = PageView $ fromMaybe NotFound $ router url $
  Home <$ end
  <|>
  EditionNew <$ (lit "editions" *> lit "new") <* end
  <|>
  Pars <$> (lit "pars" *> int) <* end

page :: Route -> (State -> HTML Event)
page Home = HomeP.home
page EditionNew = editionForm
page NotFound = \s -> notFound
page (Pars num) = P1.index num
